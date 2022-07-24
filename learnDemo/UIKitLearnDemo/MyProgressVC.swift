//
//  MyProgressVC.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/12.
//

import UIKit

class MyProgressVC : UIViewController  {
    
    let fullSize = UIScreen.main.bounds.size
    var myProgressView: UIProgressView!
    var myActivityIndicator: UIActivityIndicatorView!
    var myTimer: Timer?
    var myButton: UIButton!
    var count = 0
    let complete = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        myProgressView = UIProgressView(progressViewStyle: .default)
        myProgressView.progressTintColor = UIColor.blue
        myProgressView.trackTintColor = UIColor.orange
        myProgressView.frame = CGRect(x: 0, y: 0, width: fullSize.width * 0.8, height: 50)
        myProgressView.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.2)
        self.view.addSubview(myProgressView)
        
        myActivityIndicator = UIActivityIndicatorView(style: .large)
        myActivityIndicator.color = UIColor.red
        myActivityIndicator.backgroundColor = UIColor.gray
        myActivityIndicator.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myActivityIndicator)
        
        myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Reset", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(nil, action: #selector(self.clickButton), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.65)
        self.view.addSubview(myButton)

        // 先執行一次進度條的動作
        self.clickButton()
        
    }
    
    @objc func clickButton() {
        myButton.isEnabled = false
        myProgressView.progress = 0
        myActivityIndicator.startAnimating()
        myTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.showProgress), userInfo: ["test":"for userInfo test"], repeats: true)
    }
    
    @objc func showProgress(_ sender: Timer) {
        count += 5
        myProgressView.progress = Float(count) / Float(complete)
        if count >= complete {
            let info = sender.userInfo as? Dictionary<String, AnyObject>
            print(info?["test"] ?? "")
            
            count = 0
            myTimer?.invalidate()
            myTimer = nil
            
            myActivityIndicator.stopAnimating()
            myButton.isEnabled = true
        }
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }

}
