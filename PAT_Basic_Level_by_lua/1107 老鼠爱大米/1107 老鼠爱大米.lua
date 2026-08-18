-- 题目编号: 1107 老鼠爱大米
-- 实现原理: 有n组数据，每组m个正整数。对每组取最大值记录到数组a中，最后再取所有组最大值中的最大值输出。输出时各组最大值用空格分隔。

local n, m = io.read("*n"), io.read("*n")  -- n组数据，每组m个正整数
local a = {}                                -- 存储每组的最大值

-- 处理每组数据
for i = 1, n do
    local z = 0  -- 当前组的最大值，初始为0
    -- 读取每组的m个数，记录最大值
    for j = 1, m do
        z = math.max(z, io.read("*n"))
    end
    a[i] = z  -- 保存当前组的最大值
end

-- 输出各组最大值，用空格分隔
print(table.concat(a, " "))

-- 找出所有组最大值中的最大值并输出
local z = 0
for i = 1, n do
    z = math.max(z, a[i])
end
print(z)
