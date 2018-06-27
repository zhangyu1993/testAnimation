//
//  ZYAppStoreController.swift
//  testAnimation
//
//  Created by zhangyu on 2018/6/19.
//  Copyright © 2018年 zhangyu. All rights reserved.
//

import UIKit

class ZYAppStoreCell: UICollectionViewCell {
    
    let img = UIImageView()
    let titLab = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    func configUI() {
        img.frame = self.contentView.bounds
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        self.contentView.addSubview(img)
        
        titLab.center = CGPoint(x: self.contentView.center.x, y: 30)
        titLab.bounds = CGRect(x: 0, y: 0, width: 100, height: 40)
        titLab.text = "猎萝卜"
        titLab.font = UIFont.systemFont(ofSize: 25)
        titLab.textAlignment = .center
        self.contentView.addSubview(titLab)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


class ZYAppStoreController: ZYBaseTransitionController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectView: UICollectionView!
    var selectIdx: IndexPath = IndexPath.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 335.0, height: 335 / 3.0 * 3.5)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 20
        collectView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(ZYAppStoreCell.self, forCellWithReuseIdentifier: "ZYAppStoreCell")
        collectView.backgroundColor = .white
        self.view.addSubview(collectView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ZYAppStoreCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZYAppStoreCell", for: indexPath) as! ZYAppStoreCell
        cell.img.image = UIImage.init(named: "广告页3-2" + "\(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectIdx = indexPath
        let vc = ZYAppStoreDetailController()
        vc.imgStr = "广告页3-2" + "\(indexPath.row)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        let cell: ZYAppStoreCell = collectView.cellForItem(at: indexPath) as! ZYAppStoreCell
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
        return true
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell: ZYAppStoreCell = collectView.cellForItem(at: indexPath) as! ZYAppStoreCell
        UIView.animate(withDuration: 0.2) {
            cell.transform = CGAffineTransform.identity
        }
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
