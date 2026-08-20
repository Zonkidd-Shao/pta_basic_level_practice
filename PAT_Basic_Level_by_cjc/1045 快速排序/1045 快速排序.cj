// 题目编号：1045 快速排序
// 题目名称：快速排序
// 解题思路：主元定义为其左边的所有元素都比它小，右边的所有元素都比它大。
//           预先计算 leftMax[i]（arr[0~i-1]的最大值）和 rightMin[i]（arr[i+1~n-1]的最小值），
//           然后遍历判断 arr[i] > leftMax[i] && arr[i] < rightMin[i] 即为主元。

import std.env.*
import std.convert.*

main() {
    let n = Int64.parse(getStdIn().readln().getOrThrow())
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    
    // 读取正整数序列
    var arr = Array<Int64>(n, repeat: 0)
    for (i in 0..n) {
        arr[i] = Int64.parse(parts[i])
    }
    
    // leftMax[i] = arr[0..i-1] 中的最大值
    var leftMax = Array<Int64>(n, repeat: 0)
    leftMax[0] = 0  // 第一个元素左边无元素，设最小值为0
    for (i in 1..n) {
        leftMax[i] = max(leftMax[i-1], arr[i-1])
    }
    
    // rightMin[i] = arr[i+1..n-1] 中的最小值
    var rightMin = Array<Int64>(n, repeat: 0)
    rightMin[n-1] = 1000000001  // 最后一个元素右边无元素，设一个很大的数
    var i = n - 2
    while (i >= 0) {
        rightMin[i] = min(rightMin[i+1], arr[i+1])
        i--
    }
    
    var result = Array<Int64>(n, repeat: 0)  // 存储所有主元
    var cnt: Int64 = 0                       // 主元个数
    
    // 判断每个元素是否可能为主元
    for (i in 0..n) {
        if (arr[i] > leftMax[i] && arr[i] < rightMin[i]) {
            result[cnt] = arr[i]
            cnt++
        }
    }
    
    println(cnt)  // 输出主元个数
    // 按递增顺序输出所有主元
    if (cnt > 0) {
        var sb = ""
        for (i in 0..cnt) {
            if (i > 0) { sb += " " }
            sb += result[i].toString()
        }
        println(sb)
    } else {
        println("")  // 没有主元时输出空行
    }
}
