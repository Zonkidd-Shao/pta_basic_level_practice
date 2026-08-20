// 1095 解码PAT准考证
// 解题思路：解析准考证号的字段信息（级别、考场、日期、序号），
// 支持3种查询：
//   类型1：按级别筛选考生，按成绩降序、准考证号升序排列
//   类型2：统计某考场的考生人数和总分
//   类型3：统计某日期的各考场人数，按人数降序、考场号升序排列
import std.env.*
import std.convert.*
import std.collection.*

// 考生类，解析准考证号并存储成绩
class Examinee {
    var id: String
    var score: Int64
    var level: String   // 级别（第1位字符：A/B/T）
    var room: String    // 考场编号（第2~4位）
    var date: String    // 日期（第5~10位）
    var seq: String     // 个人序号（第11~13位）

    init(id: String, score: Int64) {
        this.id = id
        this.score = score
        this.level = Rune(id[0]).toString()
        this.room = id[1..4]
        this.date = id[4..10]
        this.seq = id[10..13]
    }
}

main() {
    // 读取考生人数 N 和查询次数 M
    var line = getStdIn().readln().getOrThrow()
    var parts = line.split(" ")
    var N = Int64.parse(parts[0])
    var M = Int64.parse(parts[1])

    // 读取所有考生信息
    var examinees = ArrayList<Examinee>()
    for (_ in 0..N) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        var id = parts[0]
        var score = Int64.parse(parts[1])
        examinees.add(Examinee(id, score))
    }

    // 处理 M 条查询指令
    for (caseNum in 1..(M + 1)) {
        line = getStdIn().readln().getOrThrow()
        parts = line.split(" ")
        var queryType = Int64.parse(parts[0])
        var instruction = parts[1]
        println("Case ${caseNum}: ${queryType} ${instruction}")

        if (queryType == 1) {
            // 类型1：按级别查询，按成绩降序、准考证号升序排序
            var filtered = ArrayList<Examinee>()
            for (e in examinees) {
                if (e.level == instruction) {
                    filtered.add(e)
                }
            }
            for (i in 0..filtered.size) {
                for (j in i + 1..filtered.size) {
                    let a = filtered[i]
                    let b = filtered[j]
                    let shouldSwap = if (a.score != b.score) { a.score < b.score } else { a.id > b.id }
                    if (shouldSwap) {
                        let tmp = filtered[i]
                        filtered[i] = filtered[j]
                        filtered[j] = tmp
                    }
                }
            }
            if (filtered.size == 0) {
                println("NA")
            } else {
                for (e in filtered) {
                    println("${e.id} ${e.score}")
                }
            }
        } else if (queryType == 2) {
            // 类型2：统计考场人数和总分
            var total: Int64 = 0
            var count: Int64 = 0
            for (e in examinees) {
                if (e.room == instruction) {
                    count++
                    total += e.score
                }
            }
            if (count == 0) {
                println("NA")
            } else {
                println("${count} ${total}")
            }
        } else if (queryType == 3) {
            // 类型3：统计某日期的各考场人数
            var roomCount = HashMap<String, Int64>()
            for (e in examinees) {
                if (e.date == instruction) {
                    var room = e.room
                    let oldCount = roomCount.get(room)
                    let count = if (oldCount.isSome()) { oldCount.getOrThrow() } else { 0 }
                    roomCount[room] = count + 1
                }
            }
            if (roomCount.size == 0) {
                println("NA")
            } else {
                // 转换为列表，按人数降序、考场号升序排序
                var list = ArrayList<Array<String>>()
                for (r in roomCount.keys()) {
                    list.add([r, roomCount[r].toString()])
                }
                for (i in 0..list.size) {
                    for (j in i + 1..list.size) {
                        let a = list[i]
                        let b = list[j]
                        let ca = Int64.parse(a[1])
                        let cb = Int64.parse(b[1])
                        let shouldSwap = if (ca != cb) { ca < cb } else { a[0] > b[0] }
                        if (shouldSwap) {
                            let tmp = list[i]
                            list[i] = list[j]
                            list[j] = tmp
                        }
                    }
                }
                for (item in list) {
                    println("${item[0]} ${item[1]}")
                }
            }
        }
    }
}

