//
//  DivergentViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/5/3.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class DivergentViewController: UIViewController {
    
    var centerBtn: DivergentCenterButton = {
        let btn = DivergentCenterButton()
        btn.frame = CGRectMake(200, 200, 30, 30);
        let image = UIImage.init(named: "chooser-button-tab")
        let hightImage = UIImage.init(named: "chooser-button-tab-highlighted")
        btn.setBackgroundImage(image, forState: .Normal)
        btn.setBackgroundImage(hightImage, forState: .Highlighted)
        return btn
    }()
    
    var others: [DivergentOtherButton]? {
        didSet {
            let count = others?.count
            let radius: CGFloat = 50.0
            //创建终点
            func creatEndPoint(angle: Float, origin: CGPoint) ->CGPoint{
                return CGPointMake(origin.x - CGFloat(cosf(angle * Float(M_PI))) * radius, origin.y - CGFloat(sinf(angle * Float(M_PI))) * radius)
            }
            
            let angle = 1 / Float(count! + 1)
            var i = 1
            self.points = []
            while (i <= count!) {
                self.points?.append(creatEndPoint(angle * Float(i), origin: self.centerBtn.center))
                i += 1
            }
        }
    }
    
    var points: [CGPoint]?
    
    func creatBtn(first: String, second: String, tag: Int) ->DivergentOtherButton {
        let btn = DivergentOtherButton()
        btn.setImage(UIImage.init(named: first), forState: UIControlState.Normal)
        btn.setImage(UIImage.init(named: second), forState: UIControlState.Highlighted)
        btn.frame = centerBtn.frame
        btn.tag = tag
        return btn
    }
    
    func btnClick(sender: UIButton) {
        sender.alpha = 0.617
        
        self.centerBtn.selected = false
        for btn in self.others! {
            btn.lastPoint = nil
            if btn === sender {
                continue
            }
            btn.center = self.centerBtn.center
        }
        UIView.animateWithDuration(0.2, animations: {
                sender.transform = CGAffineTransformMakeScale(5.0, 5.0)
                sender.alpha = 0.0
            }, completion: { (true) in
                sender.transform = CGAffineTransformIdentity
                sender.alpha = 1.0
                sender.center = self.centerBtn.center
                
        })
        print(sender.tag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cancel = UIButton()
        cancel.setTitle("dismiss", forState: .Normal)
        cancel.setTitleColor(UIColor.blackColor(), forState: .Normal)
        cancel.addTarget(self, action: #selector(dismiss), forControlEvents: .TouchUpInside)
        cancel.frame = CGRectMake(20, 30, 100, 50)
        view.addSubview(cancel)
        
        let btn1 = creatBtn("chooser-moment-icon-camera",second: "chooser-moment-icon-camera-highlighted", tag: 1)
        btn1.addTarget(self, action: #selector(DivergentViewController.btnClick(_:)), forControlEvents: .TouchUpInside)
//        btn1.backgroundColor = UIColor(red: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), alpha: 1)
        let btn2 = creatBtn("chooser-moment-icon-music", second: "chooser-moment-icon-music-highlighted", tag: 2)
        btn2.addTarget(self, action: #selector(DivergentViewController.btnClick(_:)), forControlEvents: .TouchUpInside)
//        btn2.backgroundColor = UIColor(red: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), alpha: 1)
        
        let btn3 = creatBtn("chooser-moment-icon-place", second: "chooser-moment-icon-place_highlighted", tag: 3)
        btn3.addTarget(self, action: #selector(DivergentViewController.btnClick(_:)), forControlEvents: .TouchUpInside)
//        btn3.backgroundColor = UIColor(red: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), alpha: 1)
        
        let btn4 = creatBtn("chooser-moment-icon-sleep", second: "chooser-moment-icon-sleep-highlighted", tag: 4)
        btn4.addTarget(self, action: #selector(DivergentViewController.btnClick(_:)), forControlEvents: .TouchUpInside)
//        btn4.backgroundColor = UIColor(red: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), green: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), blue: CGFloat(CGFloat(random())/CGFloat(RAND_MAX)), alpha: 1)
        
        others = [btn1, btn2, btn3, btn4]
        view.addSubview(btn4)
        view.addSubview(btn3)
        view.addSubview(btn2)
        view.addSubview(btn1)
        
        centerBtn.clickCenter = {
            if self.centerBtn.selected {
                btn1.showPath = self.points![3]
                btn2.showPath = self.points![2]
                btn3.showPath = self.points![1]
                btn4.showPath = self.points![0]
            } else {
                btn1.showPath = self.centerBtn.center
                btn2.showPath = self.centerBtn.center
                btn3.showPath = self.centerBtn.center
                btn4.showPath = self.centerBtn.center
            }
        }
        
        
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(centerBtn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
