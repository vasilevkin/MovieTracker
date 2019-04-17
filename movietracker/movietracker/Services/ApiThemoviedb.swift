//
//  ApiThemoviedb.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 27/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

/**
 Service communicates with themoviedb.org api
 Concrete implementation for a ApiThemoviedbService protocol
 */
final class ApiThemoviedb: ApiThemoviedbService {

    private let httpClient: HTTPClientService
    private let constants: Secret
    
    init(httpClient: HTTPClientService = HTTPClient(), constants: Secret = Secret()) {
        self.httpClient = httpClient
        self.constants = constants
    }
    
    // MARK: - Movies

    func fetchPopularMovies() -> Observable<[Movie]?> {
        return httpClient
            .get(url: "https://api.themoviedb.org/3/discover/movie?api_key=\(constants.themoviedbApiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false")
            .map { data -> [Movie]? in
                guard let data = data,
                    let response = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
                        dLog("Unexpectedly found nil")
                        return nil
                }
                return response.results
        }
    }
    
    func fetchMovieDetails(for movieId: Int) -> Observable<Movie?> {
        dLog("movieId = \(movieId)")
        
        return httpClient
            .get(url: "https://api.themoviedb.org/3/movie/\(movieId)?api_key=\(constants.themoviedbApiKey)&language=en-US)")
            .map { data -> Movie? in
                guard let data = data else {
                    dLog("Unexpectedly found nil")
                    return nil
                }
                do {
                    let response = try JSONDecoder().decode(Movie.self, from: data)
                    return response
                } catch {
                    dLog("JSONDecoder decode error: \(error)")
                    return nil
                }
        }
    }

    func fetchMovieVideos(for movieId: Int) -> Observable<[Video]?> {
        dLog("movieId = \(movieId)")
        
        return httpClient
            .get(url: "https://api.themoviedb.org/3/movie/\(movieId)/videos?api_key=\(constants.themoviedbApiKey)&language=en-US)")
            .map { data -> [Video]? in
                guard let data = data else {
                    dLog("Unexpectedly found nil")
                    return nil
                }
                do {
                    let response = try JSONDecoder().decode(VideosResponse.self, from: data)
                    return response.results
                } catch {
                    dLog("JSONDecoder decode error: \(error)")
                    return nil
                }
        }
    }
    
    func searchMovies(for query: String) -> Observable<[Movie]?> {
        return httpClient
            .get(url: "https://api.themoviedb.org/3/search/movie?api_key=\(constants.themoviedbApiKey)&language=en-US&query=\(query)&page=1&include_adult=false")
            .map { data -> [Movie]? in
                guard let data = data,
                    let response = try? JSONDecoder().decode(MoviesResponse.self, from: data) else {
                        dLog("Unexpectedly found nil")
                        return nil
                }
                
                return response.results
        }
    }
    
    // MARK: - TVShows
    
    func fetchPopularTVShows() -> Observable<[TVShow]?> {
        return httpClient
            .get(url: "https://api.themoviedb.org/3/discover/tv?api_key=\(constants.themoviedbApiKey)&language=en-US&sort_by=popularity.desc&page=1&include_null_first_air_dates=false")
            .map { data -> [TVShow]? in
                guard let data = data,
                    let response = try? JSONDecoder().decode(TVShowsResponse.self, from: data) else {
                        dLog("Unexpectedly found nil")
                        return nil
                }
                return response.results
        }
    }

    func fetchTVShowDetails(for tvShowId: Int) -> Observable<TVShow?> {
        dLog("tvShowId = \(tvShowId)")
        
        return httpClient
            .get(url: "https://api.themoviedb.org/3/tv/\(tvShowId)?api_key=\(constants.themoviedbApiKey)&language=en-US)")
            .map { data -> TVShow? in
                guard let data = data else {
                    dLog("Unexpectedly found nil")
                    return nil
                }
                do {
                    let response = try JSONDecoder().decode(TVShow.self, from: data)
                    return response
                } catch {
                    dLog("JSONDecoder decode error: \(error)")
                    return nil
                }
        }
    }

    func searchTVShows(for query: String) -> Observable<[TVShow]?> {

        return Observable.empty()
    }

    // MARK: - login

    func login(with username: String, and password: String) -> Observable<Bool> {
        return httpClient
            .get(url: "https://api.themoviedb.org/3/authentication/token/new?api_key=\(constants.themoviedbApiKey)")
            .map { data -> String? in
                guard let data = data,
                    let response = try? JSONDecoder().decode(AuthTokenResponse.self, from: data) else {
                        dLog("Unexpectedly found nil")
                        return nil
                }
                return response.requestToken
            }
            .flatMap { [weak self] (token: String?) -> Observable<Data?> in
                guard let strongSelf = self,
                    let token = token else {
                        dLog("Unexpectedly found nil")
                        return Observable.just(nil)
                }
                return strongSelf.httpClient.post(url: "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=\(strongSelf.constants.themoviedbApiKey)",
                    params: ["username": username, "password": password, "request_token": token])
            }
            .map { (data: Data?) -> Bool in
                guard let data = data,
                    let response = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                        dLog("Unexpectedly found nil")
                        return false
                }
                return response.success
        }
    }

}
