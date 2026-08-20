// PAT Basic Level 1021 个位数统计
// 解题思路：遍历输入字符串中的每个字符，用长度为 10 的数组统计每个数字（0-9）出现的次数，
// 最后按数字从小到大输出出现次数非零的统计结果。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入一个不超过 1000 位的正整数（以字符串形式输入）
    let input = getStdIn().readln().getOrThrow()
    // 计数数组，counts[i] 表示数字 i 出现的次数
    var counts = Array<Int64>(10, repeat: 0)

    // 遍历字符串的每个字符，统计每个数字出现的次数
    for (ch in input) {
        if (ch >= 48 && ch <= 57) {  // 字符 '0'~'9' 的 ASCII 码为 48~57
            let d = Int64(ch) - 48
            counts[d]++
        }
    }

    // 从小到大输出出现次数非零的数字及其出现次数
    for (i in 0..10) {
        if (counts[i] > 0) {
            println("${i}:${counts[i]}")
        }
    }
    return 0
}
