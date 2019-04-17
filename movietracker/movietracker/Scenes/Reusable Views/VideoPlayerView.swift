//
//  VideoPlayerView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 14/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit
import WebKit

class VideoPlayerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func playYoutube(with videoKey: String) {
        dLog("Play youtube video with key = \(videoKey)")

        let videoWebView = WKWebView(frame: self.bounds)
        videoWebView.backgroundColor = UIColor.clear
        videoWebView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(videoWebView)

        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoKey)") else {
            dLog("Unexpectedly found nil")
            return
        }
        videoWebView.load(URLRequest(url: youtubeURL))
    }

    // MARK: - Private

    private func setup() {
        layer.backgroundColor = UIColor.clear.cgColor
    }

}
