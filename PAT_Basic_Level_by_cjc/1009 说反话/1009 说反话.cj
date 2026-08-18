import std.env.*
import std.convert.*

// 1009 说反话
// 解题思路：读取一行英文句子，按空格分割成单词数组，
// 然后从后往前遍历单词，用空格连接后输出，实现单词顺序反转。
main(): Int64 {
    let line = getStdIn().readln().getOrThrow()  // 读取一行英文句子
    let words = line.split(" ")                  // 按空格分割成单词列表
    var result = ""
    var i = words.size - 1
    while (i >= 0) {           // 从最后一个单词开始往前遍历
        if (result.size > 0) {
            result = result + " "  // 单词之间加空格分隔
        }
        result = result + words[i]
        i = i - 1
    }
    println(result)            // 输出反转后的句子
    return 0
}

