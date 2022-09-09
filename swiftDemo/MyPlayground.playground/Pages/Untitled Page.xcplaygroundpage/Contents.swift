import UIKit
import Foundation

// List Demo
var testList: Array<String>
var testList2: [String] = ["ssss"]

testList2.append("pppp1")
testList2.append("pppp2")
testList2.append("pppp3")
testList2.append("pppp4")

testList2.remove(at: 0)
testList2.count
testList2[0...2]

var testList3 = ["1111","22222","33333","44444","55555"]
for item in testList3 {
    testList2.append(item)
}
testList2.insert("tttt", at: 0)

// Dictionary Demo
var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String, Double>()
var dict3: [String:Double] = [:]
var dict4 = [String:Double]()
var dict5 = ["aa": 4, "bb": 6]
dict5.count
dict5["aa"]
dict5["cc"] = 88
dict5.removeValue(forKey: "aa")

//for (key, value) in dict5 {
//    print("\(key):\(value)")
//}
//
//for item in dict5.keys {
//    print("\(item)")
//}

let testList4 = Array(dict5.keys)

// Set Demo
var set1 = Set<String>()
set1.insert("kkk")
set1.insert("pppp")
set1.insert("www")
set1.insert("rrr")
set1
//for val in set1 {
//    print(val)
//}
//var set2 = Set(["apple", "oranges", "pineapple"])
//for val in set2 {
//    print(val)
//}
var set3: Set = ["111", "222", "333", "444", "555"]

enum TextAlignment: Int {
    case left
    case right
    case center
}

var alignment: TextAlignment = TextAlignment.left
alignment = .right
TextAlignment.center.rawValue
TextAlignment(rawValue: 1)

// 方法和枚举关联
enum Lightbulb {
    case on
    case off
    
    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
        switch self {
        case .on:
            return ambient + 150.0
        case .off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var bulb = Lightbulb.on
let ambientTemperature = 77.0
var bulbTemperature = bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)
bulb.toggle()
bulb.surfaceTemperature(forAmbientTemperature: ambientTemperature)

// 扩展
typealias Velocity = Double
extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity {return self }
}

protocol Vehicle {
    var topSpeed: Velocity {get}
    var numberOfDoors: Int {get}
    var hasFlatbed: Bool {get}
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1.")
        }
    }
}

extension Car: Vehicle {
    var topSpeed: Velocity {return 180}
    var numberOfDoors: Int {return 4}
    var hasFlatbed: Bool {return false}
}

extension Car {
    init(make: String, model: String, year: Int) {
        self.init(make: make, model: model, year: year, color: "Black", nickname: "N/A", gasLevel: 1.0)
    }
}

var c = Car(make: "Ford", model: "Fusion", year: 2013)

extension Car {
    enum Kind {
        case coupe, sedan
    }
    var kind: Kind {
        if numberOfDoors == 2 {
            return .coupe
        } else {
            return .sedan
        }
    }
}

c.kind

extension Car {
    mutating func emptyGas(by amount: Double) {
        precondition(amount <= 1.0 && amount >= 0.0, "New value must be between 0 and 1.")
        gasLevel -= amount
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

c.emptyGas(by: 0.3)
c.gasLevel
c.fillGas()
c.gasLevel

// 泛型
struct Stack<E> {
    var items = [E]()
    
    mutating func push(_ newItem: E) {
        items.append(newItem)
    }
    
    mutating func pop() -> E? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.pop()
intStack.pop()
intStack.pop()

class OneQuestion {
    var question: String
    var answer: String?
    
    init() {
        question = "问题的题目"
    }
}

let someQuestion = OneQuestion()
someQuestion.answer = "答案随后"
someQuestion.question

let someQuestion2 = someQuestion
someQuestion2.answer = "第二个答案"
someQuestion.answer

class SomeClass {
    let numbers: [Int] = {
        var temporaryNumbers = [Int]()
        var isBlack = false
        for i in 1...10 {
            temporaryNumbers.append(i)
        }
        return temporaryNumbers
    }()
}

let someClass1 = SomeClass()
someClass1.numbers

struct SomeNumbers {
    var number: Int
    init(_ n: Int) {
        number = n
    }
}

var someNunmber1 = SomeNumbers(9)
someNunmber1.number

var someNunmber2 = someNunmber1
someNunmber2.number = 99
someNunmber1.number


class GameCharacter {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init(){
        self.init(name: "[未命名]")
    }
}

let oneChar = GameCharacter(name: "Kevin")
oneChar.name
let anotherChar = GameCharacter()
anotherChar.name

class Archer: GameCharacter {
    var attackRange: Double
    
    init(name: String, attackRange: Double) {
        self.attackRange = attackRange
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, attackRange: 1)
    }
}

let oneArcher = Archer()
oneArcher.attackRange

class Hunter: Archer {
    var hp = 100
    var description: String {
        return "\(name),hp是\(hp)"
    }
}

let oneHunter = Hunter()
oneHunter.description

enum TemperatureUnit: Character {
  case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let oneUnit = TemperatureUnit(rawValue: "F")
