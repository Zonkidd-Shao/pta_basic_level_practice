// 1090 危险品装箱
// 解题思路：构建不相容物品的映射关系（双向图），对每个装箱清单，
// 检查清单中是否存在互为不相容的物品对，若存在则输出"No"，否则"Yes"。
import std.env.*
import std.convert.*
import std.collection.*

main() {
    // 读取不相容物品对数 N 和装箱清单数 M
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var N = Int64.parse(parts[0])
    var M = Int64.parse(parts[1])

    // 构建不相容映射表，key为物品，value为与该物品不相容的所有物品列表
    var incompatible = HashMap<String, ArrayList<String>>()
    for (_ in 0..N) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        var a = parts[0]
        var b = parts[1]
        // 双向添加不相容关系
        if (!incompatible.contains(a)) {
            incompatible[a] = ArrayList<String>()
        }
        if (!incompatible.contains(b)) {
            incompatible[b] = ArrayList<String>()
        }
        incompatible[a].add(b)
        incompatible[b].add(a)
    }

    // 处理每个装箱清单
    for (_ in 0..M) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        var K = Int64.parse(parts[0])
        // 将当前清单中的物品存入 HashSet 便于快速查找
        var items = HashSet<String>()
        for (i in 1..(K + 1)) {
            items.add(parts[Int64(i)])
        }
        var safe = true
        // 遍历清单中的每个物品，检查其不相容物品是否也在清单中
        for (item in items) {
            if (incompatible.contains(item)) {
                for (other in incompatible[item]) {
                    if (items.contains(other)) {
                        safe = false
                        break
                    }
                }
            }
            if (!safe) {
                break
            }
        }
        // 输出检查结果
        if (safe) {
            println("Yes")
        } else {
            println("No")
        }
    }
}

