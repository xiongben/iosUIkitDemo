//
//  ViewController.swift
//  LimitInputTextField
//
//  Created by admin on 2022/7/28.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var limitedTextView:UITextView!
    var allowInputNumberLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.initNavigationBar()
        self.initInputField()
    }
    
    func initInputField() {
        let naviFrame = self.navigationController?.navigationBar.frame
        let statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame
        let avatarImgView = UIImageView(frame: CGRect(x: 0, y: (naviFrame?.height)! + (statusBarFrame?.height ?? 0) + 10, width: 70, height: 70))
        avatarImgView.image = UIImage(named: "avatar.jpeg")
        self.view.addSubview(avatarImgView)
        
        limitedTextView = UITextView(frame: CGRect(x: 80, y: avatarImgView.frame.height, width: self.view.frame.width - 70 - 20, height: 300))
        self.view.addSubview(limitedTextView)
        limitedTextView.delegate = self
        limitedTextView.font = UIFont.systemFont(ofSize: 20)
        
        allowInputNumberLabel = UILabel(frame: CGRect(x: self.view.frame.width - 50, y: self.view.frame.height - 40, width: 50, height: 40))
        self.view.addSubview(allowInputNumberLabel)
        allowInputNumberLabel.text = "140"
        allowInputNumberLabel.textAlignment = .right
    }
    
    func initNavigationBar() {
        let leftItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "Tweet", style: .plain, target: self, action: nil)
        rightItem.tintColor = .green
        navigationItem.rightBarButtonItem = rightItem
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let currentCharactorCount = (textView.text?.count) ?? 0
        if currentCharactorCount >= 140 {
            limitedTextView.resignFirstResponder()
        }
        allowInputNumberLabel.text = "\(140 - currentCharactorCount)"
    }
    
    


}

