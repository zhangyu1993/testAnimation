//
//  ZYJumpStarController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/21.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYJumpStarController: ZYBaseTransitionController {

    var animating = false
    
    let v = ZYJumpStarView(frame: CGRect(x: 30, y: 100, width: 20, height: 20))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 10, y: 74, width: 30, height: 30)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(btnclick), for: .touchUpInside)
        btn.setTitle("跳", for: .normal)
        self.view.addSubview(btn)
        v.imageState = .star
        self.view.addSubview(v)
    }
    

    @objc func btnclick() {
        v.animation()
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
