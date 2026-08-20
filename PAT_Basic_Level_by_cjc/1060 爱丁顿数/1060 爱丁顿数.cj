import std.env.*
import std.convert.*

// PAT Basic Level 1060 爱丁顿数
// 解题思路：爱丁顿数 E 是满足"有 E 天骑车里程超过 E 英里"的最大整数
// 将骑行里程排序后，从大到小遍历：对排序后的数组 arr[i]（从小到大），
// 有 n-i 天里程 >= arr[i]，若 arr[i] > n-i，则说明爱丁顿数至少为 n-i
// 找到最大的满足 arr[i] > n-i 的 n-i 即为答案
main(): Int64 {
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    var arr = Array<Int64>(parts.size, repeat: 0)
    for (i in 0..parts.size) {
        arr[i] = Int64.parse(parts[i])
    }
    // 将骑行里程从小到大排序
    for (i in 0..n) {
        for (j in i + 1..n) {
            if (arr[i] > arr[j]) {
                let tmp = arr[i]
                arr[i] = arr[j]
                arr[j] = tmp
            }
        }
    }
    var e: Int64 = 0
    // 从最小里程开始遍历，找到最大的满足条件的 E
    for (i in 0..n) {
        let days = n - i          // 里程 >= arr[i] 的天数
        if (arr[i] > days) {      // 如果第 i 小的里程超过天数
            e = days              // 则爱丁顿数至少为 days
            break
        }
    }
    println(e)
    return 0
}

