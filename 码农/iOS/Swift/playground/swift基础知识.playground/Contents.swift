import UIKit

var str = "Hello, playground"

///001 while
var num = 5
while num > 0 {
    print("num is \(num)")
    num -= 1
}

///repeat-while相当于C语言中的do-while
var count = -4
repeat{
    print("count \(count)")
    count += 1
}while count < 0

/*
 执行结果：
 num is 5
 num is 4
 num is 3
 num is 2
 num is 1
 count -4
 count -3
 count -2
 count -1
 */

///002 for

/*
 2.1 闭区间运算符：a...b，a <= 取值 <= b;
 */

let names = ["Anna","Alex","Brain","Jack"]
///方式1
//for i in 0...3 {
//    print(names[i])
//}

///方式2
//let range = 0...3
//for i in range {
//    print(names[i])
//}

/////方式3
//let a = 0
//let b = 3
//for i in a...b {
//    print(names[i])
//}

///方式4
//let a = 1
//for i in a...3 {
//    print(names[i])
//}

///重点：i默认是let，有需要时可以声明为var
for var i in 1...3 {
    i += 5
    print(i)
}

/*
 打印结果如下：
 6
 7
 8
 */


///Immutable value 'i' was never used; consider replacing with '_' or removing it
///如果函数体内i没有使用，则可以用“_”替换“i”
//for i in 1...3 {
//    print("Hello")
//}

for _ in 1...3 {
    print("Hello")
}


/*
 2.2 半开区间运算符：a..<b，a <= 取值 < b;
*/


/*
 打印结果：
 Anna
 Alex
 Brain
 Jack
 */
