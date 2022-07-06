//
//  IntroViewController.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/5.
//

import UIKit
import WebKit

class IntroViewController : UIViewController, UITextFieldDelegate, WKNavigationDelegate  {
    
    let fullSize = UIScreen.main.bounds.size
    var myWebView :WKWebView!
    var myActivityIndicator:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        // 頁面標題
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "Intro 頁"
        self.view.addSubview(myLabel)
        
        myWebView = WKWebView(frame: CGRect(x: 0, y: 30, width: fullSize.width,height: fullSize.height - 30))
        myWebView.navigationDelegate = self
        self.view.addSubview(myWebView)
        let myURL = URL(string:"https://www.baidu.com")
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)

        
        
        
//        let myImageView = UIImageView(
//          frame: CGRect(
//            x: 0, y: 0, width: 200, height: 200))
//        let imgArr = [
//            UIImage(named: "01.png")!,
//            UIImage(named: "02.png")!,
//            UIImage(named: "03.png")!,
//        ]
//        myImageView.animationImages = imgArr
//        myImageView.animationDuration = 6
//        myImageView.animationRepeatCount = 0
//        myImageView.startAnimating()
//
//        myImageView.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
//        self.view.addSubview(myImageView)
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }

}
