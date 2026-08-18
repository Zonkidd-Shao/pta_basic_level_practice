// 题目编号：1046 划拳
// 题目名称：划拳
// 解题思路：读取每轮划拳记录，判断甲乙两人划出的数字是否等于两人喊出的数字之和。
//           若一方赢一方输（不同时赢也不同时输），则输家需要喝一杯酒，累加双方的喝酒杯数。

import std.env.*
import std.convert.*

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())  // 划拳轮数
    
    var drinkA: Int64 = 0  // 甲喝的杯数
    var drinkB: Int64 = 0  // 乙喝的杯数
    
    // 逐轮处理划拳记录
    for (_ in 0..n) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let callA = Int64.parse(parts[0])  // 甲喊出的数字
        let showA = Int64.parse(parts[1])  // 甲划出的数字
        let callB = Int64.parse(parts[2])  // 乙喊出的数字
        let showB = Int64.parse(parts[3])  // 乙划出的数字
        
        let sum = callA + callB             // 两人喊出的数字之和
        let winA = (showA == sum)           // 甲是否赢了这一轮
        let winB = (showB == sum)           // 乙是否赢了这一轮
        
        // 一方赢一方输时，输家喝酒
        if (winA && !winB) {
            drinkB++  // 甲赢乙输，乙喝一杯
        } else if (winB && !winA) {
            drinkA++  // 乙赢甲输，甲喝一杯
        }
        // 两人同赢或同输则继续下一轮，无人喝酒
    }
    
    println("${drinkA} ${drinkB}")
}