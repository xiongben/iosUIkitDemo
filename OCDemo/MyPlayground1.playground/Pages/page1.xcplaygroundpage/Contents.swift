

let age:Int
age = 10
Int16.max
Int8.min

enum Score {
    case points(Int)
    case grade(Character)
}

var score = Score.points(96)
score = .grade("A")


//存储问题

MemoryLayout<Int>.size
MemoryLayout<Int>.stride
MemoryLayout<Int>.alignment

enum PassWord {
    case number(Int, Int, Int, Int)
    case other
}

var pwd = PassWord.number(5, 8, 8, 2)
pwd = .other

MemoryLayout<PassWord>.size
MemoryLayout<PassWord>.stride

//可选项
var age2: Int? = 10
var num2 = age2! + 20 //强制解包


