-- 题目编号: 1093 字符串A+B
-- 实现原理: 拼接两个字符串，遍历每个字符，利用哈希表记录已出现字符，按首次出现顺序输出不重复的字符。
local s = io.read("l") .. io.read("l")  -- 拼接两个输入字符串
local seen, o = {}, {}  -- seen:记录已出现的字符（集合），o:按顺序存储不重复的字符

-- 遍历拼接后的字符串的每个字符
for c in s:gmatch(".") do
    -- 如果该字符还没出现过
    if not seen[c] then
        seen[c] = true  -- 标记为已出现
        o[#o + 1] = c  -- 加入结果数组
    end
end

print(table.concat(o))  -- 拼接输出去重后的字符串
