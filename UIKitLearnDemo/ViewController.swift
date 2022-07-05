//
//  ViewController.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/6/27.
//

import UIKit

class ViewController: UIViewController {
    
    // 取得螢幕的尺寸
    let fullSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.view.addSubview(firstView)
        firstView.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.5)
        firstView.backgroundColor = UIColor.blue
        
        // 建立前往 Intro 頁面的 UIButton
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Intro", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(self, action: #selector(goIntro), for: .touchDown)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myButton)
    }

    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }
    
    @objc func goIntro() {
        
        let introViewController = IntroViewController()
        print("viewWillDisappear")
        self.present(introViewController, animated: true, completion: nil)
    }
}

