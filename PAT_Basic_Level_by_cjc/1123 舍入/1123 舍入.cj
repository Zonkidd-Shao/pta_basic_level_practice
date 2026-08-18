// 1123 舍入
// 解题思路：根据指令符1（四舍五入）、2（截断）、3（四舍六入五成双）对浮点数进行
// 指定小数位数的舍入处理。将数字拆分为整数部分和小数部分，根据舍入规则决定是否进位。

import std.env.*
import std.convert.*

// 对数字字符串执行加1操作（处理进位）
func addOne(digits: String): String {
    var carry: Int64 = 1
    var result = ""
    var i = digits.size - 1
    while (i >= 0) {
        let d = Int64.parse(digits[i].toString()) + carry  // 当前位加上进位
        result = (d % 10).toString() + result               // 当前位结果
        carry = d / 10                                      // 进位
        i--
    }
    if (carry > 0) {
        result = "1" + result  // 最高位仍有进位，前面加1
    }
    return result
}

main() {
    let firstLine = getStdIn().readln().getOrThrow()
    let parts = firstLine.split(" ")
    let N = Int64.parse(parts[0])  // 待处理数字个数
    let D = Int64.parse(parts[1])  // 保留的小数位数

    for (k in 0..N) {
        let exprLine = getStdIn().readln().getOrThrow()
        // 找到第一个空格，分隔指令符和数字
        var spacePos: Int64 = -1
        for (i in 0..exprLine.size) {
            if (exprLine[i] == ' ') {
                spacePos = i
                break
            }
        }
        let mode = Int64.parse(exprLine[0..spacePos].toString())  // 舍入方式：1/2/3
        let numStr = exprLine[(spacePos + 1)..]                   // 待处理数字字符串

        // 将数字拆分为整数部分和小数部分
        var intPart = ""
        var decPart = ""
        var hasDot = false
        for (i in 0..numStr.size) {
            if (numStr[i] == '.') {
                intPart = numStr[0..i]       // 小数点前为整数部分
                decPart = numStr[(i + 1)..]  // 小数点后为小数部分
                hasDot = true
                break
            }
        }
        if (!hasDot) {
            intPart = numStr  // 无小数点，整个数字为整数部分
            decPart = ""
        }

        // 补齐小数部分到至少D+1位，以便判断舍入
        while (decPart.size < D + 1) {
            decPart += "0"
        }

        var needRoundUp = false  // 是否需要进位

        if (mode == 2) {
            // 截断模式：直接舍去多余位数，不需要进位
            needRoundUp = false
        } else if (decPart.size > D) {
            let extraDigit = Int64.parse(decPart[D].toString())  // 第D+1位（要判断的位）

            if (mode == 1) {
                // 四舍五入：看第D+1位，>=5则进位
                needRoundUp = extraDigit >= 5
            } else if (mode == 3) {
                // 四舍六入五成双
                if (extraDigit > 5) {
                    needRoundUp = true      // >5 进位
                } else if (extraDigit < 5) {
                    needRoundUp = false     // <5 舍去
                } else {
                    // extraDigit == 5，看5后面是否有非零数字
                    var hasNonZero = false
                    var j = D + 1
                    while (j < decPart.size) {
                        if (decPart[j] != '0') {
                            hasNonZero = true  // 5后面有非零数字，进位
                            break
                        }
                        j++
                    }
                    if (hasNonZero) {
                        needRoundUp = true
                    } else {
                        // 5后面全是0，看保留的最后一位：奇数进位，偶数舍去
                        if (D > 0) {
                            let dth = Int64.parse(decPart[D - 1].toString())
                            needRoundUp = (dth % 2 == 1)  // 奇数进位
                        } else {
                            // D==0的情况，看整数部分最后一位
                            let lastInt = Int64.parse(intPart[intPart.size - 1].toString())
                            needRoundUp = (lastInt % 2 == 1)
                        }
                    }
                }
            }
        }

        if (needRoundUp) {
            // 需要进位：将整数部分和小数部分的前D位拼接后加1
            var combined = intPart
            if (D > 0) {
                combined += decPart[0..D]
            }
            combined = addOne(combined)

            if (D == 0) {
                intPart = combined
                decPart = ""
            } else {
                let intLen = combined.size - D
                intPart = combined[0..intLen]      // 新整数部分
                decPart = combined[intLen..]       // 新小数部分
            }
        } else {
            // 不需进位，直接截断到D位小数
            if (D > 0) {
                decPart = decPart[0..D]
            }
        }

        // 输出结果
        if (D == 0) {
            println(intPart)
        } else {
            println(intPart + "." + decPart)
        }
    }
}

