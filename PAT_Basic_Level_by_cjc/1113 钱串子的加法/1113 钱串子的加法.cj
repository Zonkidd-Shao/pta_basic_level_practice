// 1113 钱串子的加法
// 解题思路：实现30进制大数加法。钱串子世界使用30进制（0-9，a-t表示10-29），
// 输入的两个数不超过10^5位，需从低位到高位逐位相加并处理进位，最后去除前导零。

import std.env.*
import std.convert.*

// 30进制数字字符集：0-9表示0-9，a-t表示10-29
let DIGITS = "0123456789abcdefghijklmnopqrst"

// 将30进制字符转换为对应的数值
func charToVal(c: Rune): Int64 {
    let s = c.toString()
    for (i in 0..30) {
        if (DIGITS[i] == c) {
            return Int64(i)
        }
    }
    return 0
}

// 将数值转换为对应的30进制字符
func valToChar(v: Int64): Rune {
    return DIGITS[v]
}

main() {
    // 读取输入的两个30进制数字字符串
    let input = getStdIn().readln().getOrThrow()
    let parts = input.split(" ")
    var a = parts[0]
    var b = parts[1]

    // 用前导零补齐两个数字到相同长度，方便逐位相加
    while (a.size < b.size) { a = "0" + a }
    while (b.size < a.size) { b = "0" + b }

    var carry: Int64 = 0  // 进位
    var result = ""       // 存放结果字符串

    // 从最低位（最右边）开始逐位相加
    var i = a.size - 1
    while (i >= 0) {
        let va = charToVal(a[i])  // 当前位的数值
        let vb = charToVal(b[i])
        let sum = va + vb + carry  // 当前位相加，加上进位
        carry = sum / 30           // 计算进位（30进制）
        result = valToChar(sum % 30).toString() + result  // 当前位结果拼接到前面
        i--
    }

    // 最高位仍有进位，需添加一位
    if (carry > 0) {
        result = valToChar(carry).toString() + result
    }

    // 去除结果中的前导零（保留最后一位0，如果结果全为0的话）
    var start: Int64 = 0
    while (start < result.size - 1 && result[start] == '0') {
        start++
    }
    println(result[start..])  // 输出最终结果
}

