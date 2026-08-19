import std.env.*
import std.convert.*

// PAT Basic Level 1058 选择题
// 解题思路：读入题目信息（满分、选项数、正确选项数、正确选项）
// 然后逐行解析每个学生的答题情况，比较答案是否正确
// 统计每题错误次数，输出每个学生得分以及错误最多的题号
class Question {
    var fullScore: Int64     // 题目满分
    var optCount: Int64      // 选项个数
    var correctCnt: Int64    // 正确选项个数
    var correctOpts: String  // 正确选项字符串，如 "ac"
    
    init(fullScore: Int64, optCount: Int64, correctCnt: Int64, correctOpts: String) {
        this.fullScore = fullScore
        this.optCount = optCount
        this.correctCnt = correctCnt
        this.correctOpts = correctOpts
    }
}

main() {
    // 读取学生人数 N 和题目数量 M
    let firstLine = getStdIn().readln().getOrThrow()
    let parts = firstLine.split(" ")
    let n = Int64.parse(parts[0])  // 学生数
    let m = Int64.parse(parts[1])  // 题目数
    
    var questions = Array<Question>(m, item: Question(0, 0, 0, ""))
    
    // 读取每道题的信息
    for (i in 0..m) {
        let line = getStdIn().readln().getOrThrow()
        let qParts = line.split(" ")
        let fullScore = Int64.parse(qParts[0])   // 满分
        let optCount = Int64.parse(qParts[1])    // 选项个数
        let correctCnt = Int64.parse(qParts[2])  // 正确选项个数
        var correctOpts = ""
        for (j in 0..correctCnt) {
            correctOpts += qParts[3 + j]  // 拼接正确选项字母
        }
        questions[i] = Question(fullScore, optCount, correctCnt, correctOpts)
    }
    
    var studentScores = Array<Int64>(n, item: 0)  // 每个学生的总分
    var wrongCount = Array<Int64>(m, item: 0)     // 每道题的错误次数
    
    // 逐行处理每个学生的答题
    for (si in 0..n) {
        let line = getStdIn().readln().getOrThrow()
        // 学生答案格式示例：(2 a c) (2 b d) ...
        var qi: Int64 = 0
        var score: Int64 = 0
        var pos: Int64 = 0
        let len = line.size
        
        while (qi < m && pos < len) {
            // 跳过空格
            while (pos < len && line[pos] == ' ') { pos++ }
            if (pos >= len) { break }
            
            // 期望遇到 '(' 开始解析一个答案
            if (line[pos] != '(') { pos++; continue }
            pos++  // 跳过 '('
            
            // 读取选项个数（数字）
            var cntStr = ""
            while (pos < len && line[pos] >= '0' && line[pos] <= '9') {
                cntStr += line[pos].toString()
                pos++
            }
            let cnt = Int64.parse(cntStr)
            
            // 读取学生的选项字母
            var studentOpts = ""
            for (_ in 0..cnt) {
                while (pos < len && line[pos] == ' ') { pos++ }
                if (pos < len) {
                    studentOpts += line[pos].toString()
                    pos++
                }
            }
            
            // 跳过直到 ')' 结束
            while (pos < len && line[pos] != ')') { pos++ }
            if (pos < len) { pos++ }  // 跳过 ')'
            
            // 比较学生答案与标准答案是否一致
            if (studentOpts == questions[qi].correctOpts) {
                score += questions[qi].fullScore  // 正确则加分
            } else {
                wrongCount[qi]++  // 错误则记录该题错误次数
            }
            
            qi++
        }
        
        studentScores[si] = score
    }
    
    // 输出每个学生的得分
    for (i in 0..n) {
        println(studentScores[i])
    }
    
    // 找出题目的最大错误次数
    var maxWrong: Int64 = 0
    for (i in 0..m) {
        if (wrongCount[i] > maxWrong) {
            maxWrong = wrongCount[i]
        }
    }
    
    // 若最大错误次数为 0，输出 "Too simple"
    if (maxWrong == 0) {
        println("Too simple")
    } else {
        // 输出最大错误次数和对应的题号（1-based）
        var sb = ""
        sb += maxWrong.toString()
        for (i in 0..m) {
            if (wrongCount[i] == maxWrong) {
                sb += " ${i + 1}"
            }
        }
        println(sb)
    }
}

