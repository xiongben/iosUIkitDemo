//
//  ViewController.swift
//  WebDemo
//
//  Created by admin on 2022/8/20.
//

import Foundation
import UIKit
import WebKit
import TestSDK

class ViewController: UIViewController, WKNavigationDelegate {
    
    let fullScreenSize = UIScreen.main.bounds.size
    var myWebView :WKWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs") // 解决web同源策略问题
        myWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: fullScreenSize.height),configuration: webConfiguration)


        myWebView.navigationDelegate = self


        self.view.addSubview(myWebView)


        let myPath = Bundle.main.path(forResource: "index", ofType: "html")!
//        myPath.addingPercentEncoding(withAllowedCharacters: <#T##CharacterSet#>)
        print(myPath )
        
       
    
        let myURL = URL(fileURLWithPath: myPath)
        
        let myURL2 = URL(string: "?aa=11", relativeTo: myURL)
        print(myURL2)
        
        myWebView.loadFileURL(myURL2!, allowingReadAccessTo: Bundle.main.bundleURL)
        
        let mybutton = UIButton(frame: CGRect(x: 50, y: 150, width: 150, height: 50))
        mybutton.setTitle("to other page", for: .normal)
        mybutton.setTitleColor(.blue, for: .normal)
        mybutton.addTarget(self, action: #selector(toPage), for: .touchDown)
//        self.view.addSubview(mybutton)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(navigationAction.request.url!)
        decisionHandler(WKNavigationActionPolicy.allow)
        return
    }
    
    @objc func toPage() {
        let destinationPage = KycViewController()
        self.present(destinationPage, animated: true)
    }
    
    


}

