//
//  MovieDetailViewController.swift
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

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var headerView: MovieDetailHeaderView!
    @IBOutlet weak var tipsView: MovieDetailTipsView!
    @IBOutlet weak var posterImageView: GradientImageView!
    @IBOutlet weak var backButton: UIButton!

    var viewModel: MovieDetailViewModel?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
