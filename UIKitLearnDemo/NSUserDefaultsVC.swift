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
        
        // 頁面標題
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "Intro 頁"
        self.view.addSubview(myLabel)
        
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }

}

