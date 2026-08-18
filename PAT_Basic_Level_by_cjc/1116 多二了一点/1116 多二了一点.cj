// 1116 多二了一点
// 解题思路：判断一个2n位数中，后n位组成的数是否比前n位组成的数恰好大2。
// 先检查位数是否为偶数，然后比较前后两半数字是否满足X = Y + 2。

import std.env.*
import std.convert.*

// 判断后一半数X是否等于前一半数Y加2
// 由于题目保证Y的个位数不大于7，因此不需要处理进位
func isTwoMore(X: String, Y: String): Bool {
    let len = X.size
    // 除最后一位外，前面所有位必须相等
    for (i in 0..(len - 1)) {
        if (X[i] != Y[i]) {
            return false
        }
    }
    // 最后一位满足 X的最后一位 = Y的最后一位 + 2
    let lastX = Int64.parse(X[len - 1].toString())
    let lastY = Int64.parse(Y[len - 1].toString())
    return lastX == lastY + 2
}

main() {
    let N = getStdIn().readln().getOrThrow()  // 读取输入的正整数
    let len = N.size

    // 如果位数不是偶数，输出错误信息
    if (len % 2 != 0) {
        println("Error: ${len} digit(s)")
        return
    }

    // 将数字分为前后两半
    let half = len / 2
    let Y = N[0..half]   // 前一半数位组成的数
    let X = N[half..]    // 后一半数位组成的数

    // 判断后一半是否比前一半大2
    if (isTwoMore(X, Y)) {
        println("Yes: ${X} - ${Y} = 2")
    } else {
        println("No: ${X} - ${Y} != 2")
    }
}

