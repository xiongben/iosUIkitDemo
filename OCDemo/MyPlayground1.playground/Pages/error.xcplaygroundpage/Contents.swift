import Foundation
import Darwin


class MyError : Error {
    var msg: String
    init(msg: String){
        self.msg = msg
    }
}

func divide(_ num1: Int) throws -> Int {
    if num1 == 0 {
        defer {
            print("6666666")
        }
        throw MyError(msg: "0不能在这里使用")
    }
    return num1
}

do {
    var res = try divide(0)
    print("wwwww")
} catch is MyError {
    print("oooooooo")
}catch {
    print("yyyyyeeeyy")
}
