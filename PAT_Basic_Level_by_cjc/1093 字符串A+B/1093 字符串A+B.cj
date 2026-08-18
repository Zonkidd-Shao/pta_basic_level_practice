// 1093 字符串A+B
// 解题思路：将字符串 A 和 B 拼接，去除重复字符（保留首次出现），
// 使用 HashSet 记录已出现的字符，按顺序遍历 A 和 B 构建结果字符串。
import std.env.*
import std.convert.*

main() {
    // 读取字符串 A 和 B
    var A = getStdIn().readln()
    var B = getStdIn().readln()
    // 使用 HashSet 记录已经出现过的字符（去重）
    var seen = HashSet<Rune>()
    var result = ""
    // 遍历字符串 A，保留首次出现的字符
    for (c in A) {
        if (!seen.contains(c)) {
            seen.put(c)
            result += c.toString()
        }
    }
    // 遍历字符串 B，只添加 A 中未出现过的字符
    for (c in B) {
        if (!seen.contains(c)) {
            seen.put(c)
            result += c.toString()
        }
    }
    // 输出合并去重后的结果
    println(result)
}

