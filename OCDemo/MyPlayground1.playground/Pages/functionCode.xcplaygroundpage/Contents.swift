
import Foundation

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
