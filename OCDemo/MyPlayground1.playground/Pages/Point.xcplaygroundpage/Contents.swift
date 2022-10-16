
import Foundation
import Darwin

var age = 10
   
var ptr = withUnsafePointer(to: &age){$0}
print(ptr)

var ptr2 = UnsafeMutablePointer<Int>.allocate(capacity: 2)
//ptr2.initialize(repeating: 10, count: 2)
ptr2.initialize(to: 10)
ptr2.successor().initialize(to: 12)  //跳8个字节，后继

ptr2.pointee
ptr2.successor().pointee
ptr2[1]

ptr2.deinitialize(count: 2) //反初始化
ptr2.deallocate()

//指针之间的转换

