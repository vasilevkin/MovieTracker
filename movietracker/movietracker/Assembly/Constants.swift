//
//  Constants.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 27/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Contains all sensitive secret constants.
 Should not be committed to repo with data in plain text.
 Repo only contains a crypted version of this file.
 
 This is just a data struct to show data format.
 Actual data is crypted.
 */
struct Constants {
    let themoviedbApiKey = "PUT_YOUR_KEY_HERE"
}
