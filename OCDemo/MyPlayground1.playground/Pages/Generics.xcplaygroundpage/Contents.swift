
import Foundation

//协议里面使用关联类型
protocol Stackable {
    associatedtype E
    mutating func pop() -> E
    func top() -> E
}

class StringStack: Stackable {
    typealias E = String
    var elements = [String]()
    
    func pop() -> String { elements.removeLast() }
    func top() -> String { elements.last! }
}

var ss = StringStack()

//不透明类型，只能返回一种类型


//可选项的本质
var age: Int? = 10
var age0: Optional<Int> = Optional<Int>.some(10)
var age1 = Optional(10)
var age2 = Optional<Int>.none
