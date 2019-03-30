//
//  MovieCollectionViewCell.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 28/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static func height(forWidth width: CGFloat) -> CGFloat {
        guard let sizingCell = UINib(nibName: String(describing: MovieCollectionViewCell.self), bundle: nil)
            .instantiate(withOwner: nil, options: nil).first as? MovieCollectionViewCell else {
                dLog("Unexpectedly found nil")
                return Constants.uiMovieCellMaxHeight
        }
        
        sizingCell.prepareForReuse()
        sizingCell.layoutIfNeeded()
        
        var fittingSize = UIView.layoutFittingCompressedSize
        fittingSize.width = width
        let size = sizingCell.contentView.systemLayoutSizeFitting(fittingSize,
                                                                  withHorizontalFittingPriority: .required,
                                                                  verticalFittingPriority: .defaultLow)
        guard size.height < Constants.uiMovieCellMaxHeight else {
            return Constants.uiMovieCellMaxHeight
        }
        
        return size.height
    }
    
}
