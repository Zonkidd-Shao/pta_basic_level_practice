import std.env.*
import std.convert.*

// 1001 害死人不偿命的(3n+1)猜想
// 解题思路：对给定的正整数 n，按照卡拉兹猜想的规则反复操作：
// 若 n 为偶数则 n = n/2，若为奇数则 n = (3n+1)/2，
// 直到 n=1，统计所需的步数并输出。
main(): Int64 {
    let input = getStdIn().readln().getOrThrow()  // 读取输入的正整数 n
    var n = Int64.parse(input)
    var steps: Int64 = 0  // 记录砍到 1 所需的步数
    while (n != 1) {      // 循环直到 n 等于 1
        if (n % 2 == 0) { // n 是偶数，砍掉一半
            n = n / 2
        } else {          // n 是奇数，计算 (3n+1) 再砍掉一半
            n = (3 * n + 1) / 2
        }
        steps = steps + 1 // 步数加 1
    }
    println(steps)        // 输出步数
    return 0
}
