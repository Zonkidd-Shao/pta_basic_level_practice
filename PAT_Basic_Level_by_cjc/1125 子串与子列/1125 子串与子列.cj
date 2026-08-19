// 1125 子串与子列
// 解题思路：对于S的每个起点位置，尝试匹配子列P，记录匹配到P时跨越的长度，
// 取最短的匹配子串（若有多个相同长度，取起点最靠左的）。

import std.env.*
import std.convert.*

main() {
    let S = getStdIn().readln().getOrThrow()  // 主串
    let P = getStdIn().readln().getOrThrow()  // 子列（需保持顺序匹配）

    let n = S.size
    let m = P.size

    var minLen = n + 1     // 记录最短匹配子串的长度
    var bestStart: Int64 = 0  // 记录最短匹配子串的起点

    // 枚举S的每个起点
    for (start in 0..n) {
        var pIdx: Int64 = 0  // P的匹配进度
        var pos = start      // 当前扫描S的位置
        // 在S中从start开始，按顺序匹配P的每个字符
        while (pos < n && pIdx < m) {
            if (S[pos] == P[pIdx]) {
                pIdx++  // 匹配上P的一个字符
            }
            pos++       // 继续扫描下一个字符
        }
        // 如果P完全匹配成功，计算子串长度，更新最短记录
        if (pIdx == m) {
            let len = pos - start
            if (len < minLen) {
                minLen = len
                bestStart = start
            }
        }
    }

    // 输出最短匹配子串
    println(S[bestStart..(bestStart + minLen)])
}

