//
//  MovieDetailViewModel.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 02/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

enum ItemDetailType {
    case movie
    case tvShow
}

final class MovieDetailViewModel: ViewModelType {
    
    struct Input {
        let ready: Driver<Void>
        let backTrigger: Driver<Void>
    }
    
    struct Output {
        let data: Driver<MovieDetailData?>
        let back: Driver<Void>
    }
    
    struct Dependencies {
        let itemDetailType: ItemDetailType
        let movieId: Int
        let api: ApiThemoviedb
        let coordinator: MovieDetailCoordinatable
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func transform(input: MovieDetailViewModel.Input) -> MovieDetailViewModel.Output {
        
        let back = input.backTrigger
            .do(onNext: { [weak self] _ in
                guard let strongSelf = self else {
                    dLog("Unexpectedly found nil")
                    return
                }
                strongSelf.dependencies.coordinator.goBack()
            })
        
        switch self.dependencies.itemDetailType {
            
        case .movie:
            let data = input.ready
                .asObservable()
                .flatMap { _ in
                    self.dependencies.api.fetchMovieDetails(for: self.dependencies.movieId)
                }
                .map { movie -> MovieDetailData? in
                    guard let movie = movie else {
                        dLog("Unexpectedly found nil")
                        return nil
                    }
                    return MovieDetailData(movie: movie)
                }
                .asDriver(onErrorJustReturn: nil)
            
            return Output(data: data, back: back)
            
        case .tvShow:
            let data = input.ready
                .asObservable()
                .flatMap { _ in
                    self.dependencies.api.fetchTVShowDetails(for: self.dependencies.movieId)
                }
                .map { tvShow -> MovieDetailData? in
                    guard let tvShow = tvShow else {
                        dLog("Unexpectedly found nil")
                        return nil
                    }
                    return MovieDetailData(tvShow: tvShow)
                }
                .asDriver(onErrorJustReturn: nil)
            
            return Output(data: data, back: back)
        }
    }
    
}
