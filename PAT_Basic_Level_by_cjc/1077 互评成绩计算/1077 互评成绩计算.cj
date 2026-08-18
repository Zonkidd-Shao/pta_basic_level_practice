import std.env.*
import std.convert.*

// 1077 互评成绩计算
// 思路：对每个小组读取老师评分G2和其他组的N-1个评分，
// 过滤掉不在[0,M]范围内的非法评分，去掉最高分和最低分，
// 计算剩余评分的平均分G1，再与G2平均后四舍五入取整。

main(): Int64 {
    // 读取分组数N和满分M
    let first = getStdIn().readln().getOrThrow().split(" ")
    let n = Int64.parse(first[0])
    let m = Int64.parse(first[1])

    // 逐组处理
    for (_ in 1..=n) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let g2 = Int64.parse(parts[0])              // 老师给出的评分
        var sum: Int64 = 0                           // 合法评分总和
        var minVal: Int64 = m + 1                    // 最小值初始化为满分+1
        var maxVal: Int64 = -1                       // 最大值初始化为-1
        var count: Int64 = 0                         // 合法评分个数

        // 遍历其他组给出的评分（从索引1开始）
        for (i in 1..parts.size) {
            let score = Int64.parse(parts[i])
            // 只累加合法区间[0, M]内的评分
            if (score >= 0 && score <= m) {
                sum += score
                count += 1
                if (score < minVal) { minVal = score }
                if (score > maxVal) { maxVal = score }
            }
        }
        // 去掉一个最高分和一个最低分
        sum -= minVal + maxVal
        count -= 2

        // 计算G1（同学评分的平均值）
        let g1 = sum as Float64 / count as Float64
        // 最终得分 = (G1 + G2) / 2
        let final = (g1 + g2 as Float64) / 2.0
        // 四舍五入取整（加0.5后截断）
        let result = (final + 0.5).truncate()
        println(result)
    }
    return 0
}