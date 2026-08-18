// 1115 裁判机
// 解题思路：模拟数字游戏裁判逻辑。游戏者轮流给出正整数，要求必须为已出现某两个数之差，
// 且不能等于已出现的任何数。使用布尔数组记录已出现的数和已出现的差值，逐轮判断合法性。

import std.env.*
import std.convert.*

main() {
    // 读取裁判给出的两个初始正整数
    let firstLine = getStdIn().readln().getOrThrow()
    let initParts = firstLine.split(" ")
    let a = Int64.parse(initParts[0])
    let b = Int64.parse(initParts[1])

    // 读取人数N和轮次数M
    let secondLine = getStdIn().readln().getOrThrow()
    let nmParts = secondLine.split(" ")
    let N = Int64.parse(nmParts[0])
    let M = Int64.parse(nmParts[1])

    // 读取所有游戏者每轮给出的数字
    var playerNums = ArrayList<ArrayList<Int64>>()
    for (i in 0..N) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        var nums = ArrayList<Int64>()
        for (j in 0..M) {
            nums.append(Int64.parse(parts[Int64(j)]))
        }
        playerNums.append(nums)
    }

    let MAXV: Int64 = 100000
    var appeared = Array<Bool>(Int64(MAXV + 1), item: false)  // 标记某数是否已出现
    var diffs = Array<Bool>(Int64(MAXV + 1), item: false)     // 标记某差值是否已被产生
    var appearedList = ArrayList<Int64>()                     // 记录已出现的数字列表

    // 用两个初始数字初始化
    appeared[a] = true
    appeared[b] = true
    appearedList.append(a)
    appearedList.append(b)
    let initDiff = if (a > b) { a - b } else { b - a }  // 初始差值
    diffs[initDiff] = true

    var outPlayers = Array<Bool>(N, item: false)  // 标记每位玩家是否已出局

    // 逐轮逐人进行游戏
    for (round in 1..(M + 1)) {
        for (i in 0..N) {
            if (outPlayers[i]) {  // 已出局玩家跳过
                continue
            }
            let num = playerNums[i][round - 1]  // 当前玩家本轮给出的数字
            var valid = false
            // 合法性判断：数字在范围内、属于某两个已出现数字的差值、且未出现过
            if (num <= MAXV && diffs[num] && !appeared[num]) {
                valid = true
            }
            if (valid) {
                // 数字合法，计算该数字与所有已出现数字的新差值，加入差值集合
                for (y in appearedList) {
                    let newDiff = if (num > y) { num - y } else { y - num }
                    if (newDiff <= MAXV) {
                        diffs[newDiff] = true
                    }
                }
                appeared[num] = true
                appearedList.append(num)
            } else {
                // 数字不合法，该玩家出局
                println("Round #${round}: ${i + 1} is out.")
                outPlayers[i] = true
            }
        }
    }

    // 收集未出局的赢家
    var winners = ArrayList<Int64>()
    for (i in 0..N) {
        if (!outPlayers[i]) {
            winners.append(i + 1)
        }
    }

    // 输出结果
    if (winners.size == 0) {
        println("No winner.")
    } else {
        var outStr = "Winner(s):"
        for (i in 0..winners.size) {
            outStr += " ${winners[i]}"
        }
        println(outStr)
    }
}

