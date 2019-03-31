//
//  FeaturedMainView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 30/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif
import Nuke

final class FeaturedMainView: UIView {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var tableView: UITableView!
    
    private var dataSource: [CarouselViewModel]?
    private var storedOffsets = [Int: CGFloat]()
    private let selectedIndexSubject = PublishSubject<(Int, Int)>()
    
    var selectedIndex: Observable<(Int, Int)> {
        return selectedIndexSubject.asObservable()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.register(UINib(nibName: String(describing: CarouselSectionTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: CarouselSectionTableViewCell.self))
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func setDataSource(_ dataSource: [CarouselViewModel]) {
        self.dataSource = dataSource
    }
    
    private func setup() {
        Bundle.main.loadNibNamed(String(describing: FeaturedMainView.self), owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

extension FeaturedMainView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = dataSource,
            let cell = tableView.dequeueReusableCell (
                withIdentifier: String(describing: CarouselSectionTableViewCell.self),
                for: indexPath
                ) as? CarouselSectionTableViewCell else {
                    dLog("Unexpectedly found nil")
                    return UITableViewCell()
        }
        let carouselData = data[indexPath.row]
        cell.titleLabel.text = carouselData.title
        cell.subtitleLabel.text = carouselData.subtitle
        
        return cell
    }
    
}

extension FeaturedMainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? CarouselSectionTableViewCell else {
            dLog("Unexpectedly found nil")
            return
        }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? CarouselSectionTableViewCell else {
            dLog("Unexpectedly found nil")
            return
        }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
}

extension FeaturedMainView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexSubject.onNext((collectionView.tag, indexPath.item))
    }
    
}

extension FeaturedMainView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?[collectionView.tag].items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = dataSource,
            let cell = collectionView.dequeueReusableCell (
                withReuseIdentifier: String(describing: MovieCollectionViewCell.self),
                for: indexPath
                ) as? MovieCollectionViewCell else {
                    dLog("Unexpectedly found nil")
                    return UICollectionViewCell()
        }
        let item = data[collectionView.tag].items[indexPath.item]
        
        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.subtitle
        
        if let urlString = item.imageUrl, let url = URL(string: urlString) {
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
            Nuke.loadImage(with: url, options: options, into: cell.imageView)
        }
        
        return cell
    }
    
}

extension FeaturedMainView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = Constants.uiFeaturedMainViewItemsPerRow
        let width = collectionView.bounds.width / itemsPerRow
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
}
