//
//  ViewController.swift
//  VerticalMenuDemo
//
//  Created by admin on 2022/8/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imgView = UIImageView(frame: self.view.frame)
        imgView.image = UIImage(named: "Photo10")
        self.view.addSubview(imgView)
        let menuButtonBar = UIBarButtonItem(title: "🎾", style: .plain, target: self, action: #selector(triggerMenu))
        self.navigationItem.leftBarButtonItem = menuButtonBar
    }
    
    @objc func triggerMenu() {
        
    }

}

