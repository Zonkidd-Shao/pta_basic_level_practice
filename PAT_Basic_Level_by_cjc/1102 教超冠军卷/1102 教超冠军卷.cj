// 题目编号：1102  教超冠军卷
// 解题思路：
//   给定 N 件商品的编号、单价和销量，分别找出：
//   1. 销量冠军（销量最高的商品）
//   2. 销售额冠军（单价×销量最高的商品）
//   遍历所有商品，实时更新最大值即可。

import std.env.*
import std.convert.*

main() {
    // 读取商品数量 N
    let n = Int64.parse(getStdIn().readln().getOrThrow())

    // 记录销量冠军信息
    var maxSalesId = ""
    var maxSales: Int64 = -1
    // 记录销售额冠军信息
    var maxRevenueId = ""
    var maxRevenue: Int64 = -1

    for (_ in 0..n) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let id = parts[0]                      // 商品编号
        let price = Int64.parse(parts[1])      // 单价
        let qty = Int64.parse(parts[2])        // 销量

        // 更新销量冠军
        if (qty > maxSales) {
            maxSales = qty
            maxSalesId = id
        }

        let rev = price * qty                  // 计算销售额
        // 更新销售额冠军
        if (rev > maxRevenue) {
            maxRevenue = rev
            maxRevenueId = id
        }
    }

    // 输出结果
    println("${maxSalesId} ${maxSales}")
    println("${maxRevenueId} ${maxRevenue}")
}

