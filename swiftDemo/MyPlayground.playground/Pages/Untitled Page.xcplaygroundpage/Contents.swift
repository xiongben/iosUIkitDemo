import UIKit

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

