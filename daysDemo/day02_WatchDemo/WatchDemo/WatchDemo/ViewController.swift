//
//  ViewController.swift
//  WatchDemo
//
//  Created by admin on 2022/7/27.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var result: UILabel!
    var timer: Timer!
    var labelNumber: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let startView = UIView()
        result = UILabel()
        self.view.addSubview(result)
        result.textColor = UIColor.black
        result.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalTo(self.view.snp.centerX).offset(25)
            make.top.equalTo(200)
        }
        result.font = UIFont.systemFont(ofSize: 30)
        result.text = "0"
        
        startView.backgroundColor = UIColor.init(red: 1, green: 101/255.0, blue: 27/255.0, alpha: 1)
        self.view.addSubview(startView)
        startView.snp.makeConstraints{(make) in
            make.top.equalTo(self.view).offset(500)
            make.left.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
            make.width.equalTo(self.view.frame.width / 2)
        }
        
        let startButton:UIButton = UIButton()
        startButton.setTitle("Start", for: .normal)
        startView.addSubview(startButton)
        startButton.snp.makeConstraints{(make) in
            make.center.equalTo(startView)
            make.width.height.equalTo(50)
        }
        startButton.addTarget(self, action: #selector(startHandler), for: .touchUpInside)
        
        let endView = UIView()
        endView.backgroundColor = UIColor.init(red: 98/255.0, green: 242/255.0, blue: 23/255.0, alpha: 1)
        self.view.addSubview(endView)
        endView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view).offset(500)
            make.right.equalTo(self.view).offset(0)
            make.width.equalTo(self.view.frame.width / 2)
            make.bottom.equalTo(self.view).offset(0)
        }
        
        let endButton:UIButton = UIButton()
        endButton.setTitle("End", for: .normal)
        //        endButton.backgroundColor = UIColor.red
        endView.addSubview(endButton)
        endButton.snp.makeConstraints { (make) in
            make.center.equalTo(endView).offset(0)
            make.width.height.equalTo(50)
        }
        endButton.addTarget(self, action: #selector(stopHandler), for: .touchUpInside)
        
        let resetButton = UIButton()
        self.view.addSubview(resetButton)
        resetButton.snp.makeConstraints { (make) in
            make.top.equalTo(50)
            make.right.equalTo(-30)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        resetButton.backgroundColor = .black
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(resetHandler), for: .touchUpInside)
    }
    
    
    @objc func startHandler() {
        if self.timer != nil {
            self.stopHandler()
        }
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {(timer) in
            self.labelNumber = self.labelNumber + 0.1
            self.result.text = String(format: "%.1f", self.labelNumber)
        }
        self.timer.fire()
    }
    
    @objc func stopHandler() {
        guard let timeForDistory = self.timer
        else {return}
        timeForDistory.invalidate()
    }
    
    @objc func resetHandler(){
        self.labelNumber = 0
        self.result.text = "0"
    }

}

