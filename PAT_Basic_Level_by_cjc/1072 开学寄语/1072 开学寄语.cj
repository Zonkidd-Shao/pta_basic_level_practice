// PAT-Basic-1072 开学寄语
// 解题思路：将违禁物品编号存入 HashSet，然后检查每位学生的随身物品，
// 若发现违禁物品则记录并输出该学生信息，最后统计问题学生和问题物品总数。
import std.env.*
import std.convert.*
import std.collection.*

main(): Int64 {
    // 读入学生人数 N 和违禁物品种类数 M
    let first = getStdIn().readln().getOrThrow().split(" ")
    let n = Int64.parse(first[0])
    let m = Int64.parse(first[1])

    // 读取 M 个违禁物品编号，存入 HashSet 以便快速查找
    let bannedLine = getStdIn().readln().getOrThrow().split(" ")
    let bannedSet = HashSet<String>()
    for (i in 0..m) {
        bannedSet.add(bannedLine[i])
    }

    // 统计问题学生人数和问题物品总件数
    var problemStudents: Int64 = 0
    var problemItems: Int64 = 0

    // 逐位学生检查
    for (_ in 1..=n) {
        let parts = getStdIn().readln().getOrThrow().split(" ")
        let name = parts[0]      // 学生姓名
        let k = Int64.parse(parts[1])  // 随身物品数量
        var foundItems = ArrayList<String>()  // 记录该学生携带的违禁物品
        // 检查每件物品是否为违禁品
        for (i in 0..k) {
            let item = parts[2 + i]
            if (bannedSet.contains(item)) {
                foundItems.add(item)
            }
        }
        // 如果该学生携带违禁物品，输出信息并更新统计
        if (foundItems.size > 0) {
            problemStudents += 1
            problemItems += foundItems.size
            print("${name}:")
            for (it in foundItems) {
                print(" ${it}")
            }
            println("")
        }
    }
    // 输出问题学生人数和问题物品总件数
    println("${problemStudents} ${problemItems}")
    return 0
}

