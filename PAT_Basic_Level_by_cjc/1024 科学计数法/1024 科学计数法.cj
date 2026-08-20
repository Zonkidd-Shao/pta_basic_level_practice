// PAT Basic Level 1024 科学计数法
// 解题思路：将科学计数法表示的实数转换为普通数字表示。
// 解析出符号、尾数（含小数点）和指数部分，根据指数的正负及大小移动小数点位置。
import std.env.*
import std.convert.*

main(): Int64 {
    let input = getStdIn().readln().getOrThrow()

    // 找到字符 'E' 的位置，将输入分为尾数和指数两部分
    var ePos: Int64 = 0
    for (i in 0..input.size) {
        if (input[i] == 69) {
            ePos = i
            break
        }
    }

    let sign = input[0]             // 整个数的正负号
    // 尾数部分（不含符号），如 "+1.23400" 中的 "1.23400"
    let mantissa = input[1..ePos]
    // 指数部分的符号和数值
    let expSign = input[ePos + 1]
    let expStr = input[ePos + 2..]
    let exp = Int64.parse(expStr)

    // 找到尾数中小数点的位置
    var dotPos: Int64 = 0
    for (i in 0..mantissa.size) {
        if (mantissa[i] == 46) {
            dotPos = i
            break
        }
    }

    // 分离尾数的整数部分和小数部分
    let intPart = mantissa[0..dotPos]
    let fracPart = mantissa[dotPos + 1..]

    var result = ""
    if (expSign == 43) {
        // 指数为正：小数点右移
        if (exp >= fracPart.size) {
            // 右移位数超过小数部分长度，需要补零
            result = intPart + fracPart + repeatChar("0", exp - fracPart.size)
        } else {
            // 右移位数在小数部分范围内，移动小数点
            result = intPart + fracPart[0..exp] + "." + fracPart[exp..]
        }
    } else {
        // 指数为负：小数点左移
        if (exp >= intPart.size) {
            // 左移位数超过整数部分长度，需要在前面补零
            result = "0." + repeatChar("0", exp - intPart.size) + intPart + fracPart
        } else {
            // 左移位数在整数部分范围内，移动小数点
            let intLen = intPart.size
            result = intPart[0..intLen - exp] + "." + intPart[intLen - exp..] + fracPart
        }
    }

    // 如果原数为负数，添加负号
    if (sign == 45) {
        print("-")
    }
    println(result)
    return 0
}

// 生成由指定字符重复 count 次组成的字符串
func repeatChar(ch: String, count: Int64): String {
    var s = ""
    for (_ in 0..count) {
        s = s + ch
    }
    return s
}

