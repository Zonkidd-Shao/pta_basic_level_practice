-- 题目编号: 1008 数组元素循环右移问题
-- 实现原理: 读取数组长度n和右移位数m，用m=m%n处理m≥n的情况，通过取模运算将每个元素放到右移后的位置，最后输出结果数组。

-- 存储所有输入数值的数组
local values = {}
-- 读取全部输入内容，用正则提取所有整数（包括负数）
for value in io.read("a"):gmatch("%-?%d+") do
    values[#values + 1] = tonumber(value)
end

-- 第一个数是数组长度n，第二个数是右移位数m
local n, m = values[1], values[2]
-- 存储右移后的结果数组
local result = {}

-- 只有当数组长度大于0时才进行处理
if n > 0 then
    -- 处理m大于等于n的情况：右移n位等于没移，所以取模
    m = m % n
    -- 遍历结果数组的每个位置
    for i = 1, n do
        -- 计算原数组中对应位置的元素索引
        -- (i - m - 1) % n 计算原数组的0基索引
        -- 加上2是因为values数组前两个元素是n和m，实际数据从第3个元素开始
        result[i] = values[2 + ((i - m - 1) % n) + 1]
    end
end
-- 用空格连接结果数组并输出
print(table.concat(result, " "))
