import std.env.*
import std.convert.*

// PAT Basic Level 1059 C语言竞赛
// 解题思路：为每个参赛选手记录排名（从 1 开始），需要查询时按以下规则发奖：
//   - 排名第 1：Mystery Award（神秘大奖）
//   - 排名为素数：Minion（小黄人）
//   - 其他排名：Chocolate（巧克力）
//   - 已查过的显示 Checked，不存在的 ID 显示 Are you kidding?
// 判断一个数是否为素数
func isPrime(x: Int64): Bool {
    if (x < 2) { return false }
    if (x == 2) { return true }
    if (x % 2 == 0) { return false }
    var i: Int64 = 3
    while (i * i <= x) {
        if (x % i == 0) { return false }
        i += 2  // 只检查奇数因子
    }
    return true
}

main(): Int64 {
    // 读取参赛人数 N
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    // 用哈希表存储每个 ID 对应的排名
    let rankMap = HashMap<String, Int64>()
    for (i in 1..=n) {
        let id = getStdIn().readln().getOrThrow()
        rankMap.put(id, i)
    }
    // 用哈希集合记录已查询过的 ID
    let checked = HashSet<String>()
    // 读取要查询的人数 K
    let k = Int64.parse(getStdIn().readln().getOrThrow())
    for (_ in 1..=k) {
        let id = getStdIn().readln().getOrThrow()
        let prize = rankMap.get(id)  // 在排名表中查找该 ID
        if (prize == nil) {
            // ID 不存在
            println("${id}: Are you kidding?")
        } else if (checked.contains(id)) {
            // ID 已被查询过
            println("${id}: Checked")
        } else {
            checked.put(id)  // 标记为已查询
            let r = prize.getOrThrow()
            if (r == 1) {
                println("${id}: Mystery Award")       // 第 1 名：神秘大奖
            } else if (isPrime(r)) {
                println("${id}: Minion")              // 素数排名：小黄人
            } else {
                println("${id}: Chocolate")           // 其他：巧克力
            }
        }
    }
    return 0
}

