//
//  DetailViewController.swift
//  CustomTransition
//
//  Created by admin on 2022/8/14.
//

import UIKit

class DetailViewController: UIViewController,UINavigationControllerDelegate {
    
    var bannerImageView: UIImageView!
    var img: UIImage!
    
    let RothkoDesciption = "this is a detail descripe"
    
    fileprivate var percentDrivenTransition: UIPercentDrivenInteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerImageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 400, height: 400))
        bannerImageView.center.x = self.view.center.x
        self.view.addSubview(bannerImageView)
        
        let textView = UITextView(frame: CGRect(x: 0, y: 500, width: self.view.frame.width, height: self.view.frame.height - 500))
        textView.text = RothkoDesciption
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = UIColor.black
        textView.textColor = UIColor.white
        self.view.addSubview(textView)
        
        self.navigationController?.delegate = self
        
        //手势监听器
        let edgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePanGestrueAction(_:)))
        edgePanGesture.edges = UIRectEdge.left
        self.view.addGestureRecognizer(edgePanGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationController.Operation.pop {
            return CustomPopTransition()
        }
        else {
            return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if animationController is CustomPopTransition {
            return self.percentDrivenTransition
        }
        else {
            return nil
        }
    }
        
    @objc func edgePanGestrueAction(_ edgePan:UIScreenEdgePanGestureRecognizer){
        let progress = edgePan.translation(in: self.view).x / self.view.bounds.width
        
        if edgePan.state == UIGestureRecognizer.State.began {
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewController(animated: true)
        } else if edgePan.state == UIGestureRecognizer.State.changed {
            self.percentDrivenTransition?.update(progress)
        } else if edgePan.state == UIGestureRecognizer.State.cancelled || edgePan.state == UIGestureRecognizer.State.ended {
            if progress > 0.5 {
                self.percentDrivenTransition?.finish()
            } else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
        }
    }
    
}
