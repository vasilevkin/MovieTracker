//
//  VideoPlayerView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 14/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class VideoPlayerView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        layer.backgroundColor = UIColor.green.cgColor
    }

}
