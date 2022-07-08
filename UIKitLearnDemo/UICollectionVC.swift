//
//  UICollectionVC.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/8.
//

import UIKit

class UICollectionVC : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
//        // 頁面標題
//        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
//        myLabel.center = CGPoint(x: fullScreenSize.width * 0.5, y: fullScreenSize.height * 0.08)
//        myLabel.textAlignment = .center
//        myLabel.text = "UICollectionVC 页面"
//        self.view.addSubview(myLabel)
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width)/3 - 10.0, height: CGFloat(fullScreenSize.width)/3 - 10.0)
        // 設置 header 及 footer 的尺寸
        layout.headerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        layout.footerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        // 建立 UICollectionView
        let myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 20, width: fullScreenSize.width, height: fullScreenSize.height - 20), collectionViewLayout: layout)
        // 註冊 cell 以供後續重複使用
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        // 註冊 section 的 header 跟 footer 以供後續重複使用
        myCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        myCollectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        self.view.addSubview(myCollectionView)
    }
    
    // 必須实现的方法：每一組有幾個 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        
        cell.imageView.image = UIImage(named: "02.png")
        cell.titleLabel.text = "0\(indexPath.item + 1)"
        
        return cell
    }
    
    // 有几个section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 点击cell之后执行的动作
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你选择了第\(indexPath.section + 1) 组的")
        print("第\(indexPath.item + 1)张图片")
    }
    
    // 设置reuse的section的header或footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView = UICollectionReusableView()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
        label.textAlignment = .center
        if kind == UICollectionView.elementKindSectionHeader {
            // 依據前面註冊設置的識別名稱 "Header" 取得目前使用的 header
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath)
            // 設置 header 的內容
            reusableView.backgroundColor = UIColor.darkGray
            label.text = "Header"
            label.textColor = UIColor.white
        } else if kind == UICollectionView.elementKindSectionFooter {
            // 依據前面註冊設置的識別名稱 "Footer" 取得目前使用的 footer
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "Footer", for: indexPath)
            // 設置 footer 的內容
            reusableView.backgroundColor = UIColor.cyan
            label.text = "Footer"
            label.textColor = UIColor.black
        }
        
        reusableView.addSubview(label)
        return reusableView
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }

}






class MyCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 取得螢幕寬度
        let w = Double(UIScreen.main.bounds.size.width)
        
        // 建立一個 UIImageView
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: w/3 - 10.0, height: w/3 - 10.0))
        self.addSubview(imageView)
        
        // 建立一個 UILabel
        titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: w/3 - 10.0, height: 40))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.orange
        self.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
