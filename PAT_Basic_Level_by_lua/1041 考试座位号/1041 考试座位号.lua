-- 题目编号: 1041 考试座位号
-- 实现原理: 以试机座位号为键，将考生信息（准考证号、考试座位号）存入哈希表。查询时直接通过试机座位号 O(1) 读取对应数据并输出。

-- 读取考生人数 n，seats 表以试机座位号为键存储考生信息
local n, seats = tonumber(io.read()), {}

-- 读取每个考生的信息并存入哈希表
for _ = 1, n do
    -- 从输入行中提取：准考证号 id、试机座位号 test、考试座位号 exam
    local id, test, exam = io.read("l"):match("^(%S+)%s+(%d+)%s+(%d+)$")
    seats[test] = { id, exam }
end

-- 读取查询次数 m
local m = tonumber(io.read())

-- 逐个查询并输出结果
for _ = 1, m do
    local s = seats[tostring(io.read("*n"))]
    -- 输出准考证号和考试座位号
    print(s[1] .. " " .. s[2])
end
