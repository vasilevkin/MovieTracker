//
//  AdditionalMediaItemDetailData.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 16/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Data struct model for Additional Media Item details,
 such as videos and images.

 Can be initialized with:
 - Video data
 */
struct AdditionalMediaItemDetailData {
    let videoKey: String?
    let videoName: String?
    let videoType: String?
}

extension AdditionalMediaItemDetailData {

    init(video: Video) {
        self.videoKey = video.key
        self.videoName = video.name
        self.videoType = video.type
    }

}
