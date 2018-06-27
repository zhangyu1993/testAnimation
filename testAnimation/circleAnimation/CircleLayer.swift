//
//  CircleLayer.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/12.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

enum MovingDiraction {
    case left
    case right
}

class CircleLayer: CALayer {

    let outsideRectSize: CGFloat = 90
    
    var progress: CGFloat = 0.5 {
        didSet {
            moveP = progress <= 0.5 ? .left : .right
            outsideRect = CGRect(x: self.bounds.size.width / 2 - outsideRectSize / 2 + (progress - 0.5)*(self.bounds.size.width - outsideRectSize) , y: self.bounds.size.height / 2 - outsideRectSize / 2, width: outsideRectSize, height: outsideRectSize)
            self.setNeedsDisplay()
        }
    }
    var outsideRect: CGRect!
    var moveP: MovingDiraction!
    
    override init() {
        super.init()
    }
    
    override func draw(in ctx: CGContext) {
        
        let eOffset = outsideRect.width / 3.6
        let movedDistence = outsideRect.width / 6 * fabs((progress - 0.5) * 2)
        
        let pointA = CGPoint(x: outsideRect.midX, y: outsideRect.minY + movedDistence)
        let pointB = CGPoint(x: moveP == .right ? outsideRect.maxX : outsideRect.maxX + movedDistence * 2 , y: outsideRect.midY)
        let pointC = CGPoint(x: outsideRect.midX, y: outsideRect.maxY - movedDistence)
        let pointD = CGPoint(x: moveP == .left ? outsideRect.minX : outsideRect.minX - movedDistence * 2 , y: outsideRect.midY)
        
        let e1 = CGPoint(x: pointA.x + eOffset, y: pointA.y)
        let e2 = CGPoint(x: pointB.x,           y: pointB.y - eOffset + (moveP == .right ? 0 : movedDistence))
        let e3 = CGPoint(x: pointB.x,           y: pointB.y + eOffset - (moveP == .right ? 0 : movedDistence))
        let e4 = CGPoint(x: pointC.x + eOffset, y: pointC.y)
        let e5 = CGPoint(x: pointC.x - eOffset, y: pointC.y)
        let e6 = CGPoint(x: pointD.x,           y: pointD.y + eOffset - (moveP == .right ? movedDistence : 0))
        let e7 = CGPoint(x: pointD.x,           y: pointD.y - eOffset + (moveP == .right ? movedDistence : 0))
        let e8 = CGPoint(x: pointA.x - eOffset, y: pointA.y)
        
        let ovalPath = UIBezierPath()
        ovalPath.move(to: pointA)
        ovalPath.addCurve(to: pointB, controlPoint1: e1, controlPoint2: e2)
        ovalPath.addCurve(to: pointC, controlPoint1: e3, controlPoint2: e4)
        ovalPath.addCurve(to: pointD, controlPoint1: e5, controlPoint2: e6)
        ovalPath.addCurve(to: pointA, controlPoint1: e7, controlPoint2: e8)
        ovalPath.close()
        
        ctx.strokePath()
        ctx.addPath(ovalPath.cgPath)
        ctx.setStrokeColor(UIColor.red.cgColor)
        ctx.setFillColor(UIColor.yellow.cgColor)
        ctx.drawPath(using: CGPathDrawingMode.fillStroke)
        

        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
        
    
    
}
