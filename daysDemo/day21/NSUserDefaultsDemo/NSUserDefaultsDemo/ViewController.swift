//
//  ViewController.swift
//  NSUserDefaultsDemo
//
//  Created by admin on 2022/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    var fullSize = UIScreen.main.bounds.size
    var myUIView: UIView!
    var anotherUIView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /**
                    =======Tap轻点手势========
         */
        
        // 双指轻点(需用真机测试)
        let doubleFingers = UITapGestureRecognizer(target: self, action: #selector(self.doubleTap(_:)))
        // 点几下才触发，设置1时，就是点一下触发
        doubleFingers.numberOfTapsRequired = 1
        // 几个手指触发
        doubleFingers.numberOfTouchesRequired = 2
        // 为视图加入监听手势
        self.view.addGestureRecognizer(doubleFingers)
        // 单指轻点
        let singleFingers = UITapGestureRecognizer(target: self, action: #selector(self.singleTap(_:)))
        // 点几下才触发，设置1时，就是点一下触发
        singleFingers.numberOfTapsRequired = 2
        // 几个手指触发
        singleFingers.numberOfTouchesRequired = 1
        // 双指轻点没有触发时，才会检测次手势，以免手势被盖过
        singleFingers.require(toFail: doubleFingers)
        // 为视图加入监听手势
        self.view.addGestureRecognizer(singleFingers)
        
        /**
                    =======Tap长按手势========
         */
    
        // 长按
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(_:)))
        // 为视图加入监听手势
        self.view.addGestureRecognizer(longPress)
        
        
        /**
                    =======Swipe滑动手势========
         */
        // 可以移动的UIView
        myUIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myUIView.backgroundColor = .blue
        self.view.addSubview(myUIView)
        
        // 向上滑动
        let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(ViewController.swipe(_:)))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    
        // 向下滑动
        let swipeDown = UISwipeGestureRecognizer(target:self, action:#selector(ViewController.swipe(_:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        // 向右滑动
        let swipeRight = UISwipeGestureRecognizer(target:self, action:#selector(ViewController.swipe(_:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        
        /**
                    =======Pan 拖拽手势========
         */
        // 可以移动的UIView
        anotherUIView = UIView(frame: CGRect(x: fullSize.width * 0.5, y: fullSize.height * 0.5, width: 100, height: 100))
        anotherUIView.backgroundColor = .orange
        self.view.addSubview(anotherUIView)
        // 拖拽手势
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.pan(_:)))
        // 最少用几指拖拽
        pan.minimumNumberOfTouches = 1
        // 最多用几指拖拽
        pan.maximumNumberOfTouches = 1
        
        anotherUIView.addGestureRecognizer(pan)
    }
    
    
    // 触发滑动手势后执行的动作
    @objc func swipe(_ recognizer:UISwipeGestureRecognizer) {
        let point = myUIView.center
        
        if recognizer.direction == .up {
            print("Go up")
            if point.y >= 150 {
                myUIView.center = CGPoint(x: myUIView.center.x, y: myUIView.center.y - 100)
            } else {
                myUIView.center = CGPoint(x: myUIView.center.x, y: 50)
            }
        }else if recognizer.direction == .left {
            print("Go Left")
            if point.x >= 150 {
                myUIView.center = CGPoint(x: myUIView.center.x - 100, y: myUIView.center.y)
            } else {
                myUIView.center = CGPoint(x: 50, y: myUIView.center.y)
            }
        } else if recognizer.direction == .down {
            print("Go Down")
            if point.y <= fullSize.height - 150 {
                myUIView.center = CGPoint(x: myUIView.center.x, y: myUIView.center.y + 100)
            } else {
                myUIView.center = CGPoint(x: myUIView.center.x, y: fullSize.height - 50)
            }
        } else if recognizer.direction == .right {
            print("Go Right")
            if point.x <= fullSize.width - 150 {
                myUIView.center = CGPoint(x: myUIView.center.x + 100, y: myUIView.center.y)
            } else {
                myUIView.center = CGPoint(x: fullSize.width - 50, y: myUIView.center.y)
            }
        }
    }
    
    // 触发双指后执行的动作
    @objc func doubleTap(_ recognizer:UITapGestureRecognizer){
        print("双指点一下触发")

        // 取得每指的位置
        self.findFingersPositon(recognizer)
    }
    
    // 触发长按后执行的动作
    @objc func longPress(_ recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            print("长按开始")
        } else if recognizer.state == .ended {
            print("长按结束")
        }
        
    }

    // 触发单指轻点2下后执行的动作
    @objc func singleTap(_ recognizer:UITapGestureRecognizer){
        print("单指轻点2下")
        
        // 取得每指的位置
        self.findFingersPositon(recognizer)
    }
    
    // 触发拖拽后执行的动作
    @objc func pan(_ recognizer:UIPanGestureRecognizer) {
        // 设置UIView的新位置
        let point = recognizer.location(in: self.view)
        anotherUIView.center = point
    }
    
    func findFingersPositon(_ recognizer: UITapGestureRecognizer) {
        let number = recognizer.numberOfTouches
        for i in 0..<number {
            let point = recognizer.location(ofTouch: i, in: recognizer.view)
            print("第\(i+1)指的位置是：\(NSCoder.string(for: point))")
        }
    }

}

