//
//  DivergentCenterButton.swift
//  AnimateLearn
//
//  Created by zhu on 16/5/3.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit
typealias ClickCallBackType = () ->Void

class DivergentCenterButton: UIButton {
    
    var clickCenter: ClickCallBackType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self .addTarget(self, action: #selector(click), forControlEvents: .TouchUpInside)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var selected: Bool {
        didSet {
            var angle = 0.0
            if selected {
                angle = -M_PI_4
            }
            UIView.animateWithDuration(0.35) {
                self.transform = CGAffineTransformMakeRotation(CGFloat(angle))
            }
        }
    }
    
    func click() {
        selected = !selected
        self.clickCenter?()
    }

}
