//
//  ZYSliderMenuView.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/13.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

enum ViewPosition {
    case top, left, bottom, right
}

let menuMargin: CGFloat = 50

class ZYSliderMenuView: UIView {
    
    var viewPst: ViewPosition = .bottom
    var viewEdgInsets: UIEdgeInsets!
    
    var customViewLength: CGFloat?
    weak var customView: UIView?
    weak var superV: UIView?
    
    var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect.init(style: UIBlurEffectStyle.dark))
    
    let bothSideView = UIView()
    let centerView = UIView()
    
    init(viewPosition: ViewPosition, customView: UIView, superView: UIView, viewEdg: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        super.init(frame: .zero)
        configUI(viewPosition: viewPosition, cusView: customView, superView: superView, viewEdg: viewEdg)
    }
    
    private func configUI(viewPosition: ViewPosition, cusView: UIView, superView: UIView, viewEdg: UIEdgeInsets) {
        self.viewPst = viewPosition
        self.customView = cusView
        self.superV = superView
        self.viewEdgInsets = viewEdg
        
        self.backgroundColor = .clear
        if let _ = customView, let _ = superV {
            self.frame = CGRect(x: viewEdgInsets.left, y: viewEdgInsets.top, width: superV!.frame.width - viewEdgInsets.left - viewEdgInsets.right, height: superV!.frame.height - viewEdgInsets.top - viewEdgInsets.bottom)
            blurView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
            blurView.alpha = 0.0
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hiden))
            blurView.addGestureRecognizer(tap)
            self.addSubview(blurView)
            customView!.frame = getCustomViewFrame(isShow: false)
            self.addSubview(customView!)
            self.clipsToBounds = true
        }
    }
    
    func show() {
        if let _ = customView, let _ = superV {
            for subV in superV!.subviews{
                if subV is ZYSliderMenuView{
                    return
                }
            }
            superV!.addSubview(self)
            superV!.bringSubview(toFront: self)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.customView!.frame = self.getCustomViewFrame(isShow: true)
                self.blurView.alpha = 0.5
            }) { (state) in
                
            }
        }
    }
    
    @objc func hiden() {
        if let _ = customView, let _ = superV {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.customView!.frame = self.getCustomViewFrame(isShow: false)
                self.blurView.alpha = 0.0
            }) { (state) in
                self.removeFromSuperview()
            }
        }
    }
    
    func getCustomViewFrame(isShow: Bool) -> CGRect {
        if let _ = customView {
            switch viewPst {
            case .top:
                if customViewLength == nil {customViewLength = customView!.frame.height}
                return CGRect(x: 0, y: isShow ? 0 : -(customViewLength! + menuMargin), width: customView!.frame.width, height: customViewLength! + menuMargin)
            case .left:
                if customViewLength == nil {customViewLength = customView!.frame.width}
                return CGRect(x: isShow ? 0 : -(customViewLength! + menuMargin), y: 0, width: customViewLength! + menuMargin, height: customView!.frame.height)
            case .bottom:
                if customViewLength == nil {customViewLength = customView!.frame.height}
                return CGRect(x: 0, y:isShow ? self.frame.height - (customViewLength! + menuMargin) : self.frame.height, width: customView!.frame.width, height: customViewLength! + menuMargin)
            case .right:
                if customViewLength == nil {customViewLength = customView!.frame.width}
                return CGRect(x:isShow ? self.frame.width - (customViewLength! + menuMargin) : self.frame.width, y: 0, width: customViewLength! + menuMargin, height: customView!.frame.height)
            }
        }
        else{
           return .zero
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        print("ZYSliderMenuView释放")
    }
    
}
