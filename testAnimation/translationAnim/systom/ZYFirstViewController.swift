//
//  ZYFirstViewController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/14.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYFirstViewController: ZYBaseTransitionController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(frame: CGRect(x: 10, y: 100, width: 50, height: 50))
        btn.setTitle("pop", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnc), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }

    @objc func btnc() {
        self.navigationController?.pushViewController(ZYSecondViewController(), animated: true)
    }
    
    deinit {
        print("ZYFirstViewController释放")
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
