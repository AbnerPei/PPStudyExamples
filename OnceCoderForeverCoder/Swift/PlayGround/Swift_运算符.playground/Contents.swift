import UIKit

var str = "Hello, playground"

///闭区间运算符 a...b， a <= 取值 <= b

let names = ["德玛","提莫","女枪","寒冰"]
for i in 0...3 {
    print(names[i])
}

let range = 0...3
for i in range {
    print(names[i])
}

let a = 1
let b = 3
for i in a...b {
    print(names[i])
}

for i in a...2 {
    print(names[i])
}

///注意：i默认是let的，有需要时也可以声明为var
for var i in 0...20 {
    i += 3
    print("1___i is \(i)")
}

///如果i不在for循环中使用，可以用“_”替代
for _ in a...b {
    print("swift")
}


///半开区间运算符 a..<b，a <= 取值 < b
///
///示例参考上面的稍加修改即可

///switch
///switch必须要保证能处理所有情况
///case、default后面至少要有一条语句，如果不想做任何事，加个break即可
var number = 3
switch number {
case 0:
    break
case 1:
    print("1")
default:
    break
}

