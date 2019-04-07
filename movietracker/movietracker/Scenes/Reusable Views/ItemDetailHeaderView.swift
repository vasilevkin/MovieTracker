//
//  ItemDetailHeaderView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 01/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class ItemDetailHeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet var contentView: UIView!

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
        releaseDateLabel.text = releaseDate
        genresLabel.text = genres
        runtimeLabel.text = runtime
        voteAverageLabel.text = voteAverage
        overviewLabel.text = overview
    }
    
    private func setup() {
        Bundle.main.loadNibNamed("ItemDetailHeaderView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
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
