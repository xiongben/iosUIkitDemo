//
//  ViewController.swift
//  PullToRefresh
//
//  Created by admin on 2022/7/30.
//

import UIKit

// 注意继承和协议，table使用所必须得
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource = Array<Date>()
    let refresh = UIRefreshControl()
    var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table = UITableView(frame: self.view.bounds)
        table.frame.origin.y = 44
        self.view.addSubview(table)
        table.delegate = self // table使用必需
        table.dataSource = self // table list数据源
        addNewElementToArray()
        refresh.attributedTitle = NSAttributedString(string: "正在下拉刷新。。。") // 刷新时头部显示的文案
        
        refresh.addTarget(self, action: #selector(pullTheRefresh), for: .valueChanged)
        
        self.table.refreshControl = refresh
    }
    
    @objc func pullTheRefresh() {   // 下拉刷新后执行的动作
        addNewElementToArray()
        refresh.endRefreshing()
        table.reloadData()
    }
    
    func addNewElementToArray() {
        dataSource.insert(NSDate() as Date, at: 0)
    }

    func numberOfSections(in tableView: UITableView) -> Int {  // table子元素里面section的个数， Table中包含一个section，这一个section中包含dataSource.count个row
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {  // table子元素里面每个section包含row的个数
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  // row中cell的显示样式
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCellForPullToRefresh")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = dateFormatter.string(from: dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        return cell
    }
}

