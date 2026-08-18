-- 题目编号: 1021 个位数统计
-- 实现原理: 遍历输入数字字符串中的每个字符，统计数字0~9各自出现的次数，最后输出出现次数大于0的统计结果。

-- 用于存储0~9每个数字出现次数的数组
local count = {}
-- 初始化计数器，0到9的出现次数都设为0
for i = 0, 9 do
    count[i] = 0
end

-- 遍历输入字符串中的每一位数字
for d in io.read("l"):gmatch("%d") do
    -- 对应数字的计数加1
    count[tonumber(d)] = count[tonumber(d)] + 1
end

-- 按数字从小到大的顺序输出
for i = 0, 9 do
    -- 只输出出现次数大于0的数字
    if count[i] > 0 then
        print(i .. ":" .. count[i])
    end
end
