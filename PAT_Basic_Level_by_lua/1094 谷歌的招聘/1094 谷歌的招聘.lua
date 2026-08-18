-- 题目编号: 1094 谷歌的招聘
-- 实现原理: 从长字符串中依次截取长度为K的连续子串，检查其是否为偶数，找到第一个符合条件的K位数并输出。
local l, k = io.read("*n"), io.read("*n")  -- l:字符串长度，k:要找的K位数长度
io.read("l")  -- 消耗第一行末尾的换行符
local s = io.read("l")  -- 读取长数字字符串

-- 从左到右枚举所有长度为k的连续子串
for i = 1, l - k + 1 do
    local x = s:sub(i, i + k - 1)  -- 截取从第i位开始的k位字符
    -- 检查该k位数是否为偶数
    if tonumber(x) % 2 == 0 then
        print(x)  -- 找到第一个就输出
        break  -- 跳出循环
    end
end
