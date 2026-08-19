import std.env.*
import std.convert.*

// PAT Basic Level 1053 住房空置率
// 解题思路：统计每套住房用电量低于阈值 e 的天数占比
// 若超过一半天数低于 e，再观察住房观测天数 k：
//   - 如果 k > D（观察天数阈值），判定为空置
//   - 否则判定为可能空置
// 最后输出可能空置率和空置率的百分比
main() {
    // 读取第一行：住房总数 n、低电量阈值 e、观察天数阈值 d
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let n = Int64.parse(parts[0])
    let e = Float64.parse(parts[1])
    let d = Int64.parse(parts[2])
    
    var maybeEmpty: Int64 = 0  // 可能空置的住房计数
    var empty: Int64 = 0       // 空置的住房计数
    
    for (_ in 0..n) {
        // 读取每套住房的数据：k 为观察天数，后面跟着 k 个用电量值
        let data = getStdIn().readln().getOrThrow()
        let vals = data.split(" ")
        let k = Int64.parse(vals[0])
        
        // 统计用电量低于阈值 e 的天数
        var lowCount: Int64 = 0
        for (i in 1..(k+1)) {
            let usage = Float64.parse(vals[i])
            if (usage < e) {
                lowCount++
            }
        }
        
        // 若超过一半天数用电量低于 e，则判定为空置或可能空置
        if (lowCount > k / 2) {
            if (k > d) {
                empty++          // 观察天数超过阈值，判定为空置
            } else {
                maybeEmpty++     // 观察天数未超过阈值，判定为可能空置
            }
        }
    }
    
    // 计算可能空置率和空置率的百分比
    let maybePct = Float64(maybeEmpty) / Float64(n) * 100.0
    let emptyPct = Float64(empty) / Float64(n) * 100.0
    
    // 输出结果，保留一位小数
    println("${maybePct.format("0.0")}% ${emptyPct.format("0.0")}%")
}

