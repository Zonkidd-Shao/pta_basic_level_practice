-- 题目编号: 1010 一元多项式求导
-- 实现原理: 以"系数 指数"成对读取输入，对每对求导（系数=系数×指数，指数=指数-1），忽略指数为0的项，若结果为空则输出"0 0"。

-- 存储所有输入数值的数组
local values = {}
-- 读取全部输入内容，用正则提取所有整数（包括负数）
for value in io.read("a"):gmatch("%-?%d+") do
    values[#values + 1] = tonumber(value)
end

-- 存储求导结果的数组（系数和指数交替存储）
local result = {}
-- 每两个数为一组（系数、指数），步长为2
for i = 1, #values, 2 do
    -- 取出当前项的系数和指数
    local coefficient, exponent = values[i], values[i + 1]
    -- 只有当指数不为0时才需要求导（常数项求导后消失）
    if exponent ~= 0 then
        -- 求导后的系数 = 原系数 × 原指数
        result[#result + 1] = coefficient * exponent
        -- 求导后的指数 = 原指数 - 1
        result[#result + 1] = exponent - 1
    end
end

-- 如果结果为空（即原多项式是常数），则输出"0 0"
if #result == 0 then
    result = { 0, 0 }
end
-- 用空格连接结果并输出
print(table.concat(result, " "))
