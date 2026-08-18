-- 题目编号: 1064 朋友数
-- 实现原理: 朋友证号即一个数各位数字之和。将每个输入的各位数字相加得到朋友证号，存入集合去重，最后排序并输出所有不同的朋友证号。
-- n: 整数个数，s: 存储朋友证号的集合（用于去重）
local n, s = tonumber(io.read()), {}
-- 处理每个整数
for i = 1, n do
    local x = io.read("*n")  -- 读取整数
    local q = 0  -- 各位数字之和
    -- 遍历每一位数字并累加
    for d in tostring(x):gmatch("%d") do
        q = q + tonumber(d)
    end
    s[q] = true  -- 存入集合（自动去重）
end
-- 将集合转为数组以便排序
local a = {}
for x in pairs(s) do
    a[#a + 1] = x
end
table.sort(a)  -- 从小到大排序
-- 输出朋友证号个数和所有朋友证号
print(#a)
print(table.concat(a, " "))
