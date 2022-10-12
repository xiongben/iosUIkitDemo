
import Foundation
import Darwin
//计算类占用内存情况

class Point { // 16字节的类的刚需
    var x = 11 // 8
    var test = true // 8对齐字节空间
    var y = 22 // 8
}  // 33 ,40 , 48(堆空间分配16的倍数)

var p = Point()
class_getInstanceSize(Point.self)

// 方法不占用对象内存，方法的本质是函数
// 方法函数都放在代码段
