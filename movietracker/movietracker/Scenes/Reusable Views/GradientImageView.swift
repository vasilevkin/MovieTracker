//
//  GradientImageView.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 02/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

class GradientImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        layer.backgroundColor = Constants.uiGradientImageViewBackgroundColor.cgColor
        layer.opacity = Constants.uiGradientImageViewOpacity
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = Constants.uiGradientImageViewGradientColors
        gradient.locations = Constants.uiGradientImageViewGradientLocations
        layer.mask = gradient
    }
    
}
