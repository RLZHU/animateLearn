//
//  DribbleViewController.swift
//  AnimateLearn
//
//  Created by zhu on 16/7/24.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

class DribbleViewController: UIViewController {
    
    lazy var contanerView: UIView = UIView(frame: self.view.bounds)
    lazy var contentViewController: UIViewController = UIViewController()
    lazy var leftSideMenuController: DribbleSideViewController = DribbleSideViewController()
    
    lazy var lineLayer: CAShapeLayer = {
        var layer = CAShapeLayer()
        layer.fillColor = UIColor.redColor().CGColor
        layer.strokeColor = UIColor.redColor().CGColor
        return layer
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDismissBtn()
        self.setupContentViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
// MARK: - setup dribble content view
extension DribbleViewController {
    func setupContentViewController() {
        //setup container view
        view.addSubview(contanerView)
        contanerView.backgroundColor = UIColor.whiteColor()
        
        //setup side menu controler
        self.addChildViewController(leftSideMenuController)
        leftSideMenuController.view.bounds = view.bounds;
        contanerView.addSubview(leftSideMenuController.view)
        
        
        //setup content viewController
        contentViewController.view.bounds = view.bounds
        contentViewController.view.backgroundColor = UIColor.grayColor()
        contentViewController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addChildViewController(contentViewController)
        contentViewController.view.layer.addSublayer(lineLayer)
        contanerView.addSubview(contentViewController.view)
        
        
        // setup gesture
        let panGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleEdgePanGesture))
        panGesture.edges = UIRectEdge.Left;
        contanerView.addGestureRecognizer(panGesture)
    }
    
    func handleEdgePanGesture(ges: UIScreenEdgePanGestureRecognizer) {
        leftSideMenuController.handleGesture(ges)
        switch ges.state {
        case .Began:
            let beganPoint = ges.locationInView(contanerView)
            lineLayer.path = getLinePathWithAmount(beganPoint.x, withY: beganPoint.y)
            
        case .Changed:
            let changePoint = ges.locationInView(contanerView)
            let translatePoint = ges.translationInView(contanerView)
            self.contentViewController.view.center = CGPointMake(CGRectGetMidX(self.contentViewController.view.frame) + translatePoint.x, CGRectGetMidY(self.contentViewController.view.frame))
            self.lineLayer.path = getLinePathWithAmount(changePoint.x, withY: changePoint.y)
            ges.setTranslation(CGPointZero, inView: self.contanerView)
        case .Ended:
            self.contentViewController.view.frame = self.view.bounds
            self.lineLayer.path = nil
        default:
            break
        }
    }
    
    func getLinePathWithAmount(amount: CGFloat, withY amountY: CGFloat) -> CGPathRef {
        let path = UIBezierPath()
        let topPoint = CGPoint(x: 0, y: 0)
        let midControlPoint = CGPoint(x: amount, y: amountY)
        let bottomPoint = CGPoint(x: 0, y: self.view.bounds.height)
        
        path.moveToPoint(topPoint)
        path.addQuadCurveToPoint(bottomPoint, controlPoint: midControlPoint)
        path.closePath()
        return path.CGPath
    }
    
}

// MARK: - dismiss button
extension DribbleViewController {
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
