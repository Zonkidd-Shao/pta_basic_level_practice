// 题目编号：1047 编程团体赛
// 题目名称：编程团体赛
// 解题思路：使用数组以队伍编号为索引累加每个队伍的总成绩。
//           遍历数组找出总成绩最高的队伍编号及其总成绩，输出结果。

import std.env.*
import std.convert.*

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 参赛队员总数
    
    // 队伍编号范围1~1000，用数组存储各队总成绩
    var scores = Array<Int64>(1001, repeat: 0)
    
    // 读取每个队员的成绩，累加到对应队伍
    for (_ in 0..n) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let teamPlayer = parts[0].split("-")  // 格式：队伍编号-队员编号
        let team = Int64.parse(teamPlayer[0])  // 队伍编号
        let score = Int64.parse(parts[1])      // 成绩
        scores[team] += score                  // 累加到队伍总成绩
    }
    
    var maxScore: Int64 = 0  // 最高总成绩
    var maxTeam: Int64 = 0   // 冠军队编号
    
    // 遍历所有队伍，找出总成绩最高的队伍
    for (i in 1..1001) {
        if (scores[i] > maxScore) {
            maxScore = scores[i]
            maxTeam = i
        }
    }
    
    println("${maxTeam} ${maxScore}")
}
