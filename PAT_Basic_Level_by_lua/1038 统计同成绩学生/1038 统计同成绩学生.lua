-- 题目编号: 1038 统计同成绩学生
-- 实现原理: 用哈希表统计每个分数的人数，然后根据查询分数直接读取对应计数，按顺序输出结果。

-- 读取学生总数 n，count 表存储各分数的人数
local n, count = io.read("*n"), {}

-- 统计每个分数出现的次数
for _ = 1, n do
    local x = io.read("*n")
    count[x] = (count[x] or 0) + 1
end

-- 读取查询次数 k，out 存储查询结果
local k, out = io.read("*n"), {}

-- 依次查询每个分数对应的人数，若不存在则为 0
for _ = 1, k do
    out[#out + 1] = count[io.read("*n")] or 0
end

-- 输出所有查询结果，用空格分隔
print(table.concat(out, " "))
