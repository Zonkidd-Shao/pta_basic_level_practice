-- 题目编号: 1101 B是A的多少倍
-- 实现原理: 读取两个整数A和B，计算B除以A的值，使用string.format保留两位小数后输出。
local a, d = io.read("l"):match("^(%d+)%s+(%d+)$")
d = tonumber(d)
local cut = #a - d
local b = a:sub(cut + 1) .. a:sub(1, cut)
print(string.format("%.2f", tonumber(b) / tonumber(a)))
