// PAT Basic Level 1019 数字黑洞
// 解题思路：任一个 4 位正整数（各位数字不全相同），将其数字按非递增和非递减排列，
// 相减得到新数，重复此过程最终将得到 6174（卡普雷卡尔常数）。
import std.env.*
import std.convert.*

main(): Int64 {
    let input = getStdIn().readln().getOrThrow()
    var n = Int64.parse(input)

    // 如果四位数字全相同（如 1111），则直接输出减法结果 0000
    if (n % 1111 == 0) {
        println("${n} - ${n} = 0000")
        return 0
    }

    // 重复黑洞过程直到得到 6174
    while (true) {
        let digits = getDigits(n)         // 将数字拆分为 4 个数字
        let asc = getAscending(digits)    // 非递增排列（大数）
        let desc = getDescending(digits)  // 非递减排列（小数）
        n = desc - asc                    // 大数减小数
        printNumber(desc)
        Console.stdOut.write(" - ")
        printNumber(asc)
        Console.stdOut.write(" = ")
        printNumber(n)
        println("")
        if (n == 6174) {
            break
        }
    }
    return 0
}

// 将整数 n 的各位数字拆分到数组中（不足 4 位的高位补 0）
func getDigits(n: Int64): Array<Int64> {
    var num = n
    let arr = Array<Int64>(4, item: 0)
    for (i in 0..4) {
        arr[i] = num % 10
        num = num / 10
    }
    return arr
}

// 将 4 个数字按从小到大排序，组成最小的 4 位数
func getAscending(digits: Array<Int64>): Int64 {
    let sorted = digits.copy()
    // 冒泡排序升序
    for (i in 0..3) {
        for (j in i+1..4) {
            if (sorted[i] > sorted[j]) {
                let tmp = sorted[i]
                sorted[i] = sorted[j]
                sorted[j] = tmp
            }
        }
    }
    return sorted[0]*1000 + sorted[1]*100 + sorted[2]*10 + sorted[3]
}

// 将 4 个数字按从大到小排序，组成最大的 4 位数
func getDescending(digits: Array<Int64>): Int64 {
    let sorted = digits.copy()
    // 冒泡排序降序
    for (i in 0..3) {
        for (j in i+1..4) {
            if (sorted[i] < sorted[j]) {
                let tmp = sorted[i]
                sorted[i] = sorted[j]
                sorted[j] = tmp
            }
        }
    }
    return sorted[0]*1000 + sorted[1]*100 + sorted[2]*10 + sorted[3]
}

// 按 4 位宽度输出数字，不足 4 位在前面补 0
func printNumber(n: Int64) {
    if (n < 10) {
        Console.stdOut.write("000")
    } else if (n < 100) {
        Console.stdOut.write("00")
    } else if (n < 1000) {
        Console.stdOut.write("0")
    }
    Console.stdOut.write(n.toString())
}

