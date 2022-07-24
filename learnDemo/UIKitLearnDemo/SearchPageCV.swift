//
//  SearchPageCV.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/9.
//

import UIKit
import WebKit

class SearchPageCV : UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating  {
    
    let fullScreenSize = UIScreen.main.bounds.size
    
    var tableView: UITableView!
    var searchController: UISearchController!
    
    let cities = [
        "北京市","南京市","桃園市","臺中市","臺南市",
        "高雄市","基隆市","新竹市","嘉義市","新竹縣",
        "苗栗縣","武汉市","西安市","雲林縣","嘉義縣",
        "屏東縣","宜蘭縣","花蓮縣","臺東縣","澎湖縣",
    ]
    
    var searchArr: [String] = [String](){
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        tableView = UITableView(frame: CGRect(x: 0, y: 20, width: fullScreenSize.width, height: fullScreenSize.height - 20), style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchBarStyle = .prominent
        
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchController.isActive) {
            return searchArr.count
        } else {
            return cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if(searchController.isActive) {
            cell.textLabel?.text = searchArr[indexPath.row]
            return cell
        } else {
            cell.textLabel?.text = cities[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(searchController.isActive) {
            print("你选择的是\(searchArr[indexPath.row])")
        } else {
            print("你选择的是\(cities[indexPath.row])")
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        // 获取搜索文字
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        searchArr = cities.filter { (city) -> Bool in return
             city.contains(searchText)
        }
    }
}

