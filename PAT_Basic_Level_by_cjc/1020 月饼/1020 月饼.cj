// PAT Basic Level 1020 月饼
// 解题思路：贪心算法。每种月饼有库存量和总售价，市场需求为 D。
// 按单价从高到低排序，优先出售单价高的月饼以获取最大收益。
import std.env.*
import std.convert.*

// 月饼类：包含库存量、总售价和单价
class Mooncake {
    var inventory: Float64    // 库存量（万吨）
    var totalPrice: Float64   // 总售价（亿元）
    var unitPrice: Float64    // 单价（亿元/万吨）

    init(inv: Float64, price: Float64) {
        this.inventory = inv
        this.totalPrice = price
        this.unitPrice = price / inv  // 计算单价
    }
}

main(): Int64 {
    // 读取 N（月饼种类数）和 D（市场需求量）
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let N = Int64.parse(parts[0])
    let D = Int64.parse(parts[1])

    // 读取每种月饼的库存量和总售价
    let invLine = getStdIn().readln().getOrThrow()
    let invParts = invLine.split(" ")
    let priceLine = getStdIn().readln().getOrThrow()
    let priceParts = priceLine.split(" ")

    // 创建月饼数组
    var cakes = Array<Mooncake>(N)
    for (i in 0..N) {
        let inv = Float64.parse(invParts[i])
        let price = Float64.parse(priceParts[i])
        cakes[i] = Mooncake(inv, price)
    }

    // 冒泡排序：按单价从高到低排序
    for (i in 0..N) {
        for (j in i+1..N) {
            if (cakes[i].unitPrice < cakes[j].unitPrice) {
                let tmp = cakes[i]
                cakes[i] = cakes[j]
                cakes[j] = tmp
            }
        }
    }

    // 贪心策略：从单价最高的月饼开始，尽可能多地出售
    var demand = Float64(D)
    var profit: Float64 = 0.0
    for (i in 0..N) {
        if (demand <= 0.0) {
            break
        }
        if (cakes[i].inventory <= demand) {
            // 当前月饼全部售出
            profit += cakes[i].totalPrice
            demand -= cakes[i].inventory
        } else {
            // 只售出部分月饼以满足剩余需求
            profit += cakes[i].unitPrice * demand
            demand = 0.0
        }
    }

    // 输出最大收益，保留两位小数（四舍五入）
    let result = Int64(profit * 100.0 + 0.5)
    let intPart = result / 100
    let fracPart = result % 100
    if (fracPart < 10) {
        println("${intPart}.0${fracPart}")
    } else {
        println("${intPart}.${fracPart}")
    }
    return 0
}

