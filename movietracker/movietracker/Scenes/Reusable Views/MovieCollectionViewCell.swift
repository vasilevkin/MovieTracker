//
//  MovieCollectionViewCell.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 28/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit
import Nuke

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }

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

    func updateTitleLabel(with text: String) {
        self.titleLabel.text = text
    }

    func updateSubtitleLabel(with text: String) {
        self.subtitleLabel.text = text
    }

    func imageViewLoadImage(with url: URL) {
        // Load image using Nuke
        let options = ImageLoadingOptions(
            placeholder: UIImage(named: "placeholder"),
            transition: .fadeIn(duration: 1.0),
            failureImage: UIImage(named: "failure_image"),
            contentModes: .init(
                success: .scaleAspectFill,
                failure: .center,
                placeholder: .center
            )
        )
        Nuke.loadImage(with: url, options: options, into: self.imageView)
    }

    // MARK: - Private

    private func setup() {
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius = Constants.uiMovieCellCornerRadius

        self.titleLabel.textColor = Constants.uiTitleTextColor
        self.subtitleLabel.textColor = Constants.uiSubtitleTextColor

        self.titleLabel.font = Constants.uiMovieCellTitleFont
        self.subtitleLabel.font = Constants.uiMovieCellSubtitleFont

    }
}
