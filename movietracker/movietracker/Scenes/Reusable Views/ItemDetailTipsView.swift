//
//  ItemDetailTipsView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 02/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class ItemDetailTipsView: UIView {

    @IBOutlet private weak var voteCountTitleLabel: UILabel!
    @IBOutlet private weak var statusTitleLabel: UILabel!
    @IBOutlet private weak var voteCountLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func configure(with voteCount: String,
                   status: String) {
        self.voteCountLabel.text = voteCount
        self.statusLabel.text = status
    }
    
    private func setup() {
        Bundle.main.loadNibNamed("ItemDetailTipsView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        self.voteCountTitleLabel.textColor  = Constants.uiSubviewTitleTextColor
        self.statusTitleLabel.textColor     = Constants.uiSubviewTitleTextColor
        self.voteCountLabel.textColor       = Constants.uiSubviewSubtitleTextColor
        self.statusLabel.textColor          = Constants.uiSubviewSubtitleTextColor

        self.voteCountTitleLabel.font   = Constants.uiSubviewTitleFont
        self.statusTitleLabel.font      = Constants.uiSubviewTitleFont
        self.voteCountLabel.font        = Constants.uiSubviewSubtitleFont
        self.statusLabel.font           = Constants.uiSubviewSubtitleFont
    }

}

extension ItemDetailTipsView {
    
    func configure(with data: ItemDetailData) {
        configure(with: data.voteCount ?? "",
                  status: data.status ?? "")
    }

}
