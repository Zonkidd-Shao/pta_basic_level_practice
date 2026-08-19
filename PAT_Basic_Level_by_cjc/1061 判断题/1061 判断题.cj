import std.env.*
import std.convert.*

// PAT Basic Level 1061 判断题
// 解题思路：每道题有对应的分值和一个标准答案（0 或 1）
// 对于每个学生，逐题比对答案，正确则加上该题分值
// 输出每个学生的总分
main(): Int64 {
    // 读取学生人数 N 和题目数量 M
    let first = getStdIn().readln().getOrThrow().split(" ")
    let n = Int64.parse(first[0])
    let m = Int64.parse(first[1])

    // 读取每道题的分值
    let scoreLine = getStdIn().readln().getOrThrow().split(" ")
    let scores = Array<Int64>(m, item: 0)
    for (i in 0..m) {
        scores[i] = Int64.parse(scoreLine[i])
    }

    // 读取每道题的标准答案
    let answerLine = getStdIn().readln().getOrThrow().split(" ")
    let answers = Array<Int64>(m, item: 0)
    for (i in 0..m) {
        answers[i] = Int64.parse(answerLine[i])
    }

    // 逐行处理每个学生的答题情况
    for (_ in 1..=n) {
        let stuLine = getStdIn().readln().getOrThrow().split(" ")
        var total: Int64 = 0
        // 逐题判断是否正确
        for (i in 0..m) {
            if (Int64.parse(stuLine[i]) == answers[i]) {
                total += scores[i]  // 正确则累加分数
            }
        }
        println(total)
    }
    return 0
}

