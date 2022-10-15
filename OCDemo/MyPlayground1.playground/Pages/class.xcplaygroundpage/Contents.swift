
import Foundation
import Darwin
//计算类占用内存情况

class Point { // 16字节的类的刚需
    var x = 11 // 8
    var test = true // 8对齐字节空间
    var y = 22 // 8
}  // 33 ,40 , 48(堆空间分配16的倍数)

var p = Point()
class_getInstanceSize(Point.self)

// 方法不占用对象内存，方法的本质是函数
// 方法函数都放在代码段


//下标
class Point2 {
    var x = 0.0, y = 0.0
    subscript(index: Int) -> Double{
        set{
            if index == 0 {
                x = newValue
            } else if index == 1 {
                y = newValue
            }
        }
        get{
            if index == 0 {
                return x
            } else if index == 1 {
                return y
            }
            return 0
        }
    }
}

var p2 = Point2()
p2[0] = 11.1
p2[1] = 22.2
p2.x
p2.y

//两段初始化

class Person {
    var age:Int
    init(age:Int){
        self.age = age
    }
}

class Student : Person {
    var score: Int
    
    override init(age: Int) {
        self.score = 10
        super.init(age: age)
    }
}

class Student2 : Person {
    var score: Int
    
    init(age: Int, score: Int){
        self.score = score
        super.init(age: age)
        self.score = 200
    }
    
    convenience init() {
        self.init(age: 22, score: 100)
        self.age = 10
    }
}

var stu1 = Student2()
stu1.score
