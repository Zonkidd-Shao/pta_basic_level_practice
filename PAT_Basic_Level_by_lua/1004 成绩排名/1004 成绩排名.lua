-- 题目编号: 1004 成绩排名
-- 实现原理: 读入n个学生的姓名、学号和成绩，遍历过程中分别记录成绩最高和最低的学生，最后输出对应信息。

-- 读取学生人数
local n = tonumber(io.read())
-- 用于记录成绩最高和最低的学生信息
local highest, lowest

-- 循环读取每个学生的信息
for _ = 1, n do
    -- 用正则匹配从一行中提取姓名、学号和成绩
    -- %S+ 匹配非空白字符序列，%d+ 匹配数字序列
    local name, id, score = io.read("l"):match("^(%S+)%s+(%S+)%s+(%d+)$")
    -- 将学生信息存入表中，成绩转为数字类型
    local student = { name = name, id = id, score = tonumber(score) }
    
    -- 如果当前学生成绩比记录的最高分还高（或者还没有记录），更新最高分
    if not highest or student.score > highest.score then
        highest = student
    end
    -- 如果当前学生成绩比记录的最低分还低（或者还没有记录），更新最低分
    if not lowest or student.score < lowest.score then
        lowest = student
    end
end

-- 输出成绩最高的学生姓名和学号
print(highest.name .. " " .. highest.id)
-- 输出成绩最低的学生姓名和学号
print(lowest.name .. " " .. lowest.id)
