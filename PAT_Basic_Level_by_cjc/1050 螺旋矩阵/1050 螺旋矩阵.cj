// 题目编号：1050 螺旋矩阵
// 题目名称：螺旋矩阵
// 解题思路：先将数组按非递增（降序）排序；找到满足 m×n=N 且 m≥n、m-n最小的m和n；
//           然后按顺时针螺旋方向（右→下→左→上）将排序后的元素依次填入矩阵，最后逐行输出。

import std.env.*
import std.convert.*
import std.sort.*

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    
    // 读取所有正整数
    var arr = Array<Int64>(n, repeat: 0)
    for (i in 0..n) {
        arr[i] = Int64.parse(parts[i])
    }
    
    // 降序排序（从大到小）
    for (i in 0..n) {
        for (j in i + 1..n) {
            if (arr[i] < arr[j]) {
                let tmp = arr[i]
                arr[i] = arr[j]
                arr[j] = tmp
            }
        }
    }
    
    // 寻找满足条件的 m（行数）和 nCol（列数），使得 m>=nCol 且 m-nCol 最小
    var m: Int64 = n
    var nCol: Int64 = 1
    for (i in 1..n) {
        if (n % i == 0) {
            let j = n / i
            if (j >= i && (j - i) < (m - nCol)) {
                m = j
                nCol = i
            }
        }
    }
    
    // 创建 m×n 的矩阵
    var matrix = Array<Array<Int64>>(m, repeat: Array<Int64>(nCol, repeat: 0))
    for (i in 0..m) {
        matrix[i] = Array<Int64>(nCol, repeat: 0)
    }
    
    // 螺旋填充的四个边界
    var top: Int64 = 0
    var bottom = m - 1
    var left: Int64 = 0
    var right = nCol - 1
    var idx: Int64 = 0  // 当前填充的数组下标
    
    // 按顺时针螺旋方向填充矩阵
    while (top <= bottom && left <= right) {
        // 1. 从左到右填充上边行
        var j = left
        while (j <= right) {
            if (idx < n) { matrix[top][j] = arr[idx]; idx++ }
            j++
        }
        top++
        
        // 2. 从上到下填充右边列
        var i = top
        while (i <= bottom) {
            if (idx < n) { matrix[i][right] = arr[idx]; idx++ }
            i++
        }
        right--
        
        // 3. 从右到左填充下边行（需确保上边界未超过下边界）
        if (top <= bottom) {
            j = right
            while (j >= left) {
                if (idx < n) { matrix[bottom][j] = arr[idx]; idx++ }
                j--
            }
            bottom--
        }
        
        // 4. 从下到上填充左边列（需确保左边界未超过右边界）
        if (left <= right) {
            i = bottom
            while (i >= top) {
                if (idx < n) { matrix[i][left] = arr[idx]; idx++ }
                i--
            }
            left++
        }
    }
    
    // 逐行输出矩阵
    for (i in 0..m) {
        var sb = ""
        for (j in 0..nCol) {
            if (j > 0) { sb += " " }
            sb += matrix[i][j].toString()
        }
        println(sb)
    }
}
