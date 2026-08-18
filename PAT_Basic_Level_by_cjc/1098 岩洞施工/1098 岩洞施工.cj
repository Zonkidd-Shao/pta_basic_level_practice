// 1098 岩洞施工
// 解题思路：岩洞的截面由宽度为 N 的上方岩壁线和下方岩壁线构成。
// 找出上方岩壁的最低点（最小高度）和下方岩壁的最高点（最大高度），
// 若上壁最低点 > 下壁最高点，则可以安全施工（Yes），间距为差值；
// 否则需要削去重叠部分（No），削去深度为重叠量+1。
import std.env.*
import std.convert.*

main() {
    // 读取岩洞宽度 N
    var N = Int64.parse(getStdIn().readln().getOrThrow())

    // 读取上方岩壁各点高度
    var topLine = getStdIn().readln().getOrThrow()
    var topParts = topLine.split(" ")
    // 读取下方岩壁各点高度
    var bottomLine = getStdIn().readln().getOrThrow()
    var bottomParts = bottomLine.split(" ")

    // 初始化：上方最低点（取大值）、下方最高点（取小值）
    var minTop: Int64 = 1001
    var maxBottom: Int64 = -1

    // 遍历所有列，找出上方最低点和下方最高点
    for (i in 0..N) {
        var t = Int64.parse(topParts[Int64(i)])
        var b = Int64.parse(bottomParts[Int64(i)])
        if (t < minTop) {
            minTop = t
        }
        if (b > maxBottom) {
            maxBottom = b
        }
    }

    // 如果上壁最低点 > 下壁最高点，则有安全间隙
    if (minTop > maxBottom) {
        println("Yes ${minTop - maxBottom}")
    } else {
        // 否则需要削去重叠部分
        println("No ${maxBottom - minTop + 1}")
    }
}

