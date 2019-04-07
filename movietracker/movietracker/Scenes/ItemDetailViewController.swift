//
//  ItemDetailViewController.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 01/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif
import Nuke

class ItemDetailViewController: UIViewController {
    
    @IBOutlet weak var headerView: ItemDetailHeaderView!
    @IBOutlet weak var tipsView: ItemDetailTipsView!
    @IBOutlet weak var posterImageView: GradientImageView!
    @IBOutlet weak var backButton: UIButton!

    var viewModel: ItemDetailViewModel?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func bindViewModel() {
        let input = ItemDetailViewModel.Input(ready: rx.viewWillAppear.asDriver(),
                                               backTrigger: backButton.rx.tap.asDriver())
        
        let output = viewModel?.transform(input: input)
        
        output?.data
            .drive(onNext: { [weak self] data in
                guard let data = data,
                    let strongSelf = self else {
                        dLog("Unexpectedly found nil")
                        return
                }
                strongSelf.headerView.configure(with: data)
                strongSelf.tipsView.configure(with: data)

                if let urlString = data.posterPath, let url = URL(string: urlString) {
                    // Load image using Nuke
                    Nuke.loadImage(with: url, into: strongSelf.posterImageView)
                }
            })
            .disposed(by: disposeBag)
        
        output?.back
            .drive()
            .disposed(by: disposeBag)
    }

}
