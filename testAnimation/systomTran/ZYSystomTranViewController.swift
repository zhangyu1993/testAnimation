//
//  ZYSystomTranViewController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/8/20.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYSystomTranViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(btnClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }

    @objc func btnClick() {
        let vc = ZYSystomViewController1()
        self.navigationController?.view.layer.add(pushAnimation(), forKey: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    func pushAnimation() -> CATransition {
        /*私有API
         cube                   立方体效果
         pageCurl               向上翻一页
         pageUnCurl             向下翻一页
         rippleEffect           水滴波动效果
         suckEffect             变成小布块飞走的感觉
         oglFlip                上下翻转
         cameraIrisHollowClose  相机镜头关闭效果
         cameraIrisHollowOpen   相机镜头打开效果
         */
        //下面四个是系统公有的API
        //kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade
        let caTran = CATransition.init()
        caTran.duration = 3
        caTran.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionDefault)
        caTran.type = "cube"
//        caTran.subtype = kCATransitionFromRight
        return caTran
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
