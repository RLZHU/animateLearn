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
        
    }

}
