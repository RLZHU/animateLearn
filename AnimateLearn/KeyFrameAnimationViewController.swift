//
//  KeyFrameAnimationViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/4/28.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class KeyFrameAnimationViewController: UIViewController {

    @IBOutlet weak var animateView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func keyFrameAnimation(sender: AnyObject) {
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.values = [NSValue(CGPoint: CGPointMake(10, 10)),
                       NSValue(CGPoint: CGPointMake(20, 10)),
                       NSValue(CGPoint: CGPointMake(20, 20)),
                       NSValue(CGPoint: CGPoint(x: 100, y: 50)),
                       NSValue(CGPoint: CGPoint(x: 200, y: 20)),
                       NSValue(CGPoint: CGPointMake(200, 200))];
        anim.duration = 3.0;
        animateView.layer.addAnimation(anim, forKey: "keyFrame")
    }
    @IBAction func pathAnimation(sender: AnyObject) {
        let anim = CAKeyframeAnimation(keyPath: "position")
        let bezier = UIBezierPath(ovalInRect: CGRectMake(100, 100, 200, 200))
        anim.duration = 2.0;
        anim.path = bezier.CGPath;
        anim.repeatCount = MAXFLOAT;
        animateView.layer.addAnimation(anim, forKey: "pathAnimation")
    }
    @IBAction func hanginAnimation(sender: AnyObject) {
        let anim = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        anim.values = [-M_PI/180*4, M_PI/180*4, -M_PI/180*4]
        anim.duration = 1.0;
        animateView.layer.addAnimation(anim, forKey: "rotateAnimation")
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
