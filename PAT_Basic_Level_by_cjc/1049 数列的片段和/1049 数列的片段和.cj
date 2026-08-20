// 题目编号：1049 数列的片段和
// 题目名称：数列的片段和
// 解题思路：数列中每个元素arr[i]在所有连续子序列中出现的次数为(i+1)*(n-i)，
//           即该元素可以出现在以它左侧任意元素为起点、右侧任意元素为终点的所有子序列中。
//           累加每个元素值乘以出现次数即为总和。

import std.env.*
import std.convert.*

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    
    var sum: Float64 = 0.0  // 所有子序列元素的总和
    
    // 遍历每个元素，计算其贡献
    for (i in 0..n) {
        let val = Float64.parse(parts[i])
        // arr[i] 在所有连续子序列中出现的次数 = (i+1) * (n-i)
        // 其中 i 是 0-indexed，所以左侧可选起点数为 i+1，右侧可选终点数为 n-i
        sum += val * Float64((i + 1) * (n - i))
    }
    
    // 输出结果，精确到小数点后2位
    let scaled = Int64(sum * 100.0 + 0.5)
    let integerPart = scaled / 100
    let fractionPart = scaled % 100
    if (fractionPart < 10) { println("${integerPart}.0${fractionPart}") }
    else { println("${integerPart}.${fractionPart}") }
}
