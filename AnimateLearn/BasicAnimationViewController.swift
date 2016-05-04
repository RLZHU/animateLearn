//
//  BasicAnimationViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/4/28.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class BasicAnimationViewController: UIViewController {
    @IBOutlet weak var animateView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func positionAnimation(sender: AnyObject) {
        let anim = CABasicAnimation(keyPath: "position")
        anim.fromValue = NSValue(CGPoint: CGPointMake(30, 30))
        anim.toValue = NSValue(CGPoint: CGPointMake(300, 300))
        anim.duration = 1.0;
//        anim.removedOnCompletion = false;
        self.animateView.layer.addAnimation(anim, forKey: "positionAnimation")
    }
    @IBAction func opacityAnimation(sender: AnyObject) {
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.fromValue = 1.0;
        anim.toValue = 0.2;
        anim.duration = 1.0;
        self.animateView.layer.addAnimation(anim, forKey: "opacityAnimation")
        
    }
    @IBAction func scaleAnimation(sender: AnyObject) {
        let anim = CABasicAnimation(keyPath: "transform.scale")
        anim.fromValue = 1.0;
        anim.toValue = 2.0;
        anim.duration = 1.0;
        self.animateView.layer.addAnimation(anim, forKey: "scaleAnimation")
    }
    @IBAction func rotateAnimation(sender: AnyObject) {
        let anim = CABasicAnimation(keyPath: "transform.rotation.z")
        anim.fromValue = M_PI;
        anim.toValue = -M_PI;
        self.animateView.layer.addAnimation(anim, forKey: "rotateAnimation")
    }
    @IBAction func colorAnimation(sender: AnyObject) {
        let anim = CABasicAnimation(keyPath: "backgroundColor")
        anim.toValue = UIColor.redColor().CGColor
        anim.duration = 2.0
        self.animateView.layer.addAnimation(anim, forKey: "backgroundAnition")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
