//
//  ZYBubbleView.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/14.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYBubbleView: UIView {

    var r1: CGFloat = 0
    var r2: CGFloat = 0
    var x1: CGFloat = 0
    var y1: CGFloat = 0
    var x2: CGFloat = 0
    var y2: CGFloat = 0
    var centerDistance: CGFloat = 0
    var sinDigree: CGFloat = 0
    var cosDigree: CGFloat = 0
    var pointA: CGPoint = .zero
    var pointB: CGPoint = .zero
    var pointC: CGPoint = .zero
    var pointD: CGPoint = .zero
    var pointO: CGPoint = .zero
    var pointP: CGPoint = .zero
    
    var backView = UIView()
    var frontView = UIView()
    var oldFrontViewCenter: CGPoint = .zero
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    func configUI() {
        backView.frame = CGRect(x: 170, y: 150, width: 20, height: 20)
        frontView.frame = CGRect(x: 270, y: 60, width: 20, height: 20)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(pan(p:)))
        frontView.addGestureRecognizer(pan)
        
        backView.backgroundColor = UIColor.black
        backView.alpha = 0.3
        frontView.backgroundColor = .blue
        frontView.alpha = 0.3
        self.addSubview(backView)
        self.addSubview(frontView)
        self.backgroundColor = UIColor.white
        oldFrontViewCenter = frontView.center
        
        reDraw()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        path.move(to: pointA)
        
        path.addQuadCurve(to: pointD, controlPoint: pointO)
        
        path.addArc(withCenter: self.frontView.center, radius: r2, startAngle: getFrontAngle().startAngle, endAngle: getFrontAngle().endAngle, clockwise: true)
        
        path.addQuadCurve(to: pointB, controlPoint: pointP)

        path.addArc(withCenter: self.backView.center, radius: r1, startAngle: getBackAngle().startAngle, endAngle: getBackAngle().endAngle, clockwise: true)
        path.close()
        
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(path.cgPath)
        context?.setFillColor(UIColor.red.cgColor)
//        context?.setStrokeColor(UIColor.red.cgColor)
        context?.fillPath()
//        context?.strokePath()
    }
    
    @objc func pan(p: UIPanGestureRecognizer) {
        if p.state == .changed {
            print(p.translation(in: self))
            let tranP = p.translation(in: self)
            frontView.center = CGPoint(x: oldFrontViewCenter.x + tranP.x, y: oldFrontViewCenter.y + tranP.y)
            reDraw()
        }
        if p.state == .ended {
            oldFrontViewCenter = frontView.center
        }
    }
    
    func reDraw() {
        x1 = backView.center.x
        y1 = backView.center.y
        x2 = self.frontView.center.x
        y2 = self.frontView.center.y
        centerDistance = CGFloat(sqrt(Double((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1))))
        if (centerDistance == 0) {
            cosDigree = 1
            sinDigree = 0
        }else{
            cosDigree = (y2-y1)/centerDistance
            sinDigree = (x2-x1)/centerDistance
        }
        r1 = backView.frame.size.width / 2 - centerDistance * 0.02
        r2 = frontView.frame.size.width / 2
        pointA = CGPoint(x: x1+r1*cosDigree, y: y1-r1*sinDigree) // A
        pointB = CGPoint(x: x1-r1*cosDigree, y: y1+r1*sinDigree) // B
        pointD = CGPoint(x: x2+r2*cosDigree, y: y2-r2*sinDigree) // D
        pointC = CGPoint(x: x2-r2*cosDigree, y: y2+r2*sinDigree)// C
        pointO = CGPoint(x: pointA.x + (centerDistance / 2)*sinDigree, y: pointA.y + (centerDistance / 2)*cosDigree)
        pointP = CGPoint(x: pointB.x + (centerDistance / 2)*sinDigree, y: pointB.y + (centerDistance / 2)*cosDigree)
        self.setNeedsDisplay()
    }
    
    func getFrontAngle() -> (startAngle: CGFloat, endAngle: CGFloat){
        if (x2 >= x1) && (y2 <= y1) {
            return (-acos(cosDigree), -acos(cosDigree) + CGFloat.pi)
        }
        else if (x2 > x1) && (y2 > y1) {
            return (-acos(cosDigree), -acos(cosDigree) + CGFloat.pi)
        }
        else if (x2 <= x1) && (y2 > y1) {
            return (acos(cosDigree), acos(cosDigree) + CGFloat.pi)
        }
        else if (x2 <= x1) && (y2 < y1) {
            return (CGFloat(acos(cosDigree)), CGFloat(acos(cosDigree) + CGFloat.pi))
        }
        else{
            return (0, 0)
        }
    }
    
    func getBackAngle() -> (startAngle: CGFloat, endAngle: CGFloat) {
        if (x2 >= x1) && (y2 <= y1) {
            return (-acos(cosDigree) + CGFloat.pi, -acos(cosDigree))
        }
        else if (x2 > x1) && (y2 > y1) {
            return (-acos(cosDigree) + CGFloat.pi, -acos(cosDigree))
        }
        else if (x2 <= x1) && (y2 > y1) {
            return (acos(cosDigree) + CGFloat.pi, acos(cosDigree))
        }
        else if (x2 <= x1) && (y2 < y1) {
            return (CGFloat(acos(cosDigree)) + CGFloat.pi, CGFloat(acos(cosDigree)))
        }
        else{
            return (0, 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
