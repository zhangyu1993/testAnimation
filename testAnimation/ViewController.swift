//
//  ViewController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/12.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ViewController: ZYBaseTransitionController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let testArr = ["circle", "slider", "bubble", "transition","appStroetransition", "jumpStar"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        self.view.addSubview(tableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = testArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(CircleController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(SliderMenuController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(ZYBubbleController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ZYFirstViewController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(ZYAppStoreController(), animated: true)
        case 5:
            self.navigationController?.pushViewController(ZYJumpStarController(), animated: true)
        default:
            print("111")
        }
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

