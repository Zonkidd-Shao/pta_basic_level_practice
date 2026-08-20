import std.env.*
import std.convert.*
import std.collection.*

// 1085 PAT单位排行
// 思路：读取每个考生的信息，根据考试级别（B/A/T）对分数加权，
// 按学校汇总加权总分和考生人数，最后排序输出。
// 排序规则：加权总分（取整）降序 -> 考生人数升序 -> 学校名升序。

// 学校信息结构体
class School {
    var name: String       // 学校名称（小写）
    var totalScore: Float64  // 加权总分（浮点数累计）
    var count: Int64       // 考生人数

    init(name: String) {
        this.name = name
        this.totalScore = 0.0
        this.count = 0
    }
}

main() {
    var N = Int64.parse(getStdIn().readln().getOrThrow())  // 考生人数
    var schools = HashMap<String, School>()  // 学校名 -> 学校信息

    for (_ in 0..N) {
        var line = getStdIn().readln().getOrThrow()
        var parts = line.split(" ")
        var id = parts[0]                     // 准考证号
        var score = Int64.parse(parts[1])     // 得分
        var schoolName = lowerAscii(parts[2])   // 学校名转小写
        // 如果学校不存在则新建
        if (!schools.contains(schoolName)) {
            schools[schoolName] = School(schoolName)
        }
        var s = schools[schoolName]
        s.count++  // 考生人数+1
        // 根据考试级别加权：B级/1.5，A级不变，T级*1.5
        if (id[0] == 66) {
            s.totalScore += Float64(score) / 1.5
        } else if (id[0] == 65) {
            s.totalScore += Float64(score)
        } else if (id[0] == 84) {
            s.totalScore += Float64(score) * 1.5
        }
    }

    // 将学校信息存入列表进行排序
    var list = ArrayList<School>()
    for (s in schools.values()) {
        list.add(s)
    }

    // 排序：按加权总分（取整）降序 -> 考生人数升序 -> 学校名升序
    for (i in 0..list.size) {
        for (j in i + 1..list.size) {
            let a = list[i]
            let b = list[j]
            let ta = Int64(a.totalScore)
            let tb = Int64(b.totalScore)
            let shouldSwap = if (ta != tb) { ta < tb } else if (a.count != b.count) {
                a.count > b.count
            } else { a.name > b.name }
            if (shouldSwap) {
                let tmp = list[i]
                list[i] = list[j]
                list[j] = tmp
            }
        }
    }

    // 输出结果
    println(list.size)  // 单位总数
    var rank: Int64 = 1
    var prevScore: Int64 = -1
    for (i in 0..list.size) {
        var s = list[i]
        var weighted = Int64(s.totalScore)  // 加权总分取整
        // 如果总分与上一名不同，更新排名（相同总分排名相同）
        if (weighted != prevScore) {
            rank = i + 1
        }
        println("${rank} ${s.name} ${weighted} ${s.count}")
        prevScore = weighted
    }
}

func lowerAscii(s: String): String {
    var result = ""
    for (c in s) {
        if (c >= 65 && c <= 90) {
            result += Rune(c + 32).toString()
        } else {
            result += Rune(c).toString()
        }
    }
    return result
}
