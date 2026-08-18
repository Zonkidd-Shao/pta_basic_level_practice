// PAT-Basic-1065 单身狗
// 解题思路：用 HashMap 建立夫妻/伴侣双向映射。对于每位客人，检查其伴侣是否也在场，
// 若伴侣不在场或该客人没有伴侣，则为落单客人。最后将落单客人按 ID 递增排序输出。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入夫妻/伴侣对数 N
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    // 建立双向映射：A->B, B->A
    let coupleMap = HashMap<Int64, Int64>()
    for (_ in 1..=n) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let a = Int64.parse(parts[0])
        let b = Int64.parse(parts[1])
        coupleMap.put(a, b)  // A 的伴侣是 B
        coupleMap.put(b, a)  // B 的伴侣是 A
    }

    // 读入参加派对的总人数 M 和所有客人的 ID
    let m = Int64.parse(getStdIn().readln().getOrThrow())
    let guestLine = getStdIn().readln().getOrThrow()
    let guestParts = guestLine.split(" ")
    var guests = Array<Int64>(m, item: 0)
    for (i in 0..m) {
        guests[i] = Int64.parse(guestParts[i])
    }

    // 将所有客人 ID 存入 HashSet 以便快速查找
    let guestSet = HashSet<Int64>()
    for (g in guests) {
        guestSet.put(g)
    }

    // 遍历每位客人，判断是否落单
    var singles = ArrayList<Int64>()
    for (g in guests) {
        let partner = coupleMap.get(g)  // 查找该客人的伴侣
        if (partner == nil) {
            // 没有伴侣，直接判定为落单
            singles.add(g)
        } else {
            let p = partner.getOrThrow()
            // 有伴侣但伴侣不在派对中，也判定为落单
            if (!guestSet.contains(p)) {
                singles.add(g)
            }
        }
    }

    // 将落单客人按 ID 递增排序并输出
    singles.sort()
    println(singles.size)
    for (i in 0..singles.size) {
        if (i > 0) {
            Console.stdOut.write(" ")
        }
        Console.stdOut.write(formatId(singles[i]))
    }
    if (singles.size > 0) {
        println("")
    }
    return 0
}

// 将 ID 格式化为 5 位数字，不足前面补 0
func formatId(id: Int64): String {
    var s = id.toString()
    while (s.size < 5) {
        s = "0" + s
    }
    return s
}

