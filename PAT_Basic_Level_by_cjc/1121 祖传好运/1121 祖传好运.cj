// 1121 祖传好运
// 解题思路：递归判断一个数是否为"祖传好运数"。从数字最右边逐位去掉末位，
// 检查每个前缀是否都能被其位数整除（0-9默认为好运数）。

import std.env.*
import std.convert.*

// 递归判断数字n是否具有祖传好运
func isLucky(n: Int64): Bool {
    if (n < 10) {   // 0-9都是好运数（递归基）
        return true
    }
    let s = n.toString()
    let d = s.size          // 当前数字的位数
    if (n % Int64(d) != 0) {  // 如果不能被位数整除，则不幸运
        return false
    }
    let prefix = s[0..(d - 1)]  // 去掉末位后的前缀数字
    return isLucky(Int64.parse(prefix))  // 递归检查前缀
}

main() {
    let K = Int64.parse(getStdIn().readln().getOrThrow())  // 待评测数字个数
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")

    // 逐个判断每个数字是否具有祖传好运
    for (i in 0..K) {
        let n = Int64.parse(parts[Int64(i)])
        if (isLucky(n)) {
            println("Yes")
        } else {
            println("No")
        }
    }
}

