import std.env.*
import std.convert.*
import std.collection.*

// PAT Basic Level 1052 卖个萌
// 解题思路：每行输入用方括号 [] 括起来的多个可选表情符号
// 用户按 1-based 索引选择左手、左眼、嘴、右眼、右手表情
// 需要验证索引合法性，输出组合后的表情字符串
// 解析从一行字符串中提取所有 [表情] 符号
func parseSymbols(line: String): Array<String> {
    var symbols = ArrayList<String>()
    var i: Int64 = 0
    let n = line.size
    while (i < n) {
        if (line[i] == 91) {
            // 遇到 '[' 开始提取方括号内的内容
            let contentStart = i + 1
            i++
            while (i < n && line[i] != 93) {
                i++
            }
            if (i < n) { i++ } // 跳过 ']'
            symbols.add(line[contentStart..i-1])  // 将提取到的符号加入列表
        } else {
            i++
        }
    }
    return symbols.toArray()
}

main() {
    // 分别读取三行：手部表情、眼部表情、嘴部表情
    let handLine = getStdIn().readln().getOrThrow()
    let eyeLine = getStdIn().readln().getOrThrow()
    let mouthLine = getStdIn().readln().getOrThrow()
    
    // 解析每行中的表情符号列表
    let hands = parseSymbols(handLine)
    let eyes = parseSymbols(eyeLine)
    let mouths = parseSymbols(mouthLine)
    
    // 读取需要输出的表情组合个数
    let k = Int64.parse(getStdIn().readln().getOrThrow())
    
    for (_ in 0..k) {
        // 读取一行，包含 5 个索引：左手、左眼、嘴、右眼、右手
        let line = getStdIn().readln().getOrThrow()
        let parts = line.split(" ")
        let lh = Int64.parse(parts[0])  // 左手索引
        let le = Int64.parse(parts[1])  // 左眼索引
        let m = Int64.parse(parts[2])   // 嘴索引
        let re = Int64.parse(parts[3])  // 右眼索引
        let rh = Int64.parse(parts[4])  // 右手索引
        
        // 验证索引是否合法（1-based，不能超出对应符号列表的范围）
        if (lh < 1 || lh > hands.size || le < 1 || le > eyes.size ||
            m < 1 || m > mouths.size || re < 1 || re > eyes.size ||
            rh < 1 || rh > hands.size) {
            println("Are you kidding me? @\\/@")
        } else {
            // 输出组合后的表情：左手(左眼嘴右眼)右手
            // 注意索引从 1 开始，数组中需减 1
            println("${hands[lh-1]}(${eyes[le-1]}${mouths[m-1]}${eyes[re-1]})${hands[rh-1]}")
        }
    }
}

