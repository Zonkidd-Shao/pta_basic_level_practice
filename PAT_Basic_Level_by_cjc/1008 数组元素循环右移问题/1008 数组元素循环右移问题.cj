import std.env.*
import std.convert.*

// 1008 数组元素循环右移问题
// 解题思路：使用三次反转法实现数组循环右移，不需要额外数组。
// 先反转整个数组，再反转前 m 个元素，最后反转后 n-m 个元素。
// 注意 m 可能大于 n，需要先取模 m = m % n。
main(): Int64 {
    let line1 = getStdIn().readln().getOrThrow()
    let parts1 = line1.split(" ")
    let n = Int64.parse(parts1[0])  // 数组长度
    var m = Int64.parse(parts1[1])  // 右移位数
    let line2 = getStdIn().readln().getOrThrow()
    let parts2 = line2.split(" ")
    let arr = Array<Int64>(n, item: 0)
    for (i in 0..n) {
        arr[i] = Int64.parse(parts2[i])  // 读取数组元素
    }
    m = m % n          // 处理 m >= n 的情况，取模简化
    if (m > 0) {
        // 第一步：反转整个数组
        var left: Int64 = 0
        var right: Int64 = n - 1
        while (left < right) {
            let tmp = arr[left]
            arr[left] = arr[right]
            arr[right] = tmp
            left = left + 1
            right = right - 1
        }
        // 第二步：反转前 m 个元素
        left = 0
        right = m - 1
        while (left < right) {
            let tmp = arr[left]
            arr[left] = arr[right]
            arr[right] = tmp
            left = left + 1
            right = right - 1
        }
        // 第三步：反转剩余 n-m 个元素
        left = m
        right = n - 1
        while (left < right) {
            let tmp = arr[left]
            arr[left] = arr[right]
            arr[right] = tmp
            left = left + 1
            right = right - 1
        }
    }
    var result = ""
    for (i in 0..n) {
        if (i > 0) {
            result = result + " "
        }
        result = result + arr[i].toString()
    }
    println(result)  // 输出循环右移后的数组
    return 0
}

