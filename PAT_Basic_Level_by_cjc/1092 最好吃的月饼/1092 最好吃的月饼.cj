// 1092 最好吃的月饼
// 解题思路：统计 N 种月饼在 M 个城市的总销量，找出最大销量，
// 输出最大销量值，以及所有达到最大销量的月饼种类编号（递增顺序）。
import std.env.*
import std.convert.*

main() {
    // 读取月饼种类数 N 和城市数 M
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var N = Int64.parse(parts[0])
    var M = Int64.parse(parts[1])
    // 初始化销量数组，长度为 N
    var sales = Array<Int64>(N, repeat: 0)
    // 累加每个城市的销量数据
    for (_ in 0..M) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        for (i in 0..N) {
            sales[i] += Int64.parse(parts[Int64(i)])
        }
    }
    // 找出最大销量
    var maxSale: Int64 = 0
    for (i in 0..N) {
        if (sales[i] > maxSale) {
            maxSale = sales[i]
        }
    }
    // 输出最大销量
    println(maxSale)
    // 输出所有达到最大销量的月饼编号（从1开始）
    var first = true
    for (i in 0..N) {
        if (sales[i] == maxSale) {
            if (!first) {
                print(" ")
            }
            print((i + 1).toString())
            first = false
        }
    }
    println("")
}

