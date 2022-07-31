//
//  ViewController.swift
//  SwipeableCell
//
//  Created by admin on 2022/7/31.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate {
    
    private let cellHeight: CGFloat = 66
    private let colorRatio: CGFloat = 10
    private var actionController: UIAlertController!
    var table: UITableView!
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    private var dataSource:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table = UITableView(frame: self.view.frame)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        self.dataSource = lyric.split(separator: ",").map(String.init)
        actionController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        let cells = table.visibleCells
        let tableHeight: CGFloat = table.bounds.size.height
        
        for(index, cell) in cells.enumerated() {
            cell.frame.origin.y = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            //                cell.transform = CGAffineTransform(translationX: 0, y: 0);
                            cell.frame.origin.y = 0
            }, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "animationInTableViewCell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.cellHeight))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView.frame
        let lowerColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, alpha: 1).cgColor
        let upperColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, alpha: 1).cgColor

        gradientLayer.colors = [lowerColor,upperColor]
        bgView.layer.addSublayer(gradientLayer)
        cell.addSubview(bgView)
        cell.sendSubviewToBack(bgView)
        cell.frame.origin.y = self.cellHeight
        
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let likeAction = UIContextualAction(style: .normal, title: "👍") {(action, sourceView, completionHandler) in
            self.actionController.message = "Thanks for your Love😸"
            self.showAlertController()
            print("delete")
        }
        likeAction.backgroundColor = UIColor.white
        
        let dislikeAction = UIContextualAction(style: .normal, title: "👎") {(action, sourceView, completionHandler) in
            self.actionController.message = "Tell me why!!!😤"
            self.showAlertController()
            print("delete")
        }
        dislikeAction.backgroundColor = UIColor.white
        
        let unknowAction = UIContextualAction(style: .normal, title: "🖖") {(action, sourceView, completionHandler) in
            self.actionController.message = "What do you mean? 🤔"
            self.showAlertController()
            print("delete")
        }
        unknowAction.backgroundColor = UIColor.white
        
        
        let config = UISwipeActionsConfiguration(actions: [likeAction, dislikeAction, unknowAction])
                
        // 取消拉动长后自动删除
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    func showAlertController() {
        self.present(self.actionController, animated: true, completion: {
            let dismissTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (timer) in
                self.actionController.dismiss(animated: true, completion: nil)
            })
            RunLoop.main.add(dismissTimer, forMode: .common)
        })
    }
}

