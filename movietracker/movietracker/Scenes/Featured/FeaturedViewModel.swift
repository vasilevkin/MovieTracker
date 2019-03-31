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
        let coordinator: FeaturedCoordinatable
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
        
        let mappedResults = results
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
            .do(onNext: { [weak self] (index: (Int, Int), result: ([Movie]?, [TVShow]?)) in
                guard let strongSelf = self else {
                    dLog("Unexpectedly found nil")
                    return
                }
                let (carouselIndex, itemIndex) = index
                let (movies, tvShows) = result
                
                switch carouselIndex {
                case 0:
                    guard let movieId = movies?[itemIndex].movieId else {
                        dLog("Unexpectedly found nil")
                        return
                    }
                    strongSelf.dependencies.coordinator.navigateToMovieDetailScene(
                        with: movieId, api: strongSelf.dependencies.api)
                    
                case 1:
                    guard let tvShowId = tvShows?[itemIndex].tvShowId else {
                        dLog("Unexpectedly found nil")
                        return
                    }
                    strongSelf.dependencies.coordinator.navigateToTVShowDetailScene(
                        with: tvShowId, api: strongSelf.dependencies.api)

                default:
                    dLog("Unexpectedly found nil")
                    return
                }
            })
            .map { _ in () }
            .asDriver(onErrorJustReturn: ())
        
        return Output(loading: loading,
                      results: mappedResults,
                      selected: selected)
    }
    
}
