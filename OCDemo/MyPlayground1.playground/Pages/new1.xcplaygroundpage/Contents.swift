
//string处理
var str1 = "1_2"
str1.insert("_", at: str1.endIndex)
str1

str1.insert(contentsOf: "435_", at: str1.endIndex)

str1.remove(at: str1.startIndex)
str1

var str2 = "aa-bb-cc-dd-qq-aa-bb-cc"
str2.removeAll(){
    $0 == "a"
}
str2

//substr
var str3 = "abcdefghijk123456"
var substr1 = str3.prefix(3)
var substr2 = str3.suffix(3)
var range = str3.startIndex..<str3.index(str3.startIndex, offsetBy: 3)
var substr3 = str3[range]

var str4 = String(substr3)
