//
//  DribbleSideViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/7/24.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit
import SnapKit

class DribbleSideViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var sideMenuTableView: UITableView = {
        let temp = UITableView(frame: CGRectZero, style: .Plain)
        temp.registerClass(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell))
        temp.backgroundColor = UIColor.blueColor()
        temp.delegate = self
        temp.dataSource = self
        return temp
    }()
    
    var lastIndexPath: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(sideMenuTableView);
        sideMenuTableView.snp_makeConstraints { (make) in
            make.width.equalTo(UIScreen.mainScreen().bounds.width / 3)
            make.top.bottom.left.equalTo(self.view)
        }
        // Do any additional setup after loading the view.
    }
    
    
    /**  设置tableView */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(UITableViewCell))! as UITableViewCell
        
        cell.textLabel?.text = String(indexPath.row) + "9999999"
        
        return cell
    }
    
    func handleGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        let scaleTransform = CGAffineTransformMakeScale(1.3, 1.3)
//        let translateTransform = CGAffineTransformMakeTranslation(80, 0)
//        let concatTransform = CGAffineTransformConcat(scaleTransform, translateTransform)
        
        switch gesture.state {
        case .Began:
            let beganPoint = gesture.locationInView(sideMenuTableView)
            let touchIndex = sideMenuTableView.indexPathForRowAtPoint(beganPoint)
            if touchIndex != nil {
                lastIndexPath = touchIndex
                let cell = sideMenuTableView.cellForRowAtIndexPath(touchIndex!)
                UIView.animateWithDuration(0.35, animations: { 
                    cell?.contentView.transform = scaleTransform
                })
            }
        case .Changed:
            let changePoint = gesture.locationInView(sideMenuTableView)
            let touchIndex = sideMenuTableView.indexPathForRowAtPoint(changePoint)
            if touchIndex != nil {
                let result = lastIndexPath?.compare(touchIndex!)
                if result != NSComparisonResult.OrderedSame {
                    let lastCell = sideMenuTableView.cellForRowAtIndexPath(lastIndexPath!)
                    UIView.animateWithDuration(0.35, animations: { 
                        lastCell?.contentView.transform = CGAffineTransformIdentity
                    })
                    
                    lastIndexPath = touchIndex
                    let cell = sideMenuTableView.cellForRowAtIndexPath(touchIndex!)
                    UIView.animateWithDuration(0.35, animations: { 
                        cell?.contentView.transform = scaleTransform
                    })
                }
                
            }
        case .Ended:
            let endedPoint = gesture.locationInView(sideMenuTableView)
            let endedIndex = sideMenuTableView.indexPathForRowAtPoint(endedPoint)
            if endedIndex != nil {
                let cell = sideMenuTableView.cellForRowAtIndexPath(endedIndex!)
                UIView.animateWithDuration(0.35, animations: { 
                    cell?.contentView.transform = CGAffineTransformIdentity
                })
                let lastCell = sideMenuTableView.cellForRowAtIndexPath(lastIndexPath!)
                UIView.animateWithDuration(0.35, animations: { 
                    lastCell?.contentView.transform = CGAffineTransformIdentity
                })
            }
        default:
            break
        }
        
    }
    
}
