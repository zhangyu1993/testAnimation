//
//  ZYAnimationAppStore.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/19.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYAnimationAppStore: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var operation: UINavigationControllerOperation = .none
    
    init(operation: UINavigationControllerOperation) {
        self.operation = operation
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let contentView = transitionContext.containerView
        let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
        let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
        
        if self.operation == .push {
            if let fromVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? ZYAppStoreController, let toVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? ZYAppStoreDetailController {
                
                if let cell = fromVc.collectView.cellForItem(at: fromVc.selectIdx) as? ZYAppStoreCell{
                    let imgF = cell.img.convert(cell.img.bounds, to: fromVc.view)
                    print(imgF)
                }
                
                contentView.addSubview(toVc.view)
                fromVc.view.center = CGPoint(x: 375 / 2.0, y: 667 / 2)
                toVc.view.center = CGPoint(x: 375 + 375 / 2.0, y: 667 / 2)
                UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                               delay: 0,
                               //                               usingSpringWithDamping: 1,
                    //                               initialSpringVelocity: 1,
                    options: UIViewAnimationOptions.curveLinear, animations: {
                        fromVc.view.center = CGPoint(x: 375 / 2.0 - 50, y: 667 / 2)
                        toVc.view.center = CGPoint(x: 375 / 2, y: 667 / 2)
                        statusBar.frame = CGRect(x: 0, y: -20, width: 375, height: 20)
                }) { (state) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
            }
        }
        else if self.operation == .pop {
            if let fromVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? ZYAppStoreDetailController, let toVc = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? ZYAppStoreController {
                contentView.addSubview(toVc.view)
                contentView.bringSubview(toFront: fromVc.view)
                fromVc.view.center = CGPoint(x: 375 / 2.0, y: 667 / 2)
                toVc.view.center = CGPoint(x: 375 / 2.0 - 50, y: 667 / 2)
                
                UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                               delay: 0,
                               //                               usingSpringWithDamping: 0,
                    //                               initialSpringVelocity: 0,
                    options: UIViewAnimationOptions.curveLinear, animations: {
                        toVc.view.center = CGPoint(x: 375 / 2.0, y: 667 / 2)
                        fromVc.view.center = CGPoint(x: 375 / 2.0 + 375, y: 667 / 2)
                        statusBar.frame = CGRect(x: 0, y: 0, width: 375, height: 20)
                }) { (state) in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                }
                
            }
        }
    }
    
    
    deinit {
        print("ZYCustomTransition释放")
    }
    
    
}
