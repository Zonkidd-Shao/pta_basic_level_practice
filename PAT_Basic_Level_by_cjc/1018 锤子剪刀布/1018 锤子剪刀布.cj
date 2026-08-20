// PAT Basic Level 1018 锤子剪刀布
// 解题思路：统计两人猜拳的胜负情况，记录各自获胜次数、平局次数和失败次数，
// 同时记录各自获胜时出的手势，最后输出胜率最高的手势。
import std.env.*
import std.convert.*

// 判断手势 a 是否战胜手势 b（C=锤子, J=剪刀, B=布）
func winGesture(a: String, b: String): Bool {
    return (a == "C" && b == "J") || (a == "J" && b == "B") || (a == "B" && b == "C")
}

// 从获胜次数数组中找出获胜最多的手势，按 B < C < J 优先级（次数相同时取字母序小的）
func bestGesture(wins: Array<Int64>): String {
    // wins[0] = B wins, wins[1] = C wins, wins[2] = J wins
    let gestures = ["B", "C", "J"]
    var bestIdx: Int64 = 0
    for (i in 1..3) {
        if (wins[i] > wins[bestIdx]) {
            bestIdx = i
        }
    }
    return gestures[bestIdx]
}

main(): Int64 {
    // 读取总交锋次数
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    var win1: Int64 = 0    // 甲获胜次数
    var tie1: Int64 = 0    // 甲平局次数
    var lose1: Int64 = 0   // 甲失败次数
    var win2: Int64 = 0    // 乙获胜次数
    var tie2: Int64 = 0    // 乙平局次数
    var lose2: Int64 = 0   // 乙失败次数
    // wins[0]=B, wins[1]=C, wins[2]=J 分别记录各自用不同手势获胜的次数
    var wins1 = Array<Int64>(3, repeat: 0)
    var wins2 = Array<Int64>(3, repeat: 0)
    // 逐行读取每轮出拳记录并统计
    for (_ in 1..=n) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let g1 = parts[0]
        let g2 = parts[1]
        if (winGesture(g1, g2)) {
            // 甲赢
            win1 = win1 + 1
            lose2 = lose2 + 1
            if (g1 == "B") { wins1[0] = wins1[0] + 1 }
            else if (g1 == "C") { wins1[1] = wins1[1] + 1 }
            else { wins1[2] = wins1[2] + 1 }
        } else if (winGesture(g2, g1)) {
            // 乙赢
            win2 = win2 + 1
            lose1 = lose1 + 1
            if (g2 == "B") { wins2[0] = wins2[0] + 1 }
            else if (g2 == "C") { wins2[1] = wins2[1] + 1 }
            else { wins2[2] = wins2[2] + 1 }
        } else {
            // 平局
            tie1 = tie1 + 1
            tie2 = tie2 + 1
        }
    }
    // 输出甲乙的胜负平统计
    println("${win1} ${tie1} ${lose1}")
    println("${win2} ${tie2} ${lose2}")
    // 输出甲乙获胜次数最多的手势
    println("${bestGesture(wins1)} ${bestGesture(wins2)}")
    return 0
}

