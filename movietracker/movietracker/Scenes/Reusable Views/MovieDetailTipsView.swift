//
//  MovieDetailTipsView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 02/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class MovieDetailTipsView: UIView {

    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var contentView: UIView!

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
        Bundle.main.loadNibNamed("MovieDetailTipsView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}

extension MovieDetailTipsView {
    
    func configure(with data: MovieDetailData) {
        configure(with: data.voteCount ?? "",
                  status: data.status ?? "")
    }

}
