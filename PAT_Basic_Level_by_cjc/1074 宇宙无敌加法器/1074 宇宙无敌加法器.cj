// PAT-Basic-1074 宇宙无敌加法器
// 解题思路：根据进制表对两个 PAT 数进行逐位相加。每位使用不同的进制（由进制表指定），
// 进制为 0 表示十进制。将两个数按进制表长度对齐，从低位到高位逐位计算和与进位。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入进制表（字符串形式，每位是 0 或 2-9 的数字）
    let base = getStdIn().readln().getOrThrow()
    // 读入两个 PAT 数
    let a = getStdIn().readln().getOrThrow()
    let b = getStdIn().readln().getOrThrow()

    var aDigits = a
    var bDigits = b

    // 将两个数前面补 0，使长度与进制表一致
    while (aDigits.size < base.size) { aDigits = "0" + aDigits }
    while (bDigits.size < base.size) { bDigits = "0" + bDigits }
    // 额外在最前面补一位 0，用于处理最高位的进位
    var extBase = "0" + base
    aDigits = "0" + aDigits
    bDigits = "0" + bDigits

    var carry: Int64 = 0  // 进位
    var result = ""
    // 从最低位（最右边）开始逐位相加
    var i = extBase.size - 1
    while (i >= 0) {
        let digitA = Int64(aDigits[i]) - 48
        let digitB = Int64(bDigits[i]) - 48
        // 获取当前位的进制，若为 '0' 则表示十进制（10）
        let radix = if (extBase[i] == 48) { 10 } else { Int64(extBase[i]) - 48 }
        let sum = digitA + digitB + carry  // 当前位相加结果
        result = (sum % radix).toString() + result  // 当前位结果（取模）
        carry = sum / radix  // 计算进位
        i--
    }

    // 去除结果前面的前导零
    var start: Int64 = 0
    while (start < result.size - 1 && result[start] == 48) {
        start += 1
    }
    println(result[start..])
    return 0
}
