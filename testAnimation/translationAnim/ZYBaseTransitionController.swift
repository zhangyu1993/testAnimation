//
//  ZYBaseTransitionController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/14.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYBaseTransitionController: UIViewController, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
    private var percentDrivenTransition :UIPercentDrivenInteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let edgePan = UIScreenEdgePanGestureRecognizer.init(target: self, action:#selector(edgePanGesture(edgePan:)))
        edgePan.edges = UIRectEdge.left
        self.view.addGestureRecognizer(edgePan)
    }

    
    @objc func edgePanGesture(edgePan:UIScreenEdgePanGestureRecognizer){
        let progress = edgePan.translation(in: self.view).x / self.view.bounds.width
        if edgePan.state == UIGestureRecognizerState.began {
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewController(animated: true)
        } else if edgePan.state == UIGestureRecognizerState.changed {
            self.percentDrivenTransition?.update(progress)
//            if progress > 0.3 {
//                self.percentDrivenTransition?.finish()
//                self.percentDrivenTransition = nil
//            }
        } else if edgePan.state == UIGestureRecognizerState.cancelled || edgePan.state == UIGestureRecognizerState.ended {
            if progress > 0.3 {
                self.percentDrivenTransition?.finish()
            } else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
        }
    }
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if toVC.isMember(of: ZYAppStoreDetailController.self) && fromVC.isMember(of: ZYAppStoreController.self) || toVC.isMember(of: ZYAppStoreController.self) && fromVC.isMember(of: ZYAppStoreDetailController.self)  {
            return ZYAnimationAppStore(operation: operation)
        }
        else if toVC is ZYBaseTransitionController {
            return ZYCustomTransition(operation: operation)
        }
        else {
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is ZYCustomTransition {
            return self.percentDrivenTransition
        }
        else if animationController is ZYAnimationAppStore{
            return self.percentDrivenTransition
        }
        else {
            return nil
        }
    }
    
    deinit {
        print("\(self)释放")
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
