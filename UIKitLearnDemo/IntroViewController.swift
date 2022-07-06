//
//  IntroViewController.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/5.
//

import UIKit

class IntroViewController : UIViewController {
    
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
        
        let myImageView = UIImageView(
          frame: CGRect(
            x: 0, y: 0, width: 200, height: 200))
        let imgArr = [
            UIImage(named: "01.png")!,
            UIImage(named: "02.png")!,
            UIImage(named: "03.png")!,
        ]
        myImageView.animationImages = imgArr
        myImageView.animationDuration = 6
        myImageView.animationRepeatCount = 0
        myImageView.startAnimating()
        
        myImageView.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myImageView)
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }
}
