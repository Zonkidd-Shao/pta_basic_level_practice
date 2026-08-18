-- 题目编号: 1108 String复读机
-- 实现原理: 统计输入字符串中各字符出现次数。按"String"中各字母的顺序循环遍历，每轮依次输出一个可用字符并减少计数，直到所有字符输出完毕。

local s = io.read("l")  -- 读取输入字符串
local c = {}             -- 统计各字符出现次数

-- 统计每个字符出现的次数
for x in s:gmatch(".") do
    c[x] = (c[x] or 0) + 1
end

local o = {}              -- 存储输出结果
local order = "String"    -- 按此字符串中的字母顺序循环输出
local left = true         -- 标记是否还有剩余字符需要输出

-- 循环输出，直到所有字符都输出完毕
while left do
    left = false  -- 假设本轮没有输出，若有输出则设为true
    -- 按"String"中各字母的顺序遍历
    for i = 1, #order do
        local x = order:sub(i, i)
        -- 如果该字符还有剩余计数
        if (c[x] or 0) > 0 then
            o[#o + 1] = x  -- 将字符加入输出
            c[x] = c[x] - 1  -- 计数减1
            left = true       -- 本轮有输出，继续循环
        end
    end
end

print(table.concat(o))  -- 将结果拼接成字符串输出
