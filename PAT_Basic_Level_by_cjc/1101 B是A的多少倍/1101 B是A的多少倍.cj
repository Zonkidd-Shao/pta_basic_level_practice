// 题目编号：1101  B是A的多少倍
// 解题思路：
//   将正整数 A 的最低 D 位数字截下，移到剩余部分的前面，形成新的数 B。
//   计算 B 是 A 的多少倍，结果保留两位小数。
//   使用字符串截取拼接得到 B，再用整数算术计算 (B*100 + A/2) / A 实现四舍五入到两位小数。

import std.env.*
import std.convert.*

main() {
    // 读取输入：正整数 A 和截取位数 D
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let aStr = parts[0]
    let d = Int64.parse(parts[1])

    let aLen = aStr.size
    let lastD = aStr[aLen - d..aLen]   // 取出 A 的最后 D 位
    let prefix = aStr[0..aLen - d]     // 取出 A 的剩余高位部分
    let bStr = lastD + prefix          // 将最后 D 位移到前面，拼接成 B

    let a = Int64.parse(aStr)
    let b = Int64.parse(bStr)

    // 计算 b/a，保留两位小数（四舍五入）
    // 用整数运算：(b * 100 + a/2) / a 实现四舍五入到百分位
    let scaled = (b * 100 + a / 2) / a
    let intPart = scaled / 100         // 整数部分
    let fracPart = scaled % 100        // 小数部分

    // 输出格式：小数部分不足两位时补前导零
    if (fracPart < 10) {
        println("${intPart}.0${fracPart}")
    } else {
        println("${intPart}.${fracPart}")
    }
}

