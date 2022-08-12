//
//  SecondViewController.swift
//  SideNavigationDemo
//
//  Created by admin on 2022/8/12.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "SecondViewController"))
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        self.navigationController?.isNavigationBarHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
