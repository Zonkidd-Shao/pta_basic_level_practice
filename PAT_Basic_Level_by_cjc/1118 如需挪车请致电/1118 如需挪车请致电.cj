// 1118 如需挪车请致电
// 解题思路：解析11行计算公式，每行可能是算术运算（+、-、*、/、%、^）、
// 开平方（sqrt）或中文拼音数字，计算结果均为一位整数，拼接成11位电话号码。

import std.env.*
import std.convert.*

// 在表达式中查找运算符的位置
func findOp(s: String): Int64 {
    for (i in 0..s.size) {
        let c = s[i]
        if (c == 43 || c == 45 || c == 42 || c == 47 || c == 37 || c == 94) {
            return i
        }
    }
    return -1
}

// 计算幂运算 base^exp
func power(base: Int64, exp: Int64): Int64 {
    var result: Int64 = 1
    for (i in 0..exp) {
        result *= base
    }
    return result
}

// 计算整数平方根（仅当完全平方时返回平方根，否则返回0）
func integerSqrt(n: Int64): Int64 {
    var i: Int64 = 0
    while (i * i <= n) {
        if (i * i == n) {
            return i
        }
        i++
    }
    return 0
}

// 将中文拼音数字转换为对应的整数
func pinyinToDigit(s: String): Int64 {
    if (s == "ling") { return 0 }
    if (s == "yi")   { return 1 }
    if (s == "er")   { return 2 }
    if (s == "san")  { return 3 }
    if (s == "si")   { return 4 }
    if (s == "wu")   { return 5 }
    if (s == "liu")  { return 6 }
    if (s == "qi")   { return 7 }
    if (s == "ba")   { return 8 }
    if (s == "jiu")  { return 9 }
    return 0
}

main() {
    var phone = ""  // 拼接得到的电话号码
    // 读取11行计算公式
    for (k in 0..11) {
        let expr = getStdIn().readln().getOrThrow()
        var result: Int64 = 0

        // 判断是否为 sqrt 运算（以"sqrt"开头）
        if (expr.size >= 4 && expr[0..4] == "sqrt") {
            let numStr = expr[4..]    // 提取被开方数字符串
            let num = Int64.parse(numStr)
            result = integerSqrt(num)
        } else {
            let opPos = findOp(expr)  // 查找运算符位置
            if (opPos >= 0) {
                // 有运算符，解析二元运算
                let left = Int64.parse(expr[0..opPos])         // 左操作数
                let right = Int64.parse(expr[(opPos + 1)..])    // 右操作数
                let op = expr[opPos]
                // 根据运算符执行相应计算
                if (op == 43) {
                    result = left + right
                } else if (op == 45) {
                    result = left - right
                } else if (op == 42) {
                    result = left * right
                } else if (op == 47) {
                    result = left / right
                } else if (op == 37) {
                    result = left % right
                } else if (op == 94) {
                    result = power(left, right)
                }
            } else {
                // 无运算符，视为中文拼音数字
                result = pinyinToDigit(expr)
            }
        }

        phone += result.toString()  // 将结果拼接到电话号码后
    }
    println(phone)  // 输出完整的电话号码
}

