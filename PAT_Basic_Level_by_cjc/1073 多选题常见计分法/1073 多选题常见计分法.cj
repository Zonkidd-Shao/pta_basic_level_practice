// PAT-Basic-1073 多选题常见计分法
// 解题思路：
// 1. 读入题目信息，用 Question 类存储每道题的满分、选项数和正确选项（位掩码表示）
// 2. 对每个学生的答题进行评分：
//   - 选择了错误选项得 0 分
//   - 仅漏选正确选项得 50% 分
//   - 全对得满分
// 3. 统计每道题每个选项的出错次数，输出错得最多的选项信息
import std.env.*
import std.convert.*

// 题目类，存储满分、选项数、正确选项数和正确选项位掩码
class Question {
    var fullScore: Float64    // 满分
    var optionCount: Int64    // 选项个数
    var correctCount: Int64   // 正确选项个数
    var correctMask: Int64    // 正确选项的位掩码

    init(fullScore: Float64, optionCount: Int64, correctCount: Int64, correctMask: Int64) {
        this.fullScore = fullScore
        this.optionCount = optionCount
        this.correctCount = correctCount
        this.correctMask = correctMask
    }
}

// 将选项字母转换为位位置（0-indexed）：'a' -> 0, 'b' -> 1, ...
func optionToBit(opt: Char): Int64 {
    return opt - 'a'
}

// 解析学生答案字符串，如 "(2 a c)"，返回 (位掩码, 选项个数)
func parseAnswer(s: String): (Int64, Int64) {
    var mask: Int64 = 0
    let parts = s.split(" ")
    let cnt = Int64.parse(parts[0])  // 选中的选项个数
    for (i in 1..parts.size) {
        let opt = parts[i][0]
        mask |= (1 << optionToBit(opt))  // 将对应选项位置 1
    }
    return (mask, cnt)
}

main(): Int64 {
    // 读入学生人数 N 和题目数量 M
    let first = getStdIn().readln().getOrThrow().split(" ")
    let n = Int64.parse(first[0])
    let m = Int64.parse(first[1])

    // 读取每道题目的信息
    var questions = Array<Question>(m, item: Question(0.0, 0, 0, 0))
    for (i in 0..m) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let fullScore = Float64.parse(parts[0])  // 满分
        let optCount = Int64.parse(parts[1])     // 选项个数
        let corrCount = Int64.parse(parts[2])    // 正确选项个数
        var mask: Int64 = 0
        // 构建正确选项的位掩码
        for (j in 0..corrCount) {
            let opt = parts[3 + j][0]
            mask |= (1 << optionToBit(opt))
        }
        questions[i] = Question(fullScore, optCount, corrCount, mask)
    }

    // wrongCount[qi][opt] 记录第 qi 题第 opt 个选项的出错次数
    var wrongCount = Array<Array<Int64>>(m, item: Array<Int64>(5, item: 0))
    var maxWrong: Int64 = 0  // 记录最大出错次数

    // 逐位学生处理答题情况
    for (_ in 1..=n) {
        let line = getStdIn().readln().getOrThrow()
        var score: Float64 = 0.0

        // 解析学生答案 - 格式如 "(2 a c) (3 b d e) ..."
        var ansStart: Int64 = 0
        for (qi in 0..m) {
            // 找到下一个 '(' 的位置
            while (ansStart < line.size && line[ansStart] != '(') {
                ansStart += 1
            }
            // 找到对应的 ')' 的位置
            var ansEnd = ansStart + 1
            while (ansEnd < line.size && line[ansEnd] != ')') {
                ansEnd += 1
            }
            // 提取括号内的答案字符串
            let ansStr = line[ansStart + 1..ansEnd]
            ansStart = ansEnd + 1

            // 解析学生答案的位掩码和选项个数
            let (stuMask, stuCount) = parseAnswer(ansStr)
            let corrMask = questions[qi].correctMask
            let fullScore = questions[qi].fullScore

            // 计算学生选错了哪些选项（选了不该选的）
            let wrongSelected = stuMask & (~corrMask)
            // 计算学生漏选了哪些正确选项（该选没选的）
            let missedCorrect = corrMask & (~stuMask)

            if (wrongSelected != 0) {
                // 选择了错误选项，本题得 0 分
                // 错误选项和遗漏的正确选项都算作错误
                for (opt in 0..5) {
                    if ((wrongSelected & (1 << opt)) != 0 || (missedCorrect & (1 << opt)) != 0) {
                        wrongCount[qi][opt] += 1
                        if (wrongCount[qi][opt] > maxWrong) {
                            maxWrong = wrongCount[qi][opt]
                        }
                    }
                }
            } else if (missedCorrect != 0) {
                // 仅漏选正确选项，没有选错，得 50% 分数
                score += fullScore / 2.0
                // 漏选的正确选项记一次错误
                for (opt in 0..5) {
                    if ((missedCorrect & (1 << opt)) != 0) {
                        wrongCount[qi][opt] += 1
                        if (wrongCount[qi][opt] > maxWrong) {
                            maxWrong = wrongCount[qi][opt]
                        }
                    }
                }
            } else {
                // 完全正确，得满分
                score += fullScore
            }
        }
        // 输出学生得分，保留 1 位小数
        let scoreStr = score.toString()
        let dotIdx = scoreStr.find(".")
        if (dotIdx != nil) {
            let idx = dotIdx.getOrThrow()
            if (idx + 2 < scoreStr.size) {
                println(scoreStr[0..=idx + 1])
            } else {
                println(scoreStr + "0")
            }
        } else {
            println("${scoreStr}.0")
        }
    }

    // 输出错得最多的题目选项信息
    if (maxWrong == 0) {
        println("Too simple")  // 没有题目出错
    } else {
        // 按题目编号递增、选项号递增输出所有达到最大出错次数的选项
        for (qi in 0..m) {
            for (opt in 0..5) {
                if (wrongCount[qi][opt] == maxWrong) {
                    let optChar = ('a' + opt) as Char
                    println("${maxWrong} ${qi + 1}-${optChar}")
                }
            }
        }
    }
    return 0
}

