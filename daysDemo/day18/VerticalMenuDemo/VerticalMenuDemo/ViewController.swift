//
//  ViewController.swift
//  VerticalMenuDemo
//
//  Created by admin on 2022/8/13.
//

import UIKit

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

}

public enum ViewControllerNavigationType:Int {
    case Present = 0
    case Dismiss = 1
}
