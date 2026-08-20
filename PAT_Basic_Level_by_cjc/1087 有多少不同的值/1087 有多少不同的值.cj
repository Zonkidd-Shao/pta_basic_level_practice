// 1087 有多少不同的值
// 解题思路：对于 n 从 1 到 N，计算 floor(n/2) + floor(n/3) + floor(n/5)，
// 利用 HashSet 自动去重，最后输出集合大小即为不同值的个数。
import std.env.*
import std.convert.*
import std.collection.*

main() {
    // 读取正整数 N
    var N = Int64.parse(getStdIn().readln().getOrThrow())
    // 使用 HashSet 存储所有不同的计算结果
    var set = HashSet<Int64>()
    for (n in 1..(N + 1)) {
        // 计算 floor(n/2) + floor(n/3) + floor(n/5)，Cjc 中整数除法自动向下取整
        var val = n / 2 + n / 3 + n / 5
        set.add(val)
    }
    // 输出不同值的个数
    println(set.size)
}

