//
//  ArticleViewController.swift
//  MulPagesDemo
//
//  Created by admin on 2022/8/2.
//

import UIKit

class ArticleViewController: UIViewController {
    
    let fullSize = UIScreen.main.bounds.size
    var data: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 設置底色
        self.view.backgroundColor = UIColor.white

        // 頁面標題
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "Article 頁"
        self.view.addSubview(myLabel)
        
        let dataLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        dataLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.3)
        dataLabel.textAlignment = .center
        dataLabel.text = self.data
        self.view.addSubview(dataLabel)
        
        // 返回主頁面的 UIButton
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("回前頁", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(nil, action: #selector(self.goBack), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myButton)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion:nil)
    }
}
