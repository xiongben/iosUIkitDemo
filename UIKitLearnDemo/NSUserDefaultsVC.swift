//
//  NSUserDefaultsVC.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/8.
//

import UIKit
import SQLite

class NSUserDefaultsVC : UIViewController  {
    
    let fullSize = UIScreen.main.bounds.size
    var imageView: UIImageView!
    var mySlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        imageView = UIImageView(image: UIImage(named: "01.png"))
        imageView.contentMode = .scaleToFill
        imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        imageView.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.3)
        self.view.addSubview(imageView)
        
        mySlider = UISlider(frame: CGRect(x: 0, y: 0, width: fullSize.width*0.9, height: 50))
        mySlider.backgroundColor = UIColor.lightGray
        mySlider.maximumTrackTintColor = UIColor.orange
        mySlider.minimumTrackTintColor = UIColor.purple
        mySlider.thumbTintColor = UIColor.brown
        mySlider.minimumValue = 0
        mySlider.maximumValue = 100
        mySlider.value = 100
        mySlider.isContinuous = true
        mySlider.addTarget(self, action: #selector(self.onSliderChange), for: .valueChanged)
        mySlider.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.65)
        self.view.addSubview(mySlider)
        
        // 建立前往 Intro 頁面的 UIButton
        let myButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        myButton.setTitle("sql", for: .normal)
        myButton.backgroundColor = UIColor.lightGray
        myButton.addTarget(self, action: #selector(sqlfn), for: .touchDown)
        myButton.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.4)
        self.view.addSubview(myButton)
        
        
//        // 取得儲存的預設資料
//        let myUserDefaults = UserDefaults.standard
//
//        // 顯示儲存資訊的 UILabel
//        let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: 40))
//        myLabel.textColor = UIColor.brown
//        myLabel.textAlignment = .center
//        myLabel.center = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.25)
//
//        if let info = myUserDefaults.object(forKey: "info") as? String {
//            myLabel.text = info
//        } else {
//            myLabel.text = "尚未儲存資訊"
//            myLabel.textColor = UIColor.red
//        }
//
//        self.view.addSubview(myLabel)
        
    }
    
    @objc func onSliderChange() {
        // 設置圖片的透明度
        imageView.alpha = CGFloat(mySlider.value / mySlider.maximumValue)
    }
    
    @objc func sqlfn() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let db = try? Connection("\(path)/db.sqlite3")
            
            
            let users = Table("users")
                    let id = Expression<Int64>("id")
                    let name = Expression<String?>("name")
                    let email = Expression<String>("email")

                    try! db?.run(users.create(ifNotExists: true, block: { (table) in
                        table.column(id, primaryKey: true)
                        table.column(name)
                        table.column(email, unique: true)
                    }))
            
            let insert = users.insert(name <- "究极死胖兽", email <- "scuxiatian@foxmail.com")
            let rowid = (try! db?.run(insert))!
            let insert2 = users.insert(name <- "Amazing7", email <- "360898864@qq.com")
            let rowid2 = (try! db?.run(insert2))!
            
            
            for user in (try! db?.prepare(users))! {
                        print("Query:id: \(user[id]), name: \(user[name]), email: \(user[email])")
                    }
//            let db = try Connection("path/to/db.sqlite3")

//            let users = Table("users")
//            let id = Expression<Int64>("id")
//            let name = Expression<String?>("name")
//            let email = Expression<String>("email")
//
//            try db.run(users.create { t in
//                t.column(id, primaryKey: true)
//                t.column(name)
//                t.column(email, unique: true)
//            })
//            // CREATE TABLE "users" (
//            //     "id" INTEGER PRIMARY KEY NOT NULL,
//            //     "name" TEXT,
//            //     "email" TEXT NOT NULL UNIQUE
//            // )
//
//            let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
//            let rowid = try db.run(insert)
//            // INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')
//
//            for user in try db.prepare(users) {
//                print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
//                // id: 1, name: Optional("Alice"), email: alice@mac.com
//            }
//            // SELECT * FROM "users"
//
//            let alice = users.filter(id == rowid)
//
//            try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
//            // UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
//            // WHERE ("id" = 1)
//
//            try db.run(alice.delete())
//            // DELETE FROM "users" WHERE ("id" = 1)
//
//            try db.scalar(users.count) // 0
            // SELECT count(*) FROM "users"
        } catch {
            print("ttttt")
            print (error)
        }
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }

}

