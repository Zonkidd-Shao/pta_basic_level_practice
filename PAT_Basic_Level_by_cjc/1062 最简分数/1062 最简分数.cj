import std.env.*
import std.convert.*

// PAT Basic Level 1062 最简分数
// 解题思路：给定两个分数 n1/m1 和 n2/m2，以及分母 k
// 找出所有分母为 k 的最简分数（即分子与 k 互质），
// 且其值介于两个给定分数之间
// 求最大公约数（欧几里得算法），用于判断两个数是否互质
func gcd(a: Int64, b: Int64): Int64 {
    if (b == 0) { return a }
    return gcd(b, a % b)
}

main(): Int64 {
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")

    // 解析两个分数和分母 k
    let frac1 = parts[0].split("/")
    let frac2 = parts[1].split("/")
    let k = Int64.parse(parts[2])

    var n1 = Int64.parse(frac1[0])  // 第一个分数的分子
    var m1 = Int64.parse(frac1[1])  // 第一个分数的分母
    var n2 = Int64.parse(frac2[0])  // 第二个分数的分子
    var m2 = Int64.parse(frac2[1])  // 第二个分数的分母

    // 确保 frac1 < frac2（交叉相乘比较大小）
    if (n1 * m2 > n2 * m1) {
        let tmpN = n1; n1 = n2; n2 = tmpN
        let tmpM = m1; m1 = m2; m2 = tmpM
    }

    // 求满足 n1/m1 < x/k < n2/m2 的整数 x
    // 即 x > n1*k/m1 且 x < n2*k/m2
    let low = n1 * k / m1 + 1           // 下界（取整后加 1）
    let high = (n2 * k - 1) / m2        // 上界（减 1 后取整）

    var results = ArrayList<Int64>()
    // 遍历所有可能的分子 x，筛选与 k 互质的（即最简分数）
    for (x in low..=high) {
        if (gcd(x, k) == 1) {
            results.add(x)
        }
    }

    // 输出结果，分数之间用空格分隔
    for (i in 0..results.size) {
        if (i > 0) {
            Console.stdOut.write(" ")
        }
        Console.stdOut.write("${results[i]}/${k}")
    }
    println("")
    return 0
}

