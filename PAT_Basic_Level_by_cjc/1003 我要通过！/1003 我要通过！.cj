import std.env.*
import std.convert.*

// 1003 我要通过！
// 解题思路：根据 PAT 的规则判断字符串是否正确。
// 条件可归纳为：字符串只能包含 P、A、T，且 P 和 T 各出现一次，
// P 在 T 之前，中间至少有一个 A。
// 设 P 前 A 的数量为 a，P 与 T 之间的 A 数量为 b，T 后的 A 数量为 c，
// 则必须满足 c == a * b。
func isValid(s: String): Bool {
    var pIdx: Int64 = -1    // 记录字符 'P' 的位置
    var tIdx: Int64 = -1    // 记录字符 'T' 的位置
    var pCount: Int64 = 0   // 记录 'P' 的出现次数
    var tCount: Int64 = 0   // 记录 'T' 的出现次数
    var idx: Int64 = 0
    for (ch in s) {
        // 80='P', 65='A', 84='T' — 检查字符是否只包含 P、A、T
        if (ch != 80 && ch != 65 && ch != 84) {
            return false
        }
        if (ch == 80) {      // 记录 P 的位置和数量
            pCount = pCount + 1
            pIdx = idx
        }
        if (ch == 84) {      // 记录 T 的位置和数量
            tCount = tCount + 1
            tIdx = idx
        }
        idx = idx + 1
    }
    if (pCount != 1 || tCount != 1) {  // P 和 T 必须恰好出现一次
        return false
    }
    if (pIdx >= tIdx) {                // P 必须在 T 前面
        return false
    }
    let a = pIdx                       // P 前面 A 的个数
    let b = tIdx - pIdx - 1            // P 和 T 之间 A 的个数
    let c = s.size - tIdx - 1          // T 后面 A 的个数
    if (b < 1) {                       // P 和 T 之间至少有一个 A
        return false
    }
    return c == a * b                  // 核心条件：c 必须等于 a * b
}

main(): Int64 {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 读取待检测字符串的个数
    for (_ in 1..=n) {
        let s = getStdIn().readln().getOrThrow()           // 读取每个字符串
        if (isValid(s)) {
            println("YES")   // 满足条件输出 YES
        } else {
            println("NO")    // 不满足条件输出 NO
        }
    }
    return 0
}

