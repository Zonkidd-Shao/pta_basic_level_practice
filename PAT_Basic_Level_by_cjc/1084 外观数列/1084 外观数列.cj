import std.env.*
import std.convert.*

// 1084 外观数列
// 思路：外观数列的每一项都是对前一项的描述：
// 统计连续相同字符的个数，按"字符+个数"的格式输出。
// 从初始数字d开始，迭代N-1次得到第N项。

// 生成外观数列的下一项：统计连续相同字符，输出字符+个数
func lookAndSay(s: String): String {
    var result = ""
    var i = 0
    while (i < s.size) {
        var ch = s[i]        // 当前字符
        var cnt: Int64 = 1   // 连续出现次数至少为1
        i++
        // 统计连续相同字符的个数
        while (i < s.size && s[i] == ch) {
            cnt++
            i++
        }
        // 输出"字符+个数"
        result += ch.toString() + cnt.toString()
    }
    return result
}

main() {
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var d = parts[0]               // 起始数字
    var N = Int64.parse(parts[1])  // 要求输出的第N项
    var s = d                      // 第1项就是数字d本身
    // 迭代N-1次，生成第N项
    for (_ in 1..N) {
        s = lookAndSay(s)
    }
    println(s)  // 输出第N项
}