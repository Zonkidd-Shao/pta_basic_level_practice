// PAT-Basic-1064 朋友数
// 解题思路：计算每个整数的各位数字之和作为朋友证号，使用 HashSet 去重，
// 然后排序后依次输出个数和所有朋友证号。
import std.env.*
import std.convert.*

// 计算数字 x 的各位数字之和
func sumDigits(x: Int64): Int64 {
    var n = x
    var sum: Int64 = 0
    while (n > 0) {
        sum += n % 10   // 取最低位
        n /= 10         // 去掉最低位
    }
    return sum
}

main(): Int64 {
    // 读入整数个数 N
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    // 读入 N 个整数
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    // 使用 HashSet 存储朋友证号，自动去重
    let friendSet = HashSet<Int64>()
    for (i in 0..parts.size) {
        let val = Int64.parse(parts[i])
        friendSet.put(sumDigits(val))
    }
    // 将去重后的结果转为数组并排序
    let result = friendSet.toArray()
    result.sort()
    // 输出朋友证号的个数
    println(result.size)
    // 按递增顺序输出所有朋友证号，空格分隔
    for (i in 0..result.size) {
        if (i > 0) {
            Console.stdOut.write(" ")
        }
        Console.stdOut.write(result[i].toString())
    }
    println("")
    return 0
}

