//
//  CarouselSectionTableViewCell.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 30/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class CarouselSectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.estimatedItemSize = CGSize(width: Constants.uiCarouselSectionTableViewCellWidth,
                                              height: Constants.uiCarouselSectionTableViewCellHeight)
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            
            return layout
        }()
        
        collectionView.register(UINib(nibName: String(describing: MovieCollectionViewCell.self), bundle: nil),
                                forCellWithReuseIdentifier: String(describing: MovieCollectionViewCell.self))
        collectionView.collectionViewLayout = layout
        
        collectionViewHeightConstraint.constant = MovieCollectionViewCell.height(forWidth: Constants.uiCarouselSectionTableViewCellWidth)
        collectionViewHeightConstraint.isActive = true
        collectionView.contentInset = UIEdgeInsets(top: 0,
                                                   left: Constants.uiCollectionViewContentInset,
                                                   bottom: 0,
                                                   right: Constants.uiCollectionViewContentInset)
    }
}

extension CarouselSectionTableViewCell {
    
    var collectionViewOffset: CGFloat {
        get {
            return collectionView.contentOffset.x
        }
        
        set {
            collectionView.contentOffset.x = newValue
        }
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated: false)
        collectionView.reloadData()
    }
    
}
