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
        
        let myPickerView = UIPickerView(frame: CGRect(x: 0, y: 100, width: fullSize.width, height: 150))
        
        let myViewController = MyViewController()
        
        self.addChild(myViewController)
        
        myPickerView.delegate = myViewController
        myPickerView.dataSource = myViewController
        
        self.view.addSubview(myPickerView)
        
        // 开关
        var mySwitch = UISwitch()
        mySwitch.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.6)
        self.view.addSubview(mySwitch)
        
        // 建立另一個 UISwitch
        mySwitch = UISwitch()
        
        // 設置滑桿鈕的顏色
        mySwitch.thumbTintColor = UIColor.orange
        
        // 設置未選取時( off )的外觀顏色
        mySwitch.tintColor = UIColor.blue
        
        // 設置選取時( on )的外觀顏色
        mySwitch.onTintColor = UIColor.brown
        
        mySwitch.addTarget(self, action: #selector(self.onChange), for: .valueChanged)
        mySwitch.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        self.view.addSubview(mySwitch)
        
        let mySegmentedControl = UISegmentedControl(items: ["早餐", "中餐", "晚餐"])
        mySegmentedControl.tintColor = UIColor.black
        mySegmentedControl.backgroundColor = UIColor.lightGray
        mySegmentedControl.selectedSegmentIndex = 0
        mySegmentedControl.addTarget(self, action: #selector(self.onChange2), for: .valueChanged)
        mySegmentedControl.frame.size = CGSize(width: fullSize.width*0.5, height: 30)
        mySegmentedControl.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.75)
        self.view.addSubview(mySegmentedControl)
    }
    
    @objc func onChange(_ sender: AnyObject) {
        let tempSwitch = sender as! UISwitch
        if tempSwitch.isOn {
            self.view.backgroundColor = UIColor.black
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    @objc func onChange2(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        print(sender.titleForSegment(at: sender.selectedSegmentIndex)!)
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
