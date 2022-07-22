//
//  TableViewController.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/6.
//

import UIKit

class TableViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let fullSize = UIScreen.main.bounds.size
    var info = [
        ["林書豪","陳信安","jack", "rose"],
        ["陳偉殷","王建民","陳金鋒","林智勝"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let myTableView = UITableView(frame: CGRect(x: 0, y: 20, width: fullSize.width, height: fullSize.height - 20), style: .grouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.separatorStyle = .singleLine
        // 分隔線的間距 四個數值分別代表 上、左、下、右 的間距
       myTableView.separatorInset = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
       
       // 是否可以點選 cell
       myTableView.allowsSelection = true
       
       // 是否可以多選 cell
       myTableView.allowsMultipleSelection = false
       
       // 加入到畫面中
       self.view.addSubview(myTableView)
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }
    
    // 必須實作的方法：每一組有幾個 cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }

    // 必須實作的方法：每個 cell 要顯示的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        // 設置 Accessory 按鈕樣式
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.accessoryType = .checkmark
            } else if indexPath.row == 1 {
                cell.accessoryType = .detailButton
            } else if indexPath.row == 2 {
                cell.accessoryType = .detailDisclosureButton
            } else if indexPath.row == 3 {
                cell.accessoryType = .disclosureIndicator
            }
        }

        // 顯示的內容
        if let myLabel = cell.textLabel {
            myLabel.text = "\(info[indexPath.section][indexPath.row])"
        }

        return cell
    }

    // click item
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let name = info[indexPath.section][indexPath.row]
        print("选择的是\(name)")
    }

    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let name = info[indexPath.section][indexPath.row]
        print("按下的是 \(name) 的 detail")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }

    // 每個 section 的標題
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "籃球" : "棒球"
        return title
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let title = section == 0 ? "第一个section的footer" : "第二个section的footer"
        return title
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let name = info[indexPath.section][indexPath.row]
        print("按下的是 \(name) 的 detail")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}

