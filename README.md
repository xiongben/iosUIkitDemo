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
```
