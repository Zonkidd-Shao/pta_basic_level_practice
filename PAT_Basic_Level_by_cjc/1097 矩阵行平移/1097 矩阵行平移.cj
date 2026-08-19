// 1097 矩阵行平移
// 解题思路：对 n×n 矩阵的奇数行进行循环右移，每处理一个奇数行平移量递增
// （1,2,...,k,1,2,...循环），平移后在行首用值 x 填充空位，最后输出各列之和。
import std.env.*
import std.convert.*

main() {
    // 读取矩阵规模 n、最大平移量 k、填充值 x
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var n = Int64.parse(parts[0])
    var k = Int64.parse(parts[1])
    var x = Int64.parse(parts[2])

    // 读取 n×n 矩阵
    var matrix = ArrayList<ArrayList<Int64>>()
    for (_ in 0..n) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        var row = ArrayList<Int64>()
        for (j in 0..n) {
            row.append(Int64.parse(parts[Int64(j)]))
        }
        matrix.append(row)
    }

    var shift = 1  // 当前奇数行的平移量，从1开始
    for (i in 0..n) {
        if ((i + 1) % 2 == 1) {
            // 奇数行（行号从1开始），进行循环右移
            var row = matrix[Int64(i)]
            var newRow = ArrayList<Int64>()
            // 在行首填充 shift 个 x
            for (_ in 0..shift) {
                newRow.append(x)
            }
            // 复制原行前 n-shift 个元素到新行末尾
            for (j in 0..(n - shift)) {
                newRow.append(row[Int64(j)])
            }
            matrix[Int64(i)] = newRow
            // 平移量递增，超过 k 则回到1（循环）
            shift++
            if (shift > k) {
                shift = 1
            }
        }
    }

    // 计算并输出每列的和
    for (j in 0..n) {
        var sum: Int64 = 0
        for (i in 0..n) {
            sum += matrix[Int64(i)][Int64(j)]
        }
        if (j > 0) {
            Console.stdOut.write(" ")
        }
        Console.stdOut.write(sum.toString())
    }
    println("")
}

