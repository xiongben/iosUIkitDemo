//
//  MenuViewController.swift
//  VerticalMenuDemo
//
//  Created by admin on 2022/8/13.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dataSource: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        let table = UITableView(frame: self.view.frame)
        table.delegate = self
        table.dataSource = self
        dataSource = ["Menu one", "Menu two", "Menu three", "Menu four"]
        self.view.addSubview(table)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "verticalMenuReuseTableViewCell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
