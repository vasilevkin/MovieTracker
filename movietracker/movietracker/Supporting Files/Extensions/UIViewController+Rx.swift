//
//  UIViewController+Rx.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 30/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

extension Reactive where Base: UIViewController {

    var viewWillAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewWillAppear(_:))).map { _ in }
        return ControlEvent(events: source)
    }

}
