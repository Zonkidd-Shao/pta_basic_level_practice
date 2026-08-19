// PAT Basic Level 1023 组个最小数
// 解题思路：给定 0-9 各数字的可用个数，要组成一个最小的数。
// 核心策略：首位不能为 0，所以先选一个最小的非零数字放在最高位，
// 然后其余数字按从小到大依次拼接。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入 10 个数字，分别表示数字 0-9 的可用个数
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    var counts = Array<Int64>(10, item: 0)
    for (i in 0..10) {
        counts[i] = Int64.parse(parts[i])
    }

    // 找最小的非零数字放在首位（确保没有前导零）
    for (i in 1..10) {
        if (counts[i] > 0) {
            Console.stdOut.write(i.toString())
            counts[i]--
            break
        }
    }

    // 然后按 0-9 的顺序依次输出剩余的所有数字
    for (i in 0..10) {
        while (counts[i] > 0) {
            Console.stdOut.write(i.toString())
            counts[i]--
        }
    }

    println("")
    return 0
}

