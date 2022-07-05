# iosUIkitDemo
uikit practice demo

# IOS学习笔记

## swift部分
### 1，下标
```swift
enum Planet: Int {
    case mercury = 1, aa, bb, cc, dd, ee, ff, gg
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let res1 = Planet[4]
```
### 2，扩展
```swift
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello")
}

// 异变示例方法
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()

// 下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

73252352525[0]
578383743298[1]

// 内嵌类型
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
            case .negative:
                print("- ", terminator: "")
            case .zero:
                print("0 ", terminator: "")
            case .positive:
                print("+ ", terminator: "")
            }
        }
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
```
### 3, 协议
```swift
protocol SomeProtocal {
    var mustBeSettable: Int {get set}
    var doesNotNeedToBeSettable: Int {get}
}

protocol AnotherProtocal {
    static var someTypeProperty: Int {get set}
}

protocol FullyNamed {
    var fullName: String {get}
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")

// 协议初始化器要求类的实现
protocol SomeProtocal2 {
    init(SomeParameter: Int)
}

class SomeClass: SomeProtocal2 {
    required init(SomeParameter: Int) {
        print(String(SomeParameter))
    }
}

// 有条件的遵循协议

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        
    }
}
// 类专用的协议
protocol SomeClassOnlyProtocol: AnyObject, SomeInheritedProtocol {
    // class-only protocol definition goes here
}
```
### 4,泛型

由于协议中不能使用泛型，所以使用关联类型代替泛型，泛型只能用于class、struct
```swift
protocol Stackable {
	associatedtype Element // 关联类型
    mutating func push(_ element: Element) // mutating 不能用于class，可用于struct、enum, 可能被struct实现所以用mutating, 会改变struct的内存时要使用mutating
    mutating func pop() -> Element
    func top() -> Element
    func size() -> Int
}
// 一个函数可以返回不同的协议类型。 相反，它每次必须返回相同的不透明类型：
///自定义协议
protocol P {}
///拓展基础类型
extension Int: P {}
extension String: P {}
///区别
func makeIntOrString(_ isInt: Bool) -> P { isInt ? 1 : "1" } // ✅
func makeIntOrStringOpaque(_ isInt: Bool) -> some P { isInt ? 1 : "1" } // ❌ Compilation error
```
