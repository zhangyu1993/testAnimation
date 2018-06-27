//
//  CircleController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/13.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class CircleController: UIViewController {

    
    let circle = CircleLayer()
    var sli: UISlider = UISlider()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        sli.frame = CGRect(x: 50, y:70 , width: 200, height: 30)
        sli.addTarget(self, action: #selector(valuechanged(v:)), for: .valueChanged)
        sli.value = 0.5
        self.view.addSubview(sli)
        
        circle.bounds = CGRect(x: 0, y: 0, width: 300, height: 400)
        circle.position = self.view.center
        circle.contentsScale = UIScreen.main.scale
        circle.progress = 0.5
        self.view.layer.addSublayer(circle)
        
        circle.backgroundColor = UIColor.blue.cgColor
    }

    @objc func valuechanged(v: UISlider) {
        circle.progress = CGFloat(v.value)
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
