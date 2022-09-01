//
//  KycController.swift
//  TestSDK
//
//  Created by admin on 2022/9/1.
//

import UIKit
import WebKit

open class KycViewController: UIViewController, WKNavigationDelegate {
    
    let fullScreenSize = UIScreen.main.bounds.size
    var myWebView :WKWebView!
   
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs") // 解决web同源策略问题
        myWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height),configuration: webConfiguration)

        
        myWebView.navigationDelegate = self
        
        
        self.view.addSubview(myWebView)

        
        let myPath = Bundle.main.path(forResource: "index", ofType: "html")
        let myURL = URL(fileURLWithPath: myPath!)
        
    
        myWebView.loadFileURL(myURL, allowingReadAccessTo: Bundle.main.bundleURL)
    }
}
