
import Foundation


//属性观察器
struct Circle {
    var radius: Double {
        willSet {
            print("willSet", newValue)
        }
        didSet {
            print("didSet", radius)
        }
    }
    
    init() {
        self.radius = 1.0
        print("circle init")
    }
}

var circle1 = Circle()
circle1.radius = 10.8

