# iosUIkitDemo
uikit practice demo

# IOS学习笔记

## swift部分
### 1，下标
```swift
enum Planet: Int {
    case mercury = 1, aa, bb, cc, dd, ee, ff, gg
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let res1 = Planet[4]
```
