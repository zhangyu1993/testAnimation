//
//  ZYJumpStarView.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/22.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

enum ImageState {
    case star, moon
}

class ZYJumpStarView: UIView, CAAnimationDelegate {

    var imageState: ImageState = .star {
        didSet {
            imageView.image = UIImage.init(named: imageState == .star ? "icon_star_incell" : "blue_dot")
        }
    }
    
    private let imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        confgiUI()
    }
    
    private func confgiUI() {
        self.addSubview(imageView)
        imageView.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        imageView.center = self.center
        imageView.contentMode = .scaleToFill
    }
    
    func animation() {
        let tAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        tAnimation.fromValue = 0
        tAnimation.toValue = Double.pi / 2
        tAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let pAnimation = CABasicAnimation(keyPath: "position.y")
        pAnimation.fromValue = imageView.center.y
        pAnimation.toValue = imageView.center.y - 14
        pAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 0.3
        animationGroup.beginTime = CACurrentMediaTime()
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.animations = [tAnimation, pAnimation]
        animationGroup.delegate = self
        imageView.layer.add(animationGroup, forKey: "jumpUp")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim == imageView.layer.animation(forKey: "jumpUp") {
            imageState = imageState == .star ? .moon : .star
            let tAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
            tAnimation.fromValue = Double.pi / 2
            tAnimation.toValue = Double.pi
            tAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            let pAnimation = CABasicAnimation(keyPath: "position.y")
            pAnimation.fromValue = imageView.center.y - 14
            pAnimation.toValue = imageView.center.y
            pAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            let animationGroup = CAAnimationGroup()
            animationGroup.duration = 0.3
            animationGroup.beginTime = CACurrentMediaTime()
            animationGroup.fillMode = kCAFillModeForwards
            animationGroup.isRemovedOnCompletion = false
            animationGroup.animations = [tAnimation, pAnimation]
            animationGroup.delegate = self
            imageView.layer.add(animationGroup, forKey: "jumpDown")
        }
        else if anim == imageView.layer.animation(forKey: "jumpDown") {
            imageView.layer.removeAllAnimations()
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
