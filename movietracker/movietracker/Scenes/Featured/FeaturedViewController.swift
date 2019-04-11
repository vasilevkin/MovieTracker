//
//  FeaturedViewController.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 24/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

class FeaturedViewController: UIViewController {
    
    @IBOutlet private weak var mainView: FeaturedMainView!
    
    var viewModel: FeaturedViewModel?
    private let disposeBag = DisposeBag()
    
    // MARK: - ViewController Life Cycle
    
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
    
    // MARK: - Private
    
    private func bindViewModel() {
        let input = FeaturedViewModel.Input(ready: rx.viewWillAppear.asDriver(),
                                            selected: mainView.selectedIndex.asDriver(onErrorJustReturn: (0, 0)))
        
        let output = viewModel?.transform(input: input)
        
        output?.loading
            .drive(UIApplication.shared.rx.isNetworkActivityIndicatorVisible)
            .disposed(by: disposeBag)
        
        output?.results
            .drive(onNext: { [weak self] carouselViewModel in
                guard let strongSelf = self else {
                    dLog("Unexpectedly found nil")
                    return
                }
                strongSelf.mainView.setDataSource(carouselViewModel)
                strongSelf.mainView.reloadData()
            })
            .disposed(by: disposeBag)
        
        output?.selected
            .drive()
            .disposed(by: disposeBag)
    }
    
}
