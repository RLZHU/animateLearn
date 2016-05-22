//
//  WritingAnimView.swift
//  AnimateLearn
//
//  Created by zhu on 16/5/22.
//  Copyright © 2016年 alexzhu. All rights reserved.
//

import UIKit

//DLTZkDLF

class WritingAnimView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    private let pathLayer = CAShapeLayer()
    
    private let textAnimationTime: NSTimeInterval = 5.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    
    func showMessage(message: String) {
        //添加渐变色layer
        addGradientLayer()
        //添加动画layer
        addPathLayer(message)
        
        gradientLayer.mask = pathLayer
        
//        self.layer.addSublayer(pathLayer)
    }
    
    func addGradientLayer() {
        
        let count = 10
        var colors: [CGColorRef] = []
        
        let topColor = UIColor(red: 91/255.0, green: 91/255.0, blue: 91/255.0, alpha: 1)
        let bottomColor = UIColor(red: 24/255.0, green: 24/255.0, blue: 24/255.0, alpha: 1)
        
        let gradientColors = [topColor.CGColor, bottomColor.CGColor]
        
        for _ in 0 ..< count {
            let color = UIColor.init(red: CGFloat(arc4random() % 256) / 255, green: CGFloat(arc4random() % 256) / 255, blue: CGFloat(arc4random() % 256) / 255, alpha: 1.0)
            
            colors.append(color.CGColor)
        }
        
        gradientLayer.startPoint = CGPointMake(0, 0.5)
        gradientLayer.endPoint = CGPointMake(1, 0.5)
        gradientLayer.colors = gradientColors
        
        gradientLayer.frame = self.bounds
        gradientLayer.type = kCAGradientLayerAxial
        
        self.layer.addSublayer(gradientLayer)
        
        //渐变色动画
        let animation = CABasicAnimation.init(keyPath: "colors")
        animation.duration = 0.5
        animation.repeatCount = MAXFLOAT
        
        var toColors:[CGColorRef] = []
        
        for _ in 0 ..< count {
            let color = UIColor.init(red: CGFloat(arc4random() % 256) / 255, green: CGFloat(arc4random() % 256) / 255, blue: CGFloat(arc4random() % 256) / 255, alpha: 1.0)
            
            toColors.append(color.CGColor)
        }
        animation.autoreverses = true
        animation.toValue = toColors
        gradientLayer.addAnimation(animation, forKey: "gradientLayer")
        
    }
 
    func addPathLayer(str: String) {
        let textPath = bezierPathFrom(str)
        
        pathLayer.bounds = CGPathGetBoundingBox(textPath.CGPath)
        pathLayer.position = gradientLayer.position
        pathLayer.geometryFlipped = true
        pathLayer.path = textPath.CGPath
        pathLayer.fillColor = nil
        pathLayer.lineWidth = 1
        pathLayer.strokeColor = UIColor.blackColor().CGColor
        
        //笔迹动画
        let textAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        textAnimation.duration = textAnimationTime
        textAnimation.fromValue = 0
        textAnimation.toValue = 1
        textAnimation.delegate = self
        pathLayer.addAnimation(textAnimation, forKey: "fill")
        
        
    }
    
    func bezierPathFrom(str: String) -> UIBezierPath {
        let paths = CGPathCreateMutable()
        //获得字体名
        let fontName = __CFStringMakeConstantString("DLTZkDLF")
        //字体指针
        let fontRef = CTFontCreateWithName(fontName, 30, nil)
        
        let attributteStr = NSAttributedString(string: str, attributes: [kCTFontAttributeName as String: fontRef])
        //富文本变行对象
        let line = CTLineCreateWithAttributedString(attributteStr)
        //行对象变单个字对象
        let runA = CTLineGetGlyphRuns(line)
        var i = 0;
        while (i < CFArrayGetCount(runA)) {
            let run = CFArrayGetValueAtIndex(runA, i)//取出单个对象
            let runb = unsafeBitCast(run, CTRun.self)//将对象变成CTRun的bit
            let ctFontName = unsafeBitCast(kCTFontAttributeName, UnsafePointer<Void>.self)//字符串变bit
            let runFontC = CFDictionaryGetValue(CTRunGetAttributes(runb), ctFontName)//返回字体的属性,即上面富文本的属性
            let runFontS = unsafeBitCast(runFontC, CTFont.self)
            let width = UIScreen.mainScreen().bounds.size.width
            
            var temp = 0
            var offset: CGFloat = 0.0
            
            var j = 0;
            while (j < CTRunGetGlyphCount(runb)) {//遍历组成字体的CTRun属性
                let range = CFRangeMake(j, 1)
                let glyph: UnsafeMutablePointer<CGGlyph> = UnsafeMutablePointer<CGGlyph>.alloc(1)
                glyph.initialize(0)
                let  position:UnsafeMutablePointer<CGPoint> = UnsafeMutablePointer<CGPoint>.alloc(1)
                position.initialize(CGPointZero)
                CTRunGetGlyphs(runb, range, glyph)
                CTRunGetPositions(runb, range, position)
                
                let temp3 = CGFloat(position.memory.x)
                let temp2 = (Int)(temp3 / width)
                let temp1 = 0
                if temp2 > temp1 {
                    temp = temp2
                    offset = position.memory.x - (CGFloat(temp) / width)//positon.memory获取Position未进行处理的内存
                }
                let path = CTFontCreatePathForGlyph(runFontS, glyph.memory, nil)
                let x = position.memory.x - (CGFloat(temp) * width) - offset
                let y = position.memory.y - (CGFloat(temp) * 80)
                var transform = CGAffineTransformMakeTranslation(x, y)
                CGPathAddPath(paths, &transform, path)
                glyph.destroy()
                glyph.dealloc(1)
                
                position.destroy()
                position.dealloc(1)
                
                j += 1
            }
            i += 1
        }
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointZero)
        bezierPath.appendPath(UIBezierPath(CGPath: paths))
        return bezierPath
    }
}
