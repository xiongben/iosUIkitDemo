
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

