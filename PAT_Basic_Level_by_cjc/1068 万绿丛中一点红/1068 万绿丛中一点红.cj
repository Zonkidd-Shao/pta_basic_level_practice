// PAT-Basic-1068 万绿丛中一点红
// 解题思路：先统计每个颜色值出现的次数，然后遍历每个像素点，
// 筛选出颜色值唯一且与周围 8 个相邻像素的色差均大于阈值 TOL 的候选点。
// 根据候选点数量输出相应结果。
import std.env.*
import std.convert.*
import std.math.*
import std.collection.*

main(): Int64 {
    // 读入第一行：M(列数), N(行数), TOL(色差阈值)
    let first = getStdIn().readln().getOrThrow().split(" ")
    let m = Int64.parse(first[0])
    let n = Int64.parse(first[1])
    let tol = Int64.parse(first[2])

    // 存储图像每个像素的颜色值，注意行数为 N，列数为 M
    let image = Array<Array<Int64>>(n, repeat: Array<Int64>(m, repeat: 0))
    for (i in 0..n) {
        image[i] = Array<Int64>(m, repeat: 0)
    }
    // 统计每个颜色值出现的次数，用于判断是否"独一无二"
    let colorCount = HashMap<Int64, Int64>()

    for (i in 0..n) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.replace("\t", " ").split(" ")
        var token: Int64 = 0
        for (j in 0..m) {
            while (token < parts.size && parts[token] == "") { token++ }
            let val = Int64.parse(parts[token])
            token++
            image[i][j] = val
            let cnt = colorCount.get(val)
            if (cnt.isNone()) {
                colorCount[val] = 1
            } else {
                colorCount[val] = cnt.getOrThrow() + 1
            }
        }
    }

    // 存储候选像素 (列坐标x, 行坐标y, 颜色值)
    var candidates = ArrayList<(Int64, Int64, Int64)>()
    // 8 个方向的偏移量：左上、上、右上、左、右、左下、下、右下
    let dirs = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]

    // 遍历每个像素，检查是否符合条件
    for (i in 0..n) {
        for (j in 0..m) {
            let color = image[i][j]
            // 条件1：颜色值必须独一无二（在整个图像中只出现一次）
            let cnt = colorCount.get(color)
            if (cnt.isSome() && cnt.getOrThrow() > 1) {
                continue
            }
            // 条件2：与周围 8 个相邻像素的色差均大于阈值 TOL
            var unique = true
            for (d in dirs) {
                let ni = i + d[0]  // 相邻像素的行坐标
                let nj = j + d[1]  // 相邻像素的列坐标
                // 只检查在图像范围内的相邻像素
                if (ni >= 0 && ni < n && nj >= 0 && nj < m) {
                    var diff = color - image[ni][nj]
                    if (diff < 0) { diff = -diff }  // 取绝对值
                    if (diff <= tol) {               // 色差不大于阈值，不符合条件
                        unique = false
                        break
                    }
                }
            }
            if (unique) {
                // 存储坐标时转换为从 1 开始计数
                candidates.add((j + 1, i + 1, color))
            }
        }
    }

    // 根据候选点数量输出结果
    if (candidates.size == 0) {
        println("Not Exist")          // 没有符合条件的点
    } else if (candidates.size > 1) {
        println("Not Unique")         // 有多个符合条件的点
    } else {
        let (x, y, color) = candidates[0]
        println("(${x}, ${y}): ${color}")  // 唯一符合条件，输出坐标和颜色值
    }
    return 0
}

