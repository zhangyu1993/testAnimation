//
//  ZYAppStoreDetailController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/19.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYAppStoreDetailController: ZYBaseTransitionController {

    let scrollView = UIScrollView()
    let imageView = UIImageView()
    let titleLab = UILabel()
    let textLab = UILabel()
    var imgStr = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        
        scrollView.frame = CGRect(x: 0, y: -20, width: self.view.bounds.width, height: 667 + 20)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 3 / 4.0)
        imageView.image = UIImage.init(named: imgStr)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        scrollView.addSubview(imageView)
        
        titleLab.frame = CGRect(x: 10, y: 30, width: 100, height: 40)
        titleLab.font = UIFont.systemFont(ofSize: 25)
        titleLab.text = "猎萝卜"
        titleLab.textAlignment = .center
        scrollView.addSubview(titleLab)
        
        textLab.frame = CGRect(x: 0, y: imageView.frame.maxY, width: self.view.frame.width, height: 500)
        textLab.text = "猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜猎萝卜"
        textLab.font = UIFont.systemFont(ofSize: 20)
        textLab.numberOfLines = 0
        textLab.textAlignment = .left
        scrollView.addSubview(textLab)
        
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: imageView.frame.height + 500)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
