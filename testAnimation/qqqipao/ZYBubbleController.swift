//
//  ZYBubbleController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/14.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYBubbleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let v = ZYBubbleView(frame: CGRect(x: 0, y: 64, width: 375, height: 603))
        self.view.addSubview(v)
        
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
