//
//  DivergentOtherButton.swift
//  AnimateLearn
//
//  Created by zhu on 16/5/3.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class DivergentOtherButton: UIButton {
    var lastPoint: CGPoint?
    var showPath: CGPoint? {
        didSet {
            if (showPath != nil) {
//                self.layer.anchorPoint = CGPointMake(0, 1)
                let positionAnim = CASpringAnimation(keyPath: "position")
                
                if lastPoint != nil {
                    positionAnim.fromValue = NSValue(CGPoint: lastPoint!)
                }
                lastPoint = showPath!
                positionAnim.toValue = NSValue(CGPoint: showPath!)
                
                let rotationAnim = CAKeyframeAnimation(keyPath: "transform.rotation")
                rotationAnim.values = [-M_PI, M_PI*2]
//                rotationAnim.rotationMode = kCAAnimationRotateAutoReverse
                
                let group = CAAnimationGroup()
                group.animations = [rotationAnim, positionAnim]
                group.duration = 0.4
                group.removedOnCompletion = false;
                group.fillMode = kCAFillModeForwards
                group.delegate = self;
                self.layer.addAnimation(group, forKey: "positionAnim")
            }
        }
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.layer.removeAllAnimations()
        self.center = self.showPath!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
