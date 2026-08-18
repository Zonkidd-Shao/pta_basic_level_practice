-- 题目编号: 1101 B是A的多少倍
-- 实现原理: 读取两个整数A和B，计算B除以A的值，使用string.format保留两位小数后输出。
local a, b = io.read("*n"), io.read("*n")  -- 读取两个整数A和B
print(string.format("%.2f", b / a))        -- 计算B/A的值，保留两位小数后输出
