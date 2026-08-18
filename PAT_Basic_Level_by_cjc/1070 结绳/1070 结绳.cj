// PAT-Basic-1070 结绳
// 解题思路：每次将两段绳子对折（长度相加再除以 2）连接在一起，
// 为了得到最长的最终绳子，应先将较短的绳子对折（贪心策略），
// 所以先将所有绳段长度排序，然后依次对折合并。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入绳段个数 N
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    // 存储所有绳段长度
    var arr = Array<Int64>(n, item: 0)
    for (i in 0..n) {
        arr[i] = Int64.parse(parts[i])
    }
    // 按长度升序排序，贪心策略：先对折短的
    arr.sort()
    // 从最短的绳段开始，每次与下一段对折连接
    var total = arr[0] as Float64
    for (i in 1..n) {
        total = (total + arr[i] as Float64) / 2.0
    }
    // 取整输出最终长度
    let result = total.truncate()
    println(result)
    return 0
}

