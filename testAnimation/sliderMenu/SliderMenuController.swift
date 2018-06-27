//
//  SliderMenuController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/13.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class zttestTab: UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("tab释放")
    }
}

class SliderMenuController: UIViewController {

    var sl: ZYSliderMenuView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "pop", style: UIBarButtonItemStyle.plain, target: self, action: #selector(pop))
        
    }

    @objc func pop () {
        if sl == nil {
            let tableV = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 300), style: .plain)
            tableV.backgroundColor = .red
            sl = ZYSliderMenuView(viewPosition: .top, customView: tableV, superView: self.view, viewEdg: UIEdgeInsetsMake(104, 0, 0, 0))
        }
        sl?.show()
//        let tableV = zttestTab(frame: CGRect(x: 0, y: 0, width: 375, height: 300), style: .plain)
//        tableV.backgroundColor = .red
//        ZYSliderMenuView(viewPosition: .bottom, customView: tableV, superView: self.view, viewEdg: UIEdgeInsetsMake(0, 0, 44, 0)).show()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    deinit {
        print("vc释放")
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
