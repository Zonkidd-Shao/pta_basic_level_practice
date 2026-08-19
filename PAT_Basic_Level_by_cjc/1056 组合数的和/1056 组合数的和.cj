import std.env.*
import std.convert.*

// PAT Basic Level 1056 组合数的和
// 解题思路：给定 N 个非 0 个位数，每个数字可以出现在十位或个位
// 每个数字 digit 在十位出现时贡献 digit*10，在个位出现时贡献 digit*1
// 每个数字在十位和个位各出现 (N-1) 次，所以总和 = sum(digit * 11 * (N-1))
main() {
    // 读取一行，第一个是数字个数 N，后面是 N 个数字
    let line = getStdIn().readln().getOrThrow()
    let parts = line.split(" ")
    let n = Int64.parse(parts[0])
    
    var sum: Int64 = 0
    // 遍历每个数字，计算其贡献
    for (i in 1..(n+1)) {
        let digit = Int64.parse(parts[i])
        // 每个数字出现在十位贡献 digit*10，个位贡献 digit*1
        // 每个位置出现 (N-1) 次，合计 digit * 11 * (N-1)
        sum += digit * 11 * (n - 1)
    }
    
    println(sum)
}

