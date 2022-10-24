import Foundation

class Observer: NSObject {
    
}

class Person: NSObject {
    @objc dynamic var age: Int = 0
    var observation: NSKeyValueObservation?
    
    override init() {
        super.init()
        observation = observe(\Person.age, options: .new) {
            (person, change) in
            print(change.newValue as Any)
        }
    }
    
//    deinit {
//        self.removeObserver(observer, forKeyPath: "age")
//    }
}

var p = Person()

p.age = 20

p.setValue(25, forKey: "age")
