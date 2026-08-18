-- 题目编号: 1043 输出PATest
-- 实现原理: 统计字符串中各字符的数量。按照 "PATest" 的固定顺序循环输出，每轮输出一个存在的字符并减计数，直到所有字符均被输出完毕。

-- c: 统计各字符出现的次数
-- order: 输出的固定顺序
local c, order = {}, { "P", "A", "T", "e", "s", "t" }

-- 统计输入字符串中每个字符的数量
for ch in io.read("l"):gmatch(".") do
    c[ch] = (c[ch] or 0) + 1
end

-- out: 存储输出结果
-- left: 标记是否还有字符需要输出
local out, left = {}, true

-- 循环输出，直到所有字符都输出完毕
while left do
    left = false
    -- 按固定顺序遍历每个字符
    for _, ch in ipairs(order) do
        if (c[ch] or 0) > 0 then
            -- 该字符还有剩余，输出一个并减少计数
            out[#out + 1] = ch
            c[ch] = c[ch] - 1
            left = true  -- 本轮还有输出，继续下一轮
        end
    end
end

-- 输出最终结果
print(table.concat(out))
