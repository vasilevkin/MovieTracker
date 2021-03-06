//
//  ItemDetailHeaderView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 01/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class ItemDetailHeaderView: UIView {

    @IBOutlet private weak var overviewTitleLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var genresLabel: UILabel!
    @IBOutlet private weak var runtimeLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
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
                   releaseDate: String,
                   genres: String,
                   runtime: String,
                   voteAverage: String,
                   overview: String) {
        titleLabel.text = title
        releaseDateLabel.text = "Release date: \(releaseDate)"
        genresLabel.text = genres
        runtimeLabel.text = runtime
        voteAverageLabel.text = voteAverage
        overviewLabel.text = overview
    }

    // MARK: - Private

    private func setup() {
        Bundle.main.loadNibNamed("ItemDetailHeaderView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        self.titleLabel.textColor         = Constants.uiTitleTextColor
        self.releaseDateLabel.textColor   = Constants.uiSubtitleTextColor
        self.overviewTitleLabel.textColor = Constants.uiSubviewTitleTextColor
        self.overviewLabel.textColor      = Constants.uiSubviewSubtitleTextColor
        self.genresLabel.textColor        = Constants.uiSubviewSubtitleTextColor
        self.runtimeLabel.textColor       = Constants.uiSubviewSubtitleTextColor
        self.voteAverageLabel.textColor   = Constants.uiSubviewSubtitleTextColor

        self.overviewTitleLabel.font = Constants.uiSubviewTitleFont
        self.overviewLabel.font      = Constants.uiSubviewSubtitleFont
        self.genresLabel.font        = Constants.uiSubviewSubtitleFont
        self.runtimeLabel.font       = Constants.uiSubviewSubtitleFont
        self.voteAverageLabel.font   = Constants.uiSubviewSubtitleFont
    }

}

extension ItemDetailHeaderView {
    
    func configure(with data: ItemDetailData) {
        configure(with: data.title,
                  releaseDate: data.releaseDate ?? "",
                  genres: data.genres ?? "",
                  runtime: data.runtime ?? "",
                  voteAverage: data.voteAverage ?? "",
                  overview: data.overview ?? "")
    }
    
}
