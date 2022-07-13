//
//  MyPickerVC.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/13.
//

import UIKit

class MyPickerVC : UIViewController  {
    
    let fullSize = UIScreen.main.bounds.size
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let myPickerView = UIPickerView(frame: CGRect(x: 0, y: 70, width: fullSize.width, height: 150))
        
        let myViewController = MyViewController()
        
        self.addChild(myViewController)
        
        myPickerView.delegate = myViewController
        myPickerView.dataSource = myViewController
        
        self.view.addSubview(myPickerView)
    }
    
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }

}

class MyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let week = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
    let meals = ["早餐","午餐","晚餐","宵夜"]
    var whatDay = "星期日"
    var whatMeal = "早餐"
    
    // 必须实现的方法，有几列可以选择
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    // 必须实现的方法，各列有多少行
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return week.count
        }
        
        return meals.count
    }
    
    // 每个选项展示的data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return week[row]
        }
        return meals[row]
    }
    
    // 改变选择后的动作
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            whatDay = week[row]
        } else {
            whatMeal = meals[row]
        }
        print("選擇的是 \(whatDay) ， \(whatMeal)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
