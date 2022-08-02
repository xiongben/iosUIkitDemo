//
//  ViewController.swift
//  MulPagesDemo
//
//  Created by admin on 2022/8/2.
//

import UIKit

class ViewController: UIViewController {
    
    let fullSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        // 頁面標題
        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.08)
        myLabel.textAlignment = .center
        myLabel.text = "首頁"
        self.view.addSubview(myLabel)
        
        // 建立前往 Article 頁面的 UIButton
        var myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Article", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(nil, action: #selector(ViewController.goArticle), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.2)
        self.view.addSubview(myButton)

        // 建立前往 Intro 頁面的 UIButton
        myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Intro", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(nil, action: #selector(ViewController.goIntro), for: .touchUpInside)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myButton)
        
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @objc func goArticle() {
        self.navigationController?.pushViewController(ArticleViewController(), animated: true)
//        self.present(ArticleViewController(), animated: true)
    }
    
    @objc func goIntro() {
        self.present(IntroViewController(), animated: true)
    }

}

