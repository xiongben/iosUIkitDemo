//
//  NSUserDefaultsVC.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/8.
//

import UIKit

class NSUserDefaultsVC : UIViewController  {
    
    let fullSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
    
        // 取得儲存的預設資料
        let myUserDefaults = UserDefaults.standard
        
        // 顯示儲存資訊的 UILabel
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.textColor = UIColor.brown
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.25)
        
        if let info = myUserDefaults.object(forKey: "info") as? String {
            myLabel.text = info
        } else {
            myLabel.text = "尚未儲存資訊"
            myLabel.textColor = UIColor.red
        }
        
        self.view.addSubview(myLabel)
        
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }

}

