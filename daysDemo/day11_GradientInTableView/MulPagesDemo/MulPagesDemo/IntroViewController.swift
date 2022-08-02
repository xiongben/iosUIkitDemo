//
//  IntroViewController.swift
//  MulPagesDemo
//
//  Created by admin on 2022/8/2.
//

import UIKit

class IntroViewController: UIViewController {
    
    let fullSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // 頁面標題
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "Intro 頁"
        self.view.addSubview(myLabel)
        
        // 建立前往 Detail 頁面的 UIButton
        var myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Detail", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(nil, action: #selector(self.goDetail), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.3)
        self.view.addSubview(myButton)
        
        // 返回主頁面的 UIButton
        myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("回前頁", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(nil, action: #selector(self.goBack), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        self.view.addSubview(myButton)
    }
    
    @objc func goDetail() {
        self.present(ArticleDetailViewController(), animated: true)
    }
    
    @objc func goBack() {
        self.dismiss(animated: true)
    }
}
