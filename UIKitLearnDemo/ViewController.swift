//
//  ViewController.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/6/27.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // 取得螢幕的尺寸
    let fullSize = UIScreen.main.bounds.size
    var myTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let firstView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        self.view.addSubview(firstView)
//        firstView.center = CGPoint(x: fullSize.width*0.5, y: fullSize.height*0.5)
//        firstView.backgroundColor = UIColor.blue
        
//        // UILabel练习
//        let myLabel = UILabel(frame: CGRect(x: 0, y: 50, width: 300, height: 80))
//        myLabel.text = "swift 起步走"
//        myLabel.textColor = UIColor.red
//        myLabel.textAlignment = .right
//        myLabel.backgroundColor = UIColor.orange
//        self.view.addSubview(myLabel)
        
        // UITextField
        let myTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        myTextField.placeholder = "请输入文字"
        myTextField.borderStyle = .roundedRect
        myTextField.clearButtonMode = .whileEditing
        myTextField.returnKeyType = .done
        myTextField.textColor = UIColor.blue
        myTextField.backgroundColor = UIColor.lightGray
        myTextField.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        myTextField.delegate = self
        self.view.addSubview(myTextField)
        myTextField.isHidden = true
        
        // UITextView
        myTextView = UITextView(frame: CGRect(x: 0, y: 0, width: 250, height: 60))
        myTextView.backgroundColor = UIColor.darkGray
        myTextView.textColor = UIColor.white
        myTextView.textAlignment = .left
        myTextView.text = "this is a test"
        myTextView.isEditable = true
        myTextView.isSelectable = true
        myTextView.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.6)
        self.view.addSubview(myTextView)
        // 建立兩個新的選項
        let mail = UIMenuItem(
          title: "寄送",
          action: #selector(ViewController.sendMail))
        let facebook = UIMenuItem(
          title: "FB",
          action: #selector(ViewController.sendFB))

        // 建立選單
        let menu = UIMenuController.shared

        // 將新的選項加入選單
        menu.menuItems = [mail,facebook]
        
        // 增加一個觸控事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.hideKeyboard(tapG:)))

        tap.cancelsTouchesInView = false
        
        // 加在最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
        myTextView.isHidden = true
        
        
        // 建立前往 Intro 頁面的 UIButton
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("Intro", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(self, action: #selector(goIntro), for: .touchDown)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myButton)
        myButton.isHidden = true
        
        // 提示框
        let popbtn = UIButton(type: .system)
        popbtn.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        popbtn.setTitle("simple warn", for: .normal)
        popbtn.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        popbtn.addTarget(nil, action: #selector(self.bottomAlert), for: .touchUpInside)
        popbtn.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(popbtn)
        popbtn.isHidden = true
        
        let myButton2 = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton2.setTitle("photo", for: .normal)
        myButton2.backgroundColor = UIColor.lightGray
        myButton2.addTarget(self, action: #selector(photoFn), for: .touchDown)
        myButton2.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myButton2)
    }

    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }
    
    @objc func photoFn() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("99999")
            imagePicker.sourceType = .camera
        } else {
            print("22222")
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
    }
    
    @objc func goIntro() {
        
        let introViewController = IntroViewController()
        print("viewWillDisappear")
        self.present(introViewController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @objc func hideKeyboard(tapG:UITapGestureRecognizer){
        // 除了使用 self.view.endEditing(true)
        // 也可以用 resignFirstResponder()
        // 來針對一個元件隱藏鍵盤
        self.myTextView.resignFirstResponder()
    }
    
    @objc func sendMail() {
        print("sendMail")
    }

    @objc func sendFB() {
        print("sendFB")
    }
    
    @objc func simpleHint() {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "提示",
            message: "一個簡單提示，請按確認繼續",
            preferredStyle: .alert)

        // 建立[確認]按鈕
        let okAction = UIAlertAction(
            title: "確認",
            style: .default,
            handler: {
            (action: UIAlertAction!) -> Void in
              print("按下確認後，閉包裡的動作")
        })
        alertController.addAction(okAction)
        
        self.present(
            alertController,
            animated: true,
            completion: nil
        )
    }
    
    @objc func bottomAlert() {
        // 建立一個提示框
        let alertController = UIAlertController(title: "底部提示", message: "這個提示會從底部彈出", preferredStyle: .actionSheet)
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    }
}

