import UIKit

var str = "Hello, playground"

///函数的形参默认是let，也只能是let
func sum(v1: Int, v2: Int) -> Int {
    return v1 + v2
}

let s = sum(v1: 5, v2: 6)
print("和 is \(s)")

///隐式返回
func add(v1: Int, v2: Int) -> Int {
    ///如果整个函数体是一个单一表达式，那么函数会隐式返回这个表达式
    v1 + v2
}
var r = add(v1: 4, v2: 6)
print("r is \(r)")

///返回元组：实现多返回值
func calculate(v1: Int, v2: Int) -> (sum: Int, difference: Int, average: Float){
    
    let s = v1 + v2
    let d = v1 - v2
    ///s编译器会自动推断为Int类型，所以需要强转一下
    let a = Float(s) / 2.0
    
    return (s,d,a)
}

let result = calculate(v1: 12, v2: 13)
print("sum is \(result.sum)")
print("dif is \(result.difference)")
print("ave is \(result.average)")


///函数的文档注释

/// 求两个整数的和 【概述】
///
/// 计算整数value1和整数value2相加的结果【详细描述】
///
/// - Parameter value1: 第一个整数
/// - Parameter value2: 第二个整数
/// - Returns: 两个整数的和
///
/// - Note: 任意传入两个整数即可算出它们的和【备注】
///
func sum(value1: Int, value2: Int) -> Int {
    value1 + value2
}

let res = sum(value1: 11, value2: 14)


///参数标签【VIP】

///乘XX交通工具上班，一个by让函数读起来更像一个句子
func goToWork(by vehicle: String) {
    print("我是乘坐\(vehicle)上班的")
}

goToWork(by: "公交车")


///默认参数值（Default Parameter Value）

///参数可以有默认值
func check(name: String = "张三", age: Int = 20, job: String = "程序员") {
    print("大家好，我叫\(name),今年\(age)岁，我是一名\(job)")
}

check(name: "艾波儿", age: 26, job: "外卖配送员")
check(name: "李四")
check(age: 18, job: "高中生")

///😪🔥
func test(_ left: Int = 10, middle: Int, right: Int = 30) {
    print("left is \(left), middle is \(middle), right is \(right)")
}

test(middle: 15)
test(middle: 34, right: 10)
///❎ Missing argument for parameter 'middle' in call
///test(right: 25)


///可变参数（Variadic Parameter）
func sum(_ numbers: Int...) -> Int {
    var total = 0
    for num in numbers {
        total += num
    }
    print("这些数的和是\(total)")
    return total
}

///如果不用"_"，❎
//sum(numbers: <#T##Int...##Int#>)
sum(10,20,30,40)

///输入输出参数（In-Out Parameter）
///可用inout定义一个输入输出参数：可以在函数内部修改外部实参的值
func swapValue(_ v1: inout Int, _ v2: inout Int) {
    let tmp = v1
    v1 = v2
    v2 = tmp
}


///可变参数不能被标记为inout
///inout参数不能有默认值
///inout参数的本质是地址传递（引用传递）


///Extraneous argument labels 'v1:v2:' in call
//swapValue(v1: 30, v2: 40)

///Cannot pass immutable value as inout argument: literals are not mutable
//swapValue(30, 40)
//swapValue(&30, &40)

var num1 = 30
var num2 = 40
swapValue(&num1, &num2)

print("交换后num1 is \(num1),num2 is \(num2)")


///函数重载
func add(v1: Int, v2: Int) {
    v1 + v2
}

///Invalid redeclaration of 'add(v1:v2:)'
//func add(v1: Int, v2: Int) -> Int {
//    v1 + v2
//}

func add(v1: Int) {
    v1 * v1
}

//add(v1: 10, v2: 10)
add(v1: 15, v2: 15)
