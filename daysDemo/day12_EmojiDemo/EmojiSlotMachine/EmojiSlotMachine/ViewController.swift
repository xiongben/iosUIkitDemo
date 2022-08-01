//
//  ViewController.swift
//  EmojiSlotMachine
//
//  Created by admin on 2022/8/1.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var slotMachine : UIPickerView!
    var emojiArray = ["😀","😎","😈","👻","🙈","🐶","🌚","🍎","🎾","🐥","🐔"]
    var resultLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func createSlotMachine() {
        slotMachine = UIPickerView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 220))
        self.view.addSubview(slotMachine)
        slotMachine.dataSource = self
    }
}

