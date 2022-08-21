//
//  ViewController.swift
//  WebDemo
//
//  Created by admin on 2022/8/20.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    let fullScreenSize = UIScreen.main.bounds.size
    var myWebView :WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height))

        // 設置委任對象
        myWebView.navigationDelegate = self
        
        // 加入到畫面中
        self.view.addSubview(myWebView)
//        let url = URL(string:"https://liveness-check.coinsdo.com/#/kyc-about")
//        let urlRequest = URLRequest(url: url!)
//        myWebView.load(urlRequest)
        
        let myPath = Bundle.main.path(forResource: "index", ofType: "html")
        let myURL = URL(fileURLWithPath: myPath!)
        myWebView.loadFileURL(myURL, allowingReadAccessTo: Bundle.main.bundleURL)
    }
    
    
    


}

