//
//  DebugPrint.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 24/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

func dLog(_ message: String, function: String = #function, line: Int = #line) {
    #if DEBUG
    print("*** \(function).\(line): \(message)")
    #endif
}
