// PAT-Basic-1071 小赌怡情
// 解题思路：模拟每轮游戏过程。玩家用筹码下注，猜测下一个数字比当前大还是小。
// 猜对则赢回筹码，猜错则扣除筹码。筹码为 0 时游戏结束。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入初始筹码 tokens 和游戏轮数 K
    let first = getStdIn().readln().getOrThrow().split(" ")
    var tokens = Int64.parse(first[0])  // 当前筹码数
    let k = Int64.parse(first[1])       // 游戏轮数

    // 进行 K 轮游戏
    for (_ in 1..=k) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let n1 = Int64.parse(parts[0])  // 当前数字
        let b = Int64.parse(parts[1])   // 玩家猜测：0-小，1-大
        let t = Int64.parse(parts[2])   // 下注筹码数
        let n2 = Int64.parse(parts[3])  // 下一个数字

        // 筹码不足，无法下注
        if (t > tokens) {
            println("Not enough tokens.  Total = ${tokens}.")
            continue
        }

        // b=0 表示玩家猜 n2 < n1，b=1 表示玩家猜 n2 > n1
        let win = (b == 0 && n2 < n1) || (b == 1 && n2 > n1)

        if (win) {
            // 猜对了，赢得筹码
            tokens += t
            println("Win ${t}!  Total = ${tokens}.")
        } else {
            // 猜错了，扣除筹码
            tokens -= t
            println("Lose ${t}.  Total = ${tokens}.")
            // 筹码为 0，游戏结束
            if (tokens == 0) {
                println("Game Over.")
                return 0
            }
        }
    }
    return 0
}

