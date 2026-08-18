// PAT Basic Level 1017 A除以B
// 解题思路：模拟手工竖式除法计算大整数 A（最多 1000 位）除以正整数 B（1~9），
// 从最高位开始逐位取商，余数保留到下一位继续计算。
import std.env.*
import std.convert.*

main(): Int64 {
    // 输入：被除数 A（字符串形式的大整数）和除数 B（一位正整数）
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let a = parts[0]
    let b = Int64.parse(parts[1])
    var q = ""     // 商（字符串形式）
    var r: Int64 = 0   // 余数
    // 逐位模拟除法竖式：当前位 = 上一位余数 * 10 + 当前位数字
    for (ch in a) {
        let digit = Int64.parse(ch.toString())
        let cur = r * 10 + digit   // 当前被除数
        let quotientDigit = cur / b  // 当前位的商
        r = cur % b                  // 更新余数
        // 跳过商的先导零（如 123/5，首位商 0 应跳过）
        if (!(q.size == 0 && quotientDigit == 0)) {
            q = q + quotientDigit.toString()
        }
    }
    // 如果商为空（A < B 的情况），输出 0
    if (q.size == 0) {
        q = "0"
    }
    println("${q} ${r}")
    return 0
}

