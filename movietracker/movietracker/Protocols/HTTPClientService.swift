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
    /**
     Sends a 'get' request to a specified URL
     
     - Parameter url: String of URL
     - Returns: Optional observable Data type
     */
    func get(url: String) -> Observable<Data?>
    
    /**
     Sends a 'post' request to a specified URL
     
     - Parameter url: String of URL
     - Parameter params: Json object data
     - Returns: Optional observable response Data type
     */
    func post(url: String, params: [String: Any]) -> Observable<Data?>
}
