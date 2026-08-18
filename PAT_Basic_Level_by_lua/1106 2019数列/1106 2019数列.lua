-- 题目编号: 1106 2019数列
-- 实现原理: 数列以2、0、1、9开头，从第5项开始每项为前4项之和的个位数。按此规则递推生成前n项，拼接成字符串输出。

local n = tonumber(io.read())  -- 读取数列项数n
local a = {2, 0, 1, 9}         -- 数列前4项初始值

-- 从第5项开始递推生成
for i = 5, n do
    -- 每项为前4项之和的个位数
    a[i] = (a[i - 1] + a[i - 2] + a[i - 3] + a[i - 4]) % 10
end

-- 将数组元素拼接成字符串输出
local o = {}
for i = 1, n do
    o[i] = a[i]
end
print(table.concat(o))
