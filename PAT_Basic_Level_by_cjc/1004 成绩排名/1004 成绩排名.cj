import std.env.*
import std.convert.*

// 1004 成绩排名
// 解题思路：读入 n 个学生的姓名、学号、成绩，
// 遍历所有学生，找出最高分和最低分对应的姓名和学号，分别输出。
main(): Int64 {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 读取学生人数
    var maxScore: Int64 = -1   // 最高分，初始化为 -1（成绩 >= 0）
    var minScore: Int64 = 101  // 最低分，初始化为 101（成绩 <= 100）
    var maxName = ""           // 最高分学生的姓名
    var maxId = ""             // 最高分学生的学号
    var minName = ""           // 最低分学生的姓名
    var minId = ""             // 最低分学生的学号
    for (_ in 1..=n) {
        let line = getStdIn().readln().getOrThrow()  // 读取一行：姓名 学号 成绩
        let parts = line.split(" ")
        let name = parts[0]
        let id = parts[1]
        let score = Int64.parse(parts[2])
        if (score > maxScore) {  // 更新最高分及其对应的姓名和学号
            maxScore = score
            maxName = name
            maxId = id
        }
        if (score < minScore) {  // 更新最低分及其对应的姓名和学号
            minScore = score
            minName = name
            minId = id
        }
    }
    println("${maxName} ${maxId}")  // 输出最高分学生的姓名和学号
    println("${minName} ${minId}")  // 输出最低分学生的姓名和学号
    return 0
}

