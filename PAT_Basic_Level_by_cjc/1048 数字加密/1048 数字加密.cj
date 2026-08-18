// 题目编号：1048 数字加密
// 题目名称：数字加密
// 解题思路：将A和B两个数字字符串按最长长度对齐，短的前面补0。
//           从最低位（个位，即最右边）开始按位处理，奇数位用(A+B)%13映射到0~K，
//           偶数位用(B-A+10)%10，逐位拼接得到加密结果。

import std.env.*
import std.convert.*

main() {
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let aStr = parts[0]  // 加密用正整数A
    let bStr = parts[1]  // 待加密的正整数B
    
    // 取两个字符串的最大长度，短的前面补0对齐
    let maxLen = max(aStr.size, bStr.size)
    var aPad = ""
    var bPad = ""
    
    // 给A的前面补0
    for (_ in 0..(maxLen - aStr.size)) {
        aPad += "0"
    }
    aPad += aStr
    
    // 给B的前面补0
    for (_ in 0..(maxLen - bStr.size)) {
        bPad += "0"
    }
    bPad += bStr
    
    var result = ""
    // 映射表，0~9对应数字，10~12对应J、Q、K
    let map = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K']
    
    // 从高位到低位遍历，但位数的奇偶以个位（最右边）为第1位
    for (i in 0..maxLen) {
        let pos = maxLen - i  // 从右数的位置，1-indexed（个位为第1位）
        let aDigit = aPad[i].toInt64() - '0'.toInt64()
        let bDigit = bPad[i].toInt64() - '0'.toInt64()
        
        if (pos % 2 == 1) {
            // 奇数位：对应位数字相加后对13取余，查映射表
            let sum = (aDigit + bDigit) % 13
            result += map[sum].toString()
        } else {
            // 偶数位：B的数字减去A的数字，结果为负数则加10
            var diff = bDigit - aDigit
            if (diff < 0) { diff += 10 }
            result += diff.toString()
        }
    }
    
    println(result)
}