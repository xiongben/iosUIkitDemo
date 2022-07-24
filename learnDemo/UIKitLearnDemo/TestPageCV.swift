//
//  TestPageCV.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/14.
//

import UIKit

class TestPageCV : UIViewController  {
    
    let fullSize = UIScreen.main.bounds.size
   
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var titleDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        titleDesc.text = "start"
        
    }
    
    @IBAction func changeDesc(_ sender: UIButton) {
        titleDesc.text! += "start"
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }

}
