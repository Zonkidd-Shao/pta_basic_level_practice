import std.env.*
import std.convert.*

// PAT_Basic_Level 1032 挖掘机技术哪家强
// 解题思路：用数组 scores 累加每个学校的总分（学校编号从1开始连续），
// 遍历数组找出总分最高的学校编号及其总分。
main(): Int64 {
    // 读取参赛人数 N
    let N = Int64.parse(getStdIn().readln().getOrThrow())

    // 学校编号从 1 开始连续，假设最大编号不超过 N
    var scores = Array<Int64>(N + 1, item: 0)

    // 逐行读取每个参赛者的学校编号和成绩，累加到对应学校
    for (_ in 0..N) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let schoolId = Int64.parse(parts[0])
        let score = Int64.parse(parts[1])
        scores[schoolId] += score  // 累加该校总分
    }

    // 遍历所有学校，找出总分最高的学校
    var maxScore: Int64 = -1
    var bestSchool: Int64 = 0
    for (i in 1..=N) {
        if (scores[i] > maxScore) {
            maxScore = scores[i]
            bestSchool = i
        }
    }

    // 输出总分最高的学校编号和总分
    println("${bestSchool} ${maxScore}")
    return 0
}

