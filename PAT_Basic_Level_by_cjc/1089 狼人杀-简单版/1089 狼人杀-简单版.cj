// 1089 狼人杀-简单版
// 解题思路：N名玩家中有2个狼人，2个说谎者，其中1个狼人说谎、1个狼人说真话。
// 枚举所有狼人组合 (w1, w2)，检查是否满足上述条件，输出最小序列解。
import std.env.*
import std.convert.*

main() {
    // 读取玩家数量 N
    var N = Int64.parse(getStdIn().readln().getOrThrow())
    // 存储每个玩家的发言，正数表示"XX号是好人"，负数表示"XX号是狼人"
    var statements = Array<Int64>(N)
    for (i in 0..N) {
        var s = getStdIn().readln().getOrThrow()
        statements[i] = Int64.parse(s)
    }
    var found = false
    // 枚举所有狼人组合 (w1, w2)，编号从1到N
    for (w1 in 1..(N + 1)) {
        for (w2 in (w1 + 1)..(N + 1)) {
            var liar = 0      // 说谎者总数
            var wolfLiar = 0  // 狼人中说谎的人数
            // 遍历每个玩家 p 的发言
            for (p in 1..(N + 1)) {
                var stmt = statements[p - 1]
                // stmt < 0 表示"XX号是狼人"，> 0 表示"XX号是好人"
                var saidWolf = stmt < 0
                var targetId = if (saidWolf) -stmt else stmt  // 被指认的玩家编号
                var isWolf = (targetId == w1) || (targetId == w2)  // 被指认者是否为狼人
                // 玩家 p 说真话的条件：saidWolf 与 isWolf 一致
                var isLying = (saidWolf != isWolf)
                if (isLying) {
                    liar++
                    // 如果正在说谎的玩家 p 本身就是狼人
                    if (p == w1 || p == w2) {
                        wolfLiar++
                    }
                }
            }
            // 恰好2人说谎，且其中1个是狼人（即1个狼人说谎、1个狼人说真话）
            if (liar == 2 && wolfLiar == 1) {
                println("${w1} ${w2}")
                found = true
                break
            }
        }
        if (found) {
            break
        }
    }
    if (!found) {
        println("No Solution")
    }
}

