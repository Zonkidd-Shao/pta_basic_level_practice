// PAT-Basic-1069 微博转发抽奖
// 解题思路：从第 s 位用户开始，每隔 n-1 人（即步长为 n）抽一个中奖者，
// 若该用户已中奖则顺延到下一位。使用 HashSet 记录已中奖者以防重复。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入第一行：M(转发总量), N(间隔数), S(起始序号)
    let first = getStdIn().readln().getOrThrow().split(" ")
    let m = Int64.parse(first[0])  // 转发总人数
    let n = Int64.parse(first[1])  // 中奖间隔
    let s = Int64.parse(first[2])  // 第一个中奖者的序号

    // 读取所有用户的昵称
    var nicknames = Array<String>(m, item: "")
    for (i in 0..m) {
        nicknames[i] = getStdIn().readln().getOrThrow()
    }

    // 记录已中奖的用户，防止重复中奖
    let winnerSet = HashSet<String>()
    var winners = ArrayList<String>()
    // 从第 s 位开始（索引从 0 开始，所以减 1）
    var idx = s - 1

    while (idx < m) {
        // 如果该用户已中奖，则顺延到下一个
        if (winnerSet.contains(nicknames[idx])) {
            idx += 1
            continue
        }
        // 该用户中奖，记录并加入集合
        winnerSet.put(nicknames[idx])
        winners.add(nicknames[idx])
        // 跳过 n 个用户（因为每 n 人中奖一次）
        idx += n
    }

    // 输出结果
    if (winners.size == 0) {
        println("Keep going...")
    } else {
        for (w in winners) {
            println(w)
        }
    }
    return 0
}

