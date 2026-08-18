// 题目编号：1106  2019数列
// 解题思路：
//   2019 数列的定义：前 4 项固定为 2、0、1、9，从第 5 项开始，
//   每一项等于前 4 项之和的个位数。
//   生成前 N 项并拼接成字符串输出。

import std.env.*
import std.convert.*

main() {
    // 读取要生成的项数 N
    let n = Int64.parse(getStdIn().readln().getOrThrow())

    if (n <= 0) {
        return
    }

    // 初始化长度为 n 的数组
    var arr = Array<Int64>(n, item: 0)
    // 设置前 4 项的初始值
    if (n >= 1) { arr[0] = 2 }
    if (n >= 2) { arr[1] = 0 }
    if (n >= 3) { arr[2] = 1 }
    if (n >= 4) { arr[3] = 9 }

    // 从第 5 项（索引 4）开始递推
    for (i in 4..n) {
        // 当前项 = 前 4 项之和的个位数
        arr[i] = (arr[i - 4] + arr[i - 3] + arr[i - 2] + arr[i - 1]) % 10
    }

    // 将所有数字拼接成字符串输出
    var result = ""
    for (i in 0..n) {
        result += arr[i].toString()
    }
    println(result)
}

