//
//  MovieDetailHeaderView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 01/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class MovieDetailHeaderView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet var contentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
