import UIKit
import PlaygroundSupport

var greeting = "Hello, playground"

//let view = UIView()
//view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//view.backgroundColor = UIColor.blue
//PlaygroundPage.current.liveView = view

//结构体
struct Point {
    var x: Int = 0
    var y: Int = 0
    var origin: Bool = false
}

MemoryLayout<Point>.size
MemoryLayout<Point>.stride

var ptr = malloc(16)
malloc_size(ptr)
