import std.env.*
import std.convert.*

// 1005 继续(3n+1)猜想
// 解题思路：对每个输入数字模拟卡拉兹猜想的过程，
// 记录所有被"覆盖"的数字（即计算过程中出现的数字）。
// 输入数字中未被其他数字覆盖的即为"关键数"，
// 最后按从大到小的顺序输出关键数。
main(): Int64 {
    let k = Int64.parse(getStdIn().readln().getOrThrow())  // 读取待验证数字的个数
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let nums = Array<Int64>(k, item: 0)
    for (i in 0..k) {
        nums[i] = Int64.parse(parts[i])  // 读取每个待验证的数字
    }
    let covered = Array<Bool>(101, item: false)  // 标记数组，记录哪些数被覆盖（数字范围 1~100）
    for (num in nums) {
        var n = num
        while (n != 1) {            // 模拟卡拉兹猜想过程
            if (n % 2 == 0) {
                n = n / 2
            } else {
                n = (3 * n + 1) / 2
            }
            if (n <= 100) {          // 只记录不超过 100 的数（题目范围限制）
                covered[n] = true    // 标记 n 被覆盖
            }
        }
    }
    var keys = ArrayList<Int64>()
    for (num in nums) {
        if (!covered[num]) {         // 如果该数字未被其他数字覆盖，则为关键数
            keys.append(num)
        }
    }
    keys.sort()                      // 升序排序
    var result = ""
    var i = keys.size - 1
    while (i >= 0) {                 // 从大到小遍历输出
        if (result.size > 0) {
            result = result + " "
        }
        result = result + keys[i].toString()
        i = i - 1
    }
    println(result)                  // 输出关键数（从大到小，空格分隔）
    return 0
}

