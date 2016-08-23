//
//  TransitionViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/4/29.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {
    
    let transitions = ["fade","moveIn","push","reveal"]
    lazy var viewOne : UILabel = {
        let one = UILabel()
        one.frame = CGRectMake(100, 100, 200, 200)
        one.backgroundColor = UIColor.redColor()
        one.font = UIFont.systemFontOfSize(20, weight: 7)
        one.text = "1"
        return one
    }()
    
    lazy var viewTwo : UILabel = {
        let one = UILabel()
        one.frame = CGRectMake(100, 100, 200, 200)
        one.backgroundColor = UIColor.blueColor()
        one.contentMode = UIViewContentMode.Center
        one.text = "2";
        one.font = UIFont.systemFontOfSize(20, weight: 7)
        return one
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        self.creatBtns()
        view.addSubview(viewTwo)

    }
    
    func creatBtns() {
        var x = 1
        for _ in 1...4 {
            let btn = view.viewWithTag(x) as! UIButton
            btn.setTitle(transitions[x - 1], forState: .Normal)
            x = x + 1
        }
    }
    @IBAction func dismissClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//----------------------------- public api ------------------------------------//
/*
 type:
 kCATransitionFade;
 kCATransitionMoveIn;
 kCATransitionPush;
 kCATransitionReveal;
 */

/*
 subType:
 kCATransitionFromRight;
 kCATransitionFromLeft;
 kCATransitionFromTop;
 kCATransitionFromBottom;
 */

extension TransitionViewController {
    
    @IBAction func fade(sender: AnyObject) {
        
        randomChage()
        
        let anim = CATransition()
        anim.type = kCATransitionFade //设置动画的类型

        anim.subtype = kCATransitionFromTop
        anim.duration = 1.0
        viewTwo.layer.addAnimation(anim, forKey: "fadeAnimation")
    }
    @IBAction func moveIn(sender: AnyObject) {
        randomChage()
        
        let anim = CATransition()
        anim.type = kCATransitionMoveIn
        anim.subtype = kCATransitionFromTop
        anim.duration = 1.0
        viewTwo.layer.addAnimation(anim, forKey: "moveInAnimation")
    }
    @IBAction func push(sender: AnyObject) {
        randomChage()
        
        let anim = CATransition()
        anim.type = kCATransitionPush
        anim.subtype = kCATransitionFromLeft
        anim.duration = 1.0;
        viewTwo.layer.addAnimation(anim, forKey: "pushAnimation")
    }
    @IBAction func reveal(sender: AnyObject) {
        randomChage()
        
        let anim = CATransition()
        anim.type = kCATransitionReveal
        anim.subtype = kCATransitionFromLeft
        anim.duration = 1.0
        viewTwo.layer.addAnimation(anim, forKey: "revealAnimation")
    }
    
    func randomChage() {
        viewTwo.text = String(arc4random()%50)
        viewTwo.backgroundColor = UIColor(red: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), alpha: 1)

    }
    
}




//apple private API
//cube suckEffect  oglFlip  rippleEffect  pageCurl  pageUnCurl  cameraIrisHollowOpen  cameraIrisHollowClose
