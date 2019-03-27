//
//  ApiThemoviedbAuthProvider.swift
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
 Authenticate user on themoviedb.org api
 */
protocol ApiThemoviedbAuthProvider {
    /**
     Sends Authentication request with user's credentials to themoviedb.org api
     
     - Parameter username: user's login on themoviedb.org
     - Parameter password: password in plain text format
     
     - Returns: Observable of Authentication request result of boolean type
     */
    func login(with username: String, and password: String) -> Observable<Bool>
}
