// 1120 买地攻略
// 解题思路：使用滑动窗口（双指针）算法，统计所有和不超过M的连续子数组个数。
// 右指针扩展窗口，左指针收缩窗口，每次窗口内所有以right结尾的子数组都是合法方案。

import std.env.*
import std.convert.*

main() {
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let N = Int64.parse(parts[0])  // 土地块数
    let M = Int64.parse(parts[1])  // 客户现金量

    let pricesLine = getStdIn().readln().getOrThrow()
    let priceParts = pricesLine.split(" ")
    var prices = Array<Int64>(N, repeat: 0)  // 每块土地的价格
    for (i in 0..N) {
        prices[i] = Int64.parse(priceParts[Int64(i)])
    }

    var left: Int64 = 0   // 滑动窗口左边界
    var sum: Int64 = 0    // 当前窗口内土地总价
    var count: Int64 = 0  // 符合条件的购买方案数

    // 右指针遍历，扩展窗口
    for (right in 0..N) {
        sum += prices[right]        // 加入当前土地价格
        // 当窗口总价超过M时，移动左指针收缩窗口
        while (sum > M) {
            sum -= prices[left]
            left++
        }
        // 当前窗口内以right结尾的所有子数组都满足条件
        // 子数组个数 = right - left + 1
        count += right - left + 1
    }

    println(count)
}

