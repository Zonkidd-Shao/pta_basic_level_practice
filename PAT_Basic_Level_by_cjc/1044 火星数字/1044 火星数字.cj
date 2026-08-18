// 题目编号：1044 火星数字
// 题目名称：火星数字
// 解题思路：火星数字是13进制，定义低位（0~12）和高位（1~12）的火星文映射表。
//           对于输入，判断是数字（地球文）还是字母（火星文）开头，分别处理：
//           地球→火星：除以13得高位和低位，查表拼接；火星→地球：根据单词数拆分查表计算数值。

import std.env.*
import std.convert.*

// 火星数字低位映射表（0~12），tret表示0
let lowMars = ["tret", "jan", "feb", "mar", "apr", "may", "jun", "jly", "aug", "sep", "oct", "nov", "dec"]
// 火星数字高位映射表（1~12），高位为13的倍数
let highMars = ["", "tam", "hel", "maa", "huh", "tou", "kes", "hei", "elo", "syy", "lok", "mer", "jou"]

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 测试用例数
    
    for (_ in 0..n) {
        let line = getStdIn().readln().getOrThrow()
        // 根据首字符判断是地球数字还是火星文
        if (line.size > 0 && line[0] >= '0' && line[0] <= '9') {
            // 情况1：地球数字 → 火星文
            let num = Int64.parse(line)
            if (num == 0) {
                println("tret")  // 0的特殊情况
            } else {
                let high = num / 13  // 高位（13的倍数部分）
                let low = num % 13   // 低位（余数）
                if (high > 0) {
                    if (low > 0) {
                        println("${highMars[high]} ${lowMars[low]}")  // 高位+低位
                    } else {
                        println(highMars[high])  // 13的倍数，只有高位
                    }
                } else {
                    println(lowMars[low])  // 小于13，只有低位
                }
            }
        } else {
            // 情况2：火星文 → 地球数字
            let parts = line.split(" ")
            if (parts.size == 1) {
                // 单个单词：可能是低位火星文或高位火星文
                for (i in 0..13) {
                    if (lowMars[i] == parts[0]) {
                        println(i)  // 低位火星文，直接输出数字
                        break
                    }
                }
                for (i in 1..13) {
                    if (highMars[i] == parts[0]) {
                        println(i * 13)  // 高位火星文，输出13的倍数
                        break
                    }
                }
            } else {
                // 两个单词：高位 + 低位
                var num: Int64 = 0
                for (i in 1..13) {
                    if (highMars[i] == parts[0]) {
                        num += i * 13  // 高位值
                        break
                    }
                }
                for (i in 0..13) {
                    if (lowMars[i] == parts[1]) {
                        num += i  // 低位值
                        break
                    }
                }
                println(num)
            }
        }
    }
}