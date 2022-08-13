//
//  ViewController.swift
//  SideNavigationDemo
//
//  Created by admin on 2022/8/10.
//
import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "ViewController"))
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        self.navigationController?.isNavigationBarHidden = true
        print(self.revealViewController() as Any)
//        self.view.addGestureRecognizer(self.revealViewController()!.panGestureRecognizer())
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print(self.revealViewController() as Any)
//    }
//

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}



