import std.env.*
import std.convert.*

// 1086 就不告诉你
// 思路：计算两个正整数的乘积，然后将乘积的数字顺序反转后输出。
// 注意反转后前导零会被自动丢弃（例如100反转后为1）。

main() {
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var A = Int64.parse(parts[0])  // 第一个正整数
    var B = Int64.parse(parts[1])  // 第二个正整数
    var prod = A * B               // 计算乘积
    // 通过取模和除法逐位反转数字
    var rev: Int64 = 0
    while (prod > 0) {
        rev = rev * 10 + (prod % 10)  // 提取末位并拼接到rev末尾
        prod = prod / 10              // 去掉末位
    }
    println(rev)  // 输出反转后的结果
}