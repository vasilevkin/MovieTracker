//
//  FeaturedViewModel.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 30/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

final class FeaturedViewModel: ViewModelType {
    
    struct Input {
        let ready: Driver<Void>
        let selected: Driver<(Int, Int)>
    }
    
    struct Output {
        let loading: Driver<Bool>
        let results: Driver<[CarouselViewModel]>
        let selected: Driver<Void>
    }
    
    struct Dependencies {
        let api: ApiThemoviedb
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func transform(input: FeaturedViewModel.Input) -> FeaturedViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let loading = activityIndicator.asDriver()
        
        let results = input
            .ready
            .asObservable()
            .flatMap {
                Observable.zip(self.dependencies.api.fetchPopularMovies(),
                               self.dependencies.api.fetchPopularTVShows())
                    .trackActivity(activityIndicator)
            }
            .share()
        
//        let mappedResults = results
            .map { movies, tvShows in
                return [CarouselViewModel(movies: movies),
                        CarouselViewModel(tvShows: tvShows)]
                    .compactMap { $0 }
            }
            .asDriver(onErrorJustReturn: [])
        
        let selected = input
            .selected
            .asObservable()
            .withLatestFrom(results) { ($0, $1 ) }
            .map { _ in () }
            .asDriver(onErrorJustReturn: ())
        
        return Output(loading: loading,
                      results: mappedResults,
                      selected: selected)
    }
    
}
