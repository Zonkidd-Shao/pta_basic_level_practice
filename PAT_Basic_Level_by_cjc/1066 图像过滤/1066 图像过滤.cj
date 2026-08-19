// PAT-Basic-1066 图像过滤
// 解题思路：遍历图像的每个像素，若像素值在指定区间 [a, b] 内，
// 则替换为指定值 replaceVal，否则保持不变。所有输出值按 3 位格式补齐。
import std.env.*
import std.convert.*

main(): Int64 {
    // 读入第一行：M(行数), N(列数), a(区间下界), b(区间上界), replaceVal(替换值)
    let first = getStdIn().readln().getOrThrow().split(" ")
    let m = Int64.parse(first[0])
    let n = Int64.parse(first[1])
    let a = Int64.parse(first[2])
    let b = Int64.parse(first[3])
    let replaceVal = Int64.parse(first[4])

    // 逐行读取图像数据
    for (_ in 1..=m) {
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        // 逐列处理每个像素
        for (j in 0..n) {
            if (j > 0) {
                Console.stdOut.write(" ")  // 两个输出值之间用空格分隔
            }
            let val = Int64.parse(parts[j])
            // 判断像素值是否在区间 [a, b] 内
            if (val >= a && val <= b) {
                Console.stdOut.write(format3(replaceVal))  // 替换为指定值
            } else {
                Console.stdOut.write(format3(val))          // 保持原值
            }
        }
        println("")  // 每行末尾换行
    }
    return 0
}

// 将数字格式化为 3 位宽度，不足前面补 0（如 "5" -> "005"）
func format3(x: Int64): String {
    var s = x.toString()
    while (s.size < 3) {
        s = "0" + s
    }
    return s
}

