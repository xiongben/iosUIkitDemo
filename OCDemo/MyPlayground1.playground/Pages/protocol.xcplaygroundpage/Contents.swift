
import Foundation

protocol Drawable {
    mutating func draw()
}


struct Point : Drawable {
    var x : Int = 0
    mutating func draw() {
        x = 10
    }
}

// 情况一
protocol Liveable {
    init(age: Int)
}

class Person {
    var age: Int
    init(age: Int){
        self.age = age
    }
}

class Student: Person, Liveable {
    required override init(age: Int){
        super.init(age: age)
    }
}

var stu1 = Student(age: 10)
stu1.age


class Test1: CustomStringConvertible {
    var age: Int = 10
    var name: String = "xiaoming"
    
    var description: String {
        "age=\(age),name=\(name)"
    }
}

var t1 = Test1()
print(type(of: t1))
print(t1)


// is, as?, as!, as的使用
var t2: Any = 19
(t2 as? Test1)?.name
//(t2 as! Test1).name
