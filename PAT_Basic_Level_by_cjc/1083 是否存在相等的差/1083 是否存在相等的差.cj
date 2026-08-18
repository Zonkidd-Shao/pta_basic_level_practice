import std.env.*
import std.convert.*

// 1083 是否存在相等的差
// 思路：第i张卡片正面数字为i+1，背面数字为输入序列第i个数，
// 计算正反面数字之差的绝对值，用哈希表统计每个差值出现的次数，
// 输出出现次数>=2的差值（按差值从大到小）。

main() {
    var N = Int64.parse(getStdIn().readln().getOrThrow())  // 卡片张数
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")  // 洗牌后的背面数字排列
    var count = HashMap<Int64, Int64>()  // 差值 -> 出现次数的映射
    for (i in 0..N) {
        var val = Int64.parse(parts[Int64(i)])   // 背面数字
        // 计算正反面数字之差的绝对值（正面数字为i+1）
        var diff = if (val > (i + 1)) val - (i + 1) else (i + 1) - val
        count[diff] = (count.getOrDefault(diff, 0)) + 1  // 累加差值出现次数
    }
    // 筛选出出现次数>=2的差值
    var diffs = ArrayList<Int64>()
    for (k in count.keys()) {
        if (count[k] >= 2) {
            diffs.append(k)
        }
    }
    // 按差值从大到小排序
    diffs.sort(func(a: Int64, b: Int64): Int64 { return b - a })
    // 输出结果
    for (d in diffs) {
        println("${d} ${count[d]}")
    }
}