//
//  ViewController.swift
//  TumMenuDemo
//
//  Created by admin on 2022/8/7.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let table = UITableView()
    var dataSource = Array<String>()
    let EntityName = "TodoList"
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Your Model File Name")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {

                fatalError("Unresolved error, \((error as NSError).userInfo)")
            }
        })
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 存储示例部分
        let myEntityName = "Student"
        let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let coreDataConnect = CoreDataConnect(context: myContext)
        
        let myUserDefaults = UserDefaults.standard
        var seq = 1
        if let idSeq = myUserDefaults.object(forKey: "idSeq") as? Int {
            seq = idSeq + 1
        }
        
        // insert
        let insertResult = coreDataConnect.insert(myEntityName, attributeInfo: [
            "id" : "\(seq)",
            "name" : "小強\(seq)",
            "height" : "\(176.5 + Double(seq))"
        ])
        if insertResult {
            print("新增資料成功")
                        
            myUserDefaults.set(seq, forKey: "idSeq")
            myUserDefaults.synchronize()
        }
        
        // select
        let selectResult = coreDataConnect.retrieve(myEntityName, predicate: nil, sort: [["id":true]], limit: nil)
        if let results = selectResult {
            for result in results {
                print("\(result.value(forKey: "id")!). \(result.value(forKey: "name")!)")
                print("身高： \(result.value(forKey: "height")!)")
            }
        }
        
        // update
        let updateId = seq - 1
        var predicate = "id = \(updateId)"
        let updateResult = coreDataConnect.update(
            myEntityName,
            predicate: predicate,
            attributeInfo: ["height":"\(seq * 10)"])
        if updateResult {
            print("更新資料成功")
        }
        
        // delete
        let deleteID = seq - 2
        predicate = "id = \(deleteID)"
        let deleteResult = coreDataConnect.delete(
            myEntityName, predicate: predicate)
        if deleteResult {
            print("刪除資料成功")
        }
        
        
        
//        self.navigationItem.title = "Todo List"
//        let rightBarItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addTodoList))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        table.frame = self.view.frame
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
    }
    
    @objc func addTodoList() {
//        let alertController = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
//        let confirmAction = UIAlertAction(title: "Confirm", style: .default, handler: ({
//            _ in
//            if let field = alertController.textFields![0] as? UITextField {
//                self.saveContent(content: field.text!)
//            }
//        }))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "coreDataReuseId")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func getContext() -> NSManagedObjectContext {
        let context = persistentContainer.viewContext
        return context
    }
    


}

