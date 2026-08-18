-- 题目编号: 1042 字符统计
-- 实现原理: 将输入字符串转为小写，用正则匹配出所有英文字母并统计出现次数。遍历统计表，找出出现次数最多且 ASCII 码最小的字母输出。

-- count: 统计每个英文字母出现的次数
local count = {}

-- 将输入字符串转为小写，只提取英文字母并统计次数
for ch in io.read("l"):lower():gmatch("%a") do
    count[ch] = (count[ch] or 0) + 1
end

-- best: 出现次数最多的字母（次数相同时取 ASCII 码更小的）
-- maximum: 最高出现次数
local best, maximum = "z", -1

-- 遍历统计结果，找出出现次数最多的字母
for ch, n in pairs(count) do
    -- 次数更多 或 次数相同但字母更小（ASCII 码更小）
    if n > maximum or (n == maximum and ch < best) then
        best, maximum = ch, n
    end
end

-- 输出结果：出现次数最多的字母及其出现次数
print(best .. " " .. maximum)
