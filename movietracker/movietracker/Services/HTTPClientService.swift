//
//  HTTPClientService.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 24/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

protocol HTTPClientService {
    func get(url: String) -> Observable<Data?>
    func post(url: String, params: [String: Any]) -> Observable<Data?>
}

final class HTTPClient: HTTPClientService {
    
    /**
     Sends a 'get' request to a specified URL
     
     - Parameter url: String of URL
     - Returns: Optional observable Data type
     */
    func get(url: String) -> Observable<Data?> {
        guard let url = URL(string: url) else {
            dLog("Unexpectedly found nil")
            return Observable.empty()
        }
        let request = URLRequest(url: url)
        return URLSession
            .shared.rx.data(request: request)
            .map { Optional.init($0) }
            .catchErrorJustReturn(nil)
    }
    
    /**
     Sends a 'post' request to a specified URL
     
     - Parameter url: String of URL
     - Parameter params: Json object data
     - Returns: Optional observable response Data type
     */
    func post(url: String, params: [String: Any]) -> Observable<Data?> {
        guard let url = URL(string: url) else {
            dLog("Unexpectedly found nil")
            return Observable.empty()
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let jsonData = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        request.httpBody = jsonData
        return URLSession
            .shared.rx.data(request: request)
            .map { Optional.init($0) }
            .catchErrorJustReturn(nil)
    }
}
