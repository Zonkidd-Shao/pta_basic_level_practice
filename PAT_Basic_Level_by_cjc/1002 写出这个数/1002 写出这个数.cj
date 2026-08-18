import std.env.*
import std.convert.*

// 1002 写出这个数
// 解题思路：读入一个正整数（可能很大，用字符串处理），
// 计算其各位数字之和，然后将和的每一位数字用汉语拼音表示并输出。
main() {
    let input = getStdIn().readln().getOrThrow()  // 以字符串形式读入正整数
    var sum: Int64 = 0
    for (ch in input) {              // 遍历每一位字符，累加各位数字
        if (ch >= 48 && ch <= 57) {  // 判断字符是否为数字 '0'~'9'
            sum = sum + Int64.parse(ch.toString())
        }
    }
    let pinyins = ["ling", "yi", "er", "san", "si", "wu", "liu", "qi", "ba", "jiu"]
    let sumStr = sum.toString()      // 将和转为字符串，逐位处理
    var result = ""
    var first = true                 // 标记是否为第一个数字，用于控制空格
    for (ch in sumStr) {             // 遍历和的每一位数字
        if (!first) {
            result = result + " "    // 非首位，先加空格分隔
        }
        let digit = Int64.parse(ch.toString())
        result = result + pinyins[digit]  // 将数字转换为对应的拼音
        first = false
    }
    println(result)                  // 输出拼音结果
}

