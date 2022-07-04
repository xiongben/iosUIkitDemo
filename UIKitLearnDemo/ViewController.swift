//
//  ViewController.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/6/27.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 加入父控件
        view.addSubview(label)
        // 背景颜色
        label.backgroundColor = UIColor.cyan;
        // 设置内容
        label.text = "hello world!!!"
        // 设置文字颜色
        label.textColor = UIColor.red
        // 设置字体样式和大小
        label.font = UIFont(name:"Zapfino", size:15)
        // 设置字体大小
        //label.font = UIFont.systemFont(ofSize:20)
        // 设置字体居中
        label.textAlignment = .center
        // 文本多行显示
        label.numberOfLines = 0
        // 设置阴影
        label.shadowColor = UIColor.gray
        label.shadowOffset = CGSize(width:1.5, height:1.5)
        // 文字过长时的省略方式
        label.lineBreakMode = .byTruncatingTail // 隐藏尾部并显示省略号
        label.lineBreakMode = .byTruncatingMiddle // 隐藏中间部分并显示省略号
        label.lineBreakMode = .byTruncatingHead // 隐藏头部并显示省略号
        label.lineBreakMode = .byClipping // 截去多余部分也不显示省略号
        // 设置tag
        label.tag = 1003
        // 获取方法
//        let getTagView = view.viewWithTag(1003) as! UILabel
    }

    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            // 设置位置尺寸
            label.frame = CGRect(x:20, y:100, width:200, height:40)
        }
}

