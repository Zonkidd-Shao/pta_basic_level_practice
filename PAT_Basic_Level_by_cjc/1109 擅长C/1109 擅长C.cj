// 题目编号：1109  擅长C
// 解题思路：
//   首先读入 26 个大写字母的 7×5 点阵图案（每个字母 7 行，每行 5 个字符）。
//   然后读入一行句子，从中提取出所有由大写字母组成的单词。
//   对每个单词，将字母对应的 7 行图案按顺序拼接输出，单词间用空行分隔。

import std.env.*
import std.convert.*
import std.collection.*

main() {
    // 读取 26 个字母（A-Z）的点阵图案，每个字母 7 行，每行 5 个字符
    var letters = Array<Array<String>>(26, repeat: [])
    for (i in 0..26) {
        letters[i] = Array<String>(7, repeat: "")
        for (row in 0..7) {
            letters[i][row] = getStdIn().readln().getOrThrow()
        }
    }

    // 读取包含单词的句子
    let sentence = getStdIn().readln().getOrThrow()

    // 从句子中提取所有连续大写字母组成的单词
    var words = ArrayList<String>()
    var curWord = ""
    for (ch in sentence) {
        if (ch >= 65 && ch <= 90) {     // 大写字母 A-Z（ASCII 65-90）
            curWord += Rune(ch).toString()
        } else {
            if (curWord != "") {
                words.add(curWord)      // 遇到非大写字母，结束当前单词
                curWord = ""
            }
        }
    }
    if (curWord != "") {
        words.add(curWord)              // 处理最后一个单词
    }

    // 输出每个单词的点阵图案
    for (widx in 0..words.size) {
        let word = words[widx]
        if (word == "") { continue }

        // 对每个单词，逐行输出 7 行图案
        for (row in 0..7) {
            var line = ""
            for (cidx in 0..word.size) {
                let ch = word[cidx]
                let letterIdx = Int64(ch) - 65   // 将字母转为索引（A=0, B=1, ...）
                if (cidx > 0) {
                    line += " "                  // 字母之间加空格分隔
                }
                line += letters[letterIdx][row]
            }
            println(line)
        }

        // 单词之间输出一个空行（最后一个单词后不加空行）
        if (widx < words.size - 1) {
            println("")
        }
    }
}
