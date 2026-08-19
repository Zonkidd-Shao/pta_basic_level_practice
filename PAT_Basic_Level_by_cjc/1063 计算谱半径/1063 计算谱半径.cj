// PAT-Basic-1063 计算谱半径
// 解题思路：计算每个复数特征值的模 sqrt(a^2 + b^2)，找出最大模即为谱半径，
// 最后将结果四舍五入保留两位小数输出。
import std.env.*
import std.convert.*
import std.math.*

main(): Int64 {
    // 读入特征值的个数 N
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    // maxMod 用于记录最大的模，初始化为 0
    var maxMod: Float64 = 0.0
    // 依次读取每个特征值的实部 a 和虚部 b
    for (_ in 1..=n) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let a = Float64.parse(parts[0])  // 实部
        let b = Float64.parse(parts[1])  // 虚部
        // 计算模：sqrt(a^2 + b^2)
        let mod = sqrt(a * a + b * b)
        // 更新最大模
        if (mod > maxMod) {
            maxMod = mod
        }
    }
    // 四舍五入保留两位小数：先乘100加0.5再截断，最后除以100
    let rounded = (maxMod * 100.0 + 0.5).truncate() / 100.0
    let str = rounded.toString()
    let dotIdx = str.find(".")
    if (dotIdx != nil) {
        // 有小数点，截取整数部分并补齐两位小数
        let idx = dotIdx.getOrThrow()
        var decimal = str[idx + 1..]
        while (decimal.size < 2) {
            decimal += "0"
        }
        println("${str[0..=idx]}${decimal[0..2]}")
    } else {
        // 无小数点，直接补 ".00"
        println("${str}.00")
    }
    return 0
}

