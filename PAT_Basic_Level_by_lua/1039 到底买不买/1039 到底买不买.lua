-- 题目编号: 1039 到底买不买
-- 实现原理: 用哈希表统计已有珠子各颜色数量，遍历需要的珠子，若颜色不足则缺失计数加1，否则扣减。若缺失为0则输出"Yes"及多余珠子数，否则输出"No"及缺失数。

-- 读取已有珠子字符串 have 和需要的珠子字符串 need
local have, need = io.read("l"), io.read("l")

-- count: 统计每种颜色珠子的数量
local count = {}
for ch in have:gmatch(".") do
    count[ch] = (count[ch] or 0) + 1
end

-- missing: 统计缺失的珠子数量
local missing = 0

-- 遍历需要的珠子，逐个检查是否足够
for ch in need:gmatch(".") do
    if (count[ch] or 0) == 0 then
        -- 该颜色珠子不足，缺失数加 1
        missing = missing + 1
    else
        -- 该颜色珠子足够，数量减 1
        count[ch] = count[ch] - 1
    end
end

-- 输出结果：没有缺失则输出 Yes 和多余珠子数，否则输出 No 和缺失数
if missing == 0 then
    print("Yes " .. (#have - #need))
else
    print("No " .. missing)
end
