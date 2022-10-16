
import Foundation

extension BinaryInteger {
    func isOdd() -> Bool {
        self % 2 != 0
    }
}

10.isOdd()
(-3).isOdd()


// 使用扩展给协议提供默认实现
protocol TestPro {
    func test1()
}
extension TestPro {
    func test1() {
        print("66666")
    }
    func test2(){
        print("88888")
    }
}
class Test1 : TestPro {
    
}

var t1 = Test1()
t1.test1()
