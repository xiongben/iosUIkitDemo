
//import Foundation

var arr1 = [1,2,3,4,5]

//var arr2 = arr1.reduce(0) { res, element in
//    return res + element
//}

var arr2 = arr1.reduce(0) {$0 + $1}
arr2

var arr3 = Array.init(repeating: 5, count: 2)
arr3

//可选类型的map
var num4: Int? = 10
var num5 = num4.map{ $0 * 2 }
num5


//函数式编程
// 可复用函数调用
let num6 = 6

func add(_ v: Int) -> (Int) -> Int{{ $0 + v }}
func sub(_ v: Int) -> (Int) -> Int{{ $0 - v }}
func multiple(_ v: Int) -> (Int) -> Int{{ $0 * v }}
func divide(_ v: Int) -> (Int) -> Int{{ $0 / v }}
func mod(_ v: Int) -> (Int) -> Int{{ $0 % v }}

let res1 = add(4)(num6)
res1

//实现[(num + 3) * 5 -1] % 10 / 2
let fn1 = add(3)
let fn2 = multiple(5)
let fn3 = sub(1)
let fn4 = mod(10)
let fn5 = divide(2)

//函数合成
func composite(_ f1: @escaping (Int) -> Int, _ f2: @escaping (Int) -> Int) -> (Int) -> Int {
    return {
        f2(f1($0))
    }
}

let fn = composite(add(3), multiple(5))
fn(6)

//柯里化

func add2(_ v1: Int, _ v2: Int, _ v3: Int) -> Int {v1 + v2 + v3}

func add3(_ v3: Int) -> (Int) -> (Int) -> Int {
    return {
        v2 in
        return {
            v1 in
            print(v1, v2, v3)
            return v1 + v2 + v3
        }
    }
}

add3(30)(20)(10)
