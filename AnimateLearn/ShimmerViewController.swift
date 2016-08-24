//
//  ShimmerViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/7/30.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class ShimmerViewController: UIViewController {
    
    private lazy var label: UILabel = { [unowned self] in
        let label = UILabel()
        label.frame = CGRectMake(0, 0, 200, 100)
        label.font = UIFont.systemFontOfSize(30)
        label.backgroundColor = UIColor.grayColor()
        label.text = "Shimmer"
        label.sizeToFit()
        label.center = self.view.center
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDismissBtn()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        beginAnimation()
    }
    
    func beginAnimation() {
        //设置mask
        let mask = CAGradientLayer()
        mask.startPoint = CGPointMake(0, 0.5)
        mask.endPoint = CGPointMake(1, 0.5)
        let maskColor = UIColor(colorLiteralRed: 23/255.0, green: 43/255.0, blue: 53/255.0, alpha: 0.5)
        let unmaskColor = UIColor(colorLiteralRed: 23/255.0, green: 43/255.0, blue: 53/255.0, alpha: 1.0)
        mask.colors = [maskColor.CGColor, unmaskColor.CGColor, maskColor.CGColor]
        mask.anchorPoint = CGPointMake(0.0, 0.0)
        mask.frame = CGRectMake(-label.frame.size.width*2, 0, label.frame.size.width * 3, label.frame.size.height)
        label.layer.mask = mask
        // mask移动动画
        let anim = CABasicAnimation(keyPath: "position")
        anim.toValue = NSValue(CGPoint: CGPointMake(-label.frame.size.width/2, 0))
        anim.duration = 1.0
        anim.repeatCount = Float.infinity
        mask.addAnimation(anim, forKey: "shimmer")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ShimmerViewController {
    func setupView() {
        self.view.backgroundColor = UIColor.blackColor()
        self.view.addSubview(label)
    }
}

extension ShimmerViewController {
    func setupDismissBtn() {
        let dismiss = UIButton(type: .Custom)
        dismiss.frame = CGRectMake(10, 20, 50, 40);
        dismiss .setTitle("dismiss", forState: UIControlState.Normal)
        dismiss.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        dismiss.titleLabel?.font = UIFont.systemFontOfSize(13)
        self.view.addSubview(dismiss);
        dismiss.addTarget(self, action: #selector(dismis), forControlEvents: .TouchUpInside)
    }
    func dismis() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
