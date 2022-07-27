//
//  ViewController.swift
//  day01
//
//  Created by admin on 2022/7/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let label = UILabel()
    var familyNameArr = [String]()
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "hello world"
        label.textAlignment = .center
        self.view.addSubview(label)
        label.snp.makeConstraints{ (make) in
            make.top.equalTo(200)
            make.centerX.equalTo(self.view)
        }
        label.font = UIFont.systemFont(ofSize: 30)
        
        let changeBtn = UIButton(type: .custom)
        changeBtn.setTitle("change font family", for: UIControl.State.normal)
        changeBtn.addTarget(self, action: #selector(changeFontFamily), for: UIControl.Event.touchUpInside)
        changeBtn.setTitleColor(.blue, for: UIControl.State.normal)
        self.view.addSubview(changeBtn)
        changeBtn.layer.borderColor = UIColor.blue.cgColor
        changeBtn.layer.borderWidth = 1
        changeBtn.layer.cornerRadius = 5
        changeBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
            make.width.equalTo(200)
        }
        printAllSupportedFontNames()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func changeFontFamily() {
        if(index + 1 < familyNameArr.count) {
            index += 1
            label.font = UIFont(name: familyNameArr[index], size: 30)
        }
    }
    
    func printAllSupportedFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("++++\(familyName)")
            familyNameArr.append(familyName)
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("-------\(fontName)")
            }
        }
    }


}

