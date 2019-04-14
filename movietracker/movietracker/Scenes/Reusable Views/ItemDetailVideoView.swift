//
//  ItemDetailVideoView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 14/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class ItemDetailVideoView: UIView {
    
    @IBOutlet private weak var trailerTitleLabel: UILabel!
    @IBOutlet private weak var trailerSubtitleLabel: UILabel!
    @IBOutlet private weak var videoPlayerView: VideoPlayerView!
    @IBOutlet private var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func configure(with title: String,
                   subtitle: String,
                   videoPlayer: String) {
        self.trailerTitleLabel.text = title
        self.trailerSubtitleLabel.text = subtitle
    }
    
    private func setup() {
        Bundle.main.loadNibNamed("ItemDetailVideoView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.trailerTitleLabel.textColor    = Constants.uiSubviewTitleTextColor
        self.trailerSubtitleLabel.textColor = Constants.uiSubviewSubtitleTextColor
        
        self.trailerTitleLabel.font    = Constants.uiSubviewTitleFont
        self.trailerSubtitleLabel.font = Constants.uiSubviewSubtitleFont
    }
    
}

extension ItemDetailVideoView {
    
    func configure(with data: ItemDetailData) {
        
    }
    
}
