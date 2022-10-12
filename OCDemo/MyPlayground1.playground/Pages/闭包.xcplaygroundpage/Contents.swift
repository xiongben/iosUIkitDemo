

import Foundation

// 闭包表达式

func execFn(num1: Int, num2: Int, fn: (Int, Int) -> Int){
    print(fn(num1, num2))
}

execFn(num1: 10, num2: 20, fn: {
    num1, num2 in num1 + num2
})

execFn(num1: 10, num2: 20, fn: {$0 + $1})

execFn(num1: 10, num2: 20) { num1, num2 in
    return num1 + num2
}

execFn(num1: 10, num2: 20, fn: {(num1: Int, num2: Int) -> Int in return num1 + num2})

var arr1 = [10,33,45,32,12,9,76]

arr1.sort(by: {$0 < $1})
arr1
arr1.sort(by: {i1, i2 in i1 > i2})
arr1
arr1.sort(){$0 < $1}
arr1
arr1.sort{$0 > $1}
arr1

