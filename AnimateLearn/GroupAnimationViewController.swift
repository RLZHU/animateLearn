//
//  GroupAnimationViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/4/29.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class GroupAnimationViewController: UIViewController {

    @IBOutlet weak var animateView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func dismissClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func concurrentAnimation(sender: AnyObject) {
        let anim1 = CAKeyframeAnimation(keyPath: "position")
        anim1.values = [NSValue(CGPoint: CGPointMake(-100, 60)),
                        NSValue(CGPoint: CGPointMake(30, 30)),
                        NSValue(CGPoint: CGPointMake(100, 100)),
                        NSValue(CGPoint: CGPointMake(200, 300))]
        let anim2 = CABasicAnimation(keyPath: "transform.rotation")
        anim2.fromValue = M_PI;
        anim2.toValue = -M_PI_4;
        
        let anim3 = CABasicAnimation(keyPath: "transform.scale");
        anim3.fromValue = 1.0;
        anim3.toValue = 2.0;
        
        let group = CAAnimationGroup()
        group.duration = 4.0
        group.animations = [anim1, anim2, anim3]
        
        animateView.layer.addAnimation(group, forKey: "groupAnimation")
    }
    
    @IBAction func oneByOneAnimate(sender: AnyObject) {
        
        let currentTime = CACurrentMediaTime()
        let positionAnim = CAKeyframeAnimation(keyPath: "position")
        positionAnim.values = [NSValue(CGPoint: CGPointMake(20, 20)),
                               NSValue(CGPoint: CGPointMake(20, 100)),
                               NSValue(CGPoint: CGPointMake(100, 100)),
                               NSValue(CGPoint: CGPointMake(200, 200))]
        positionAnim.duration = 2.0
        positionAnim.beginTime = currentTime
        animateView.layer.addAnimation(positionAnim, forKey: "position")
        
        let rotateAnim = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnim.toValue = -M_PI
        rotateAnim.duration = 1.0
        rotateAnim.beginTime = currentTime + 2.0
        animateView.layer.addAnimation(rotateAnim, forKey: "rotateAnimation")
        
        let scaleAnim = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnim.values = [1.0, 2.0, 3.0, 2.0, 1.0]
        scaleAnim.beginTime = currentTime + 3.0
        animateView.layer.addAnimation(scaleAnim, forKey: "scaleAnimation")
        
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
