import std.env.*
import std.convert.*

// 1082 射击比赛
// 思路：计算每个射击点到原点(0,0)的距离平方（避免开方精确计算），
// 距离最小的为冠军，距离最大的为菜鸟。

main() {
    var N = Int64.parse(getStdIn().readln().getOrThrow())  // 参赛人数
    var minDist: Int64 = 200000  // 最小距离平方，初始化为较大值
    var maxDist: Int64 = -1      // 最大距离平方，初始化为较小值
    var champion = ""            // 冠军编号
    var rookie = ""              // 菜鸟编号

    for (_ in 0..N) {
        var line = getStdIn().readln().getOrThrow()
        var parts = line.split(" ")
        var id = parts[0]               // 运动员编号
        var x = Int64.parse(parts[1])   // x坐标
        var y = Int64.parse(parts[2])   // y坐标
        var dist = x * x + y * y        // 计算到原点距离的平方

        // 更新最小距离（冠军）
        if (dist < minDist) {
            minDist = dist
            champion = id
        }
        // 更新最大距离（菜鸟）
        if (dist > maxDist) {
            maxDist = dist
            rookie = id
        }
    }
    // 输出冠军和菜鸟编号
    println("${champion} ${rookie}")
}