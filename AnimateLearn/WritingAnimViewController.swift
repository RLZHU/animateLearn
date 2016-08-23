//
//  WritingAnimViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/5/22.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class WritingAnimViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let animView = WritingAnimView()
        animView.frame = CGRectMake(100, 100, 300, 500)
        animView.showMessage("大梁字体")
        view.addSubview(animView)
        self .setupDismissBtn();
    }

}

extension WritingAnimViewController {
    func setupDismissBtn() {
        let dismiss = UIButton(type: .Custom)
        dismiss.frame = CGRectMake(10, 20, 50, 40);
        dismiss .setTitle("dismiss", forState: UIControlState.Normal)
        dismiss.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.view.addSubview(dismiss);
        dismiss.addTarget(self, action: #selector(dismis), forControlEvents: .TouchUpInside)
    }
    func dismis() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
