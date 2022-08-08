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
        self.navigationItem.title = "Todo List"
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

