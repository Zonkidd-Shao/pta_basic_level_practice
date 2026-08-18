import std.env.*
import std.convert.*

// PAT_Basic_Level 1038 统计同成绩学生
// 解题思路：成绩范围为 0-100，使用长度为 101 的计数数组 counts，
// 遍历所有学生成绩进行频次统计，然后根据查询分数直接输出对应计数。
main(): Int64 {
    // 读取学生总人数 N
    let N = Int64.parse(getStdIn().readln().getOrThrow())

    // 读取 N 个学生的成绩
    let scoreLine = getStdIn().readln().getOrThrow()
    let scoreParts = scoreLine.split(" ")

    // 计数数组，下标 0-100 对应分数 0-100 分
    var counts = Array<Int64>(101, item: 0)
    for (i in 0..N) {
        let s = Int64.parse(scoreParts[i])
        counts[s]++  // 对应分数计数加 1
    }

    // 读取查询：第一个数是查询个数 K，后面是 K 个分数
    let queryLine = getStdIn().readln().getOrThrow()
    let queryParts = queryLine.split(" ")
    let K = Int64.parse(queryParts[0])

    // 依次输出每个查询分数的学生人数
    for (i in 0..K) {
        let target = Int64.parse(queryParts[i + 1])
        if (i > 0) {
            Console.stdOut.write(" ")  // 除第一个外，前面加空格分隔
        }
        Console.stdOut.write(counts[target].toString())
    }
    println("")
    return 0
}

