//
//  ViewController.swift
//  VerticalMenuDemo
//
//  Created by admin on 2022/8/13.
//

import UIKit
import Alamofire

class ViewController: UIViewController, CustomTransitionDelegate, UIViewControllerTransitioningDelegate {
    
    var transition = CustomTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imgView = UIImageView(frame: self.view.frame)
        imgView.image = UIImage(named: "Photo10")
        self.view.addSubview(imgView)
        let menuButtonBar = UIBarButtonItem(title: "🎾", style: .plain, target: self, action: #selector(triggerMenu))
        self.navigationItem.leftBarButtonItem = menuButtonBar
        self.getNetData()
    }
    
    @objc func triggerMenu() {
        let menuViewController = MenuViewController()
        menuViewController.transitioningDelegate = self
        menuViewController.modalPresentationStyle = .custom
        self.navigationController?.present(menuViewController, animated: true)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.navigationType = .Dismiss
        return transition
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.delegate = self
        transition.navigationType = .Present
        return transition
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
    
    func getNetData () {
        let url = "https://api.caiyunapp.com/v2.5/QDmiwTuafsPwY047/121.6544,25.1552/realtime.json"
        AF.request(url).response { response in
            let jsonData = response.value
            let dict = try? JSONSerialization.jsonObject(with: jsonData!!, options: .mutableContainers)
            if(dict != nil){
              let value : NSDictionary = dict as! NSDictionary
                print(value["lang"] as! String)
            }
        }
    
    }

}

public enum ViewControllerNavigationType:Int {
    case Present = 0
    case Dismiss = 1
}
