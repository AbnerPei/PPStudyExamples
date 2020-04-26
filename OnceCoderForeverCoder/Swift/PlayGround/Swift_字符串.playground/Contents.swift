import UIKit

var str = "Hello, playground"

///字符串插值：在已有字符串中插入常量、变量、字面量和表达式从而形成更长的字符串的过程，尤其是在为显示。存储和打印创建自定义字符串值时，字符串插值操作尤其有用。

///注意
///Swift的string类型与Foundation NSString类进行无缝桥接。

///字符串字面量：由一对双引号包裹着的具有固定顺序的字符集。
let someString = "Once Coder, Forever Coder"
///Swift之所以推断`someString`为字符串类型，是**因为它使用了字面量方式进行初始化**。


///多行字符串字面量：由一对三个双引号包裹着的具有固定顺序的文本字符集
let namesInMind = """
Li Lei
Han Meimei
Tom
John
"""

///如果想换行，加强代码的可读性，又不想在多行字符串字面量中出现换行符的话，可以在行尾写反斜杠`\`作为续行符。
let sentence = """
Where there is a river, there is a city. It's never too late \
to learn. How clever your father is.

My name is PPAbner.
"""

///扩展字符串分割符
///字符串中的特殊字符将会被直接包含而非转义后的效果。
print("Line 1 \nLine 2")
print(#"Line 1 \nLine 2"#)
print(#"Line 1 \#nLine 2"#)
print(##"Line 1 \#nLine 2"##)
