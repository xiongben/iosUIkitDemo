//
//  ScrollViewCV.swift
//  UIKitLearnDemo
//
//  Created by admin on 2022/7/9.
//

import UIKit

class ScrollViewCV : UIViewController, UIScrollViewDelegate  {
    
    let fullSize = UIScreen.main.bounds.size
    var myScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        myScrollView = UIScrollView()
        myScrollView.frame = CGRect(x: 0, y: 20, width: fullSize.width, height: fullSize.height - 20)
        myScrollView.contentSize = CGSize(width: fullSize.width * 3, height: fullSize.height * 2)
        myScrollView.showsHorizontalScrollIndicator = true
        myScrollView.showsVerticalScrollIndicator = true
        myScrollView.indicatorStyle = .black
        myScrollView.isScrollEnabled = true
        myScrollView.scrollsToTop = false
        myScrollView.isDirectionalLockEnabled = false
        myScrollView.bounces = true
        myScrollView.zoomScale = 1.0
        myScrollView.minimumZoomScale = 0.5
        myScrollView.maximumZoomScale = 2.0
        myScrollView.bouncesZoom = true
        myScrollView.delegate = self
        // 起始的可見視圖偏移量 預設為 (0, 0)
        // 設定這個值後 就會將原點滑動至這個點起始
        myScrollView.contentOffset = CGPoint(x: fullSize.width * 0.5, y: fullSize.height * 0.5)
        // 以一頁為單位滑動
        myScrollView.isPagingEnabled = false
        // 加入到畫面中
        self.view.addSubview(myScrollView)
        
        // 建立6个 UIView
        var myUIView = UIView()
        for i in 0...2 {
            for j in 0...1 {
                myUIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                myUIView.tag = i * 10 + j  + 1
                myUIView.center = CGPoint(x: fullSize.width * (0.5 + CGFloat(i)), y: fullSize.height * (0.5 + CGFloat(j)))
                let color = ((CGFloat(i) + 1) * (CGFloat(j) + 1)) / 12.0
                myUIView.backgroundColor = UIColor(red: color, green: color, blue: color, alpha: 1)
                myScrollView.addSubview(myUIView)
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
    }
    
    // 滑動時
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("开始滑动")
    }
    
    // 結束滑動時
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("滑动结束")
    }
    
    // 縮放的元件
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // 這邊用來示範縮放的元件是 tag 為 1 的 UIView
        // 也就是左上角那個 UIView
        return self.view.viewWithTag(1)
    }

    // 開始縮放時
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print("开始缩放")
    }
    
    // 縮放時
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("正在缩放")
    }
    
    // 結束縮放時
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("缩放结束")
        
        // 縮放元件時 會將 contentSize 設為這個元件的尺寸
        // 會導致 contentSize 過小而無法滑動
        // 所以縮放完後再將 contentSize 設回原本大小
        myScrollView.contentSize = CGSize(width: fullSize.width * 3, height: fullSize.height * 2)
    }
}
