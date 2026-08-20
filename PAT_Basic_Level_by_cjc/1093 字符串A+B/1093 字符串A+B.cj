// 1093 字符串A+B
// 解题思路：将字符串 A 和 B 拼接，去除重复字符（保留首次出现），
// 使用 HashSet 记录已出现的字符，按顺序遍历 A 和 B 构建结果字符串。
import std.env.*
import std.convert.*
import std.collection.*

main() {
    // 读取字符串 A 和 B
    let A = getStdIn().readln().getOrThrow()
    let B = getStdIn().readln().getOrThrow()
    // 使用 HashSet 记录已经出现过的字符（去重）
    var seen = HashSet<UInt8>()
    var result = ""
    // 遍历字符串 A，保留首次出现的字符
    for (c in A) {
        if (!seen.contains(c)) {
            seen.add(c)
            result += Rune(c).toString()
        }
    }
    // 遍历字符串 B，只添加 A 中未出现过的字符
    for (c in B) {
        if (!seen.contains(c)) {
            seen.add(c)
            result += Rune(c).toString()
        }
    }
    // 输出合并去重后的结果
    println(result)
}

