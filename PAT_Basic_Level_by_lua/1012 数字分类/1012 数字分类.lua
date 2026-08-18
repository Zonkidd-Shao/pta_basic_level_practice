-- 题目编号: 1012 数字分类
-- 实现原理: 遍历每个数字，按除以5的余数分为5类，分别统计各类所需的结果（求和、交错求和、计数、求平均值、求最大值），最后按格式输出

-- 存储所有输入数值的数组
local values = {}
-- 读取全部输入内容，用正则提取所有整数（包括负数）
for value in io.read("a"):gmatch("%-?%d+") do
    values[#values + 1] = tonumber(value)
end

-- sums: 各类的累加和（5类），counts: 各类的数字个数（5类）
local sums, counts = { 0, 0, 0, 0, 0 }, { 0, 0, 0, 0, 0 }
-- sign: 第2类（余1）的交错求和符号（交替加减），maximum: 第5类（余4）的最大值
local sign, maximum = 1, nil

-- 从第2个元素开始遍历（第1个元素是数字的个数n）
for i = 2, #values do
    -- x为当前数字，r为x除以5的余数
    local x, r = values[i], values[i] % 5
    
    -- 第1类：能被5整除且是偶数的数字，求和
    if r == 0 and x % 2 == 0 then
        sums[1] = sums[1] + x
        counts[1] = counts[1] + 1
    -- 第2类：除以5余1的数字，交错求和（加、减、加、减...）
    elseif r == 1 then
        sums[2] = sums[2] + sign * x
        sign = -sign
        counts[2] = counts[2] + 1
    -- 第3类：除以5余2的数字，统计个数
    elseif r == 2 then
        counts[3] = counts[3] + 1
    -- 第4类：除以5余3的数字，用于求平均值
    elseif r == 3 then
        sums[4] = sums[4] + x
        counts[4] = counts[4] + 1
    -- 第5类：除以5余4的数字，求最大值
    elseif r == 4 then
        -- 如果还没有最大值，或者当前数比最大值大，则更新最大值
        maximum = not maximum or math.max(maximum, x)
        counts[5] = counts[5] + 1
    end
end

-- 存储输出结果的数组
local result = {}
-- 遍历5类，分别生成输出字符串
for i = 1, 5 do
    -- 如果该类没有数字，输出N
    if counts[i] == 0 then
        result[i] = "N"
    -- 第4类需要输出平均值（保留一位小数）
    elseif i == 4 then
        result[i] = string.format("%.1f", sums[i] / counts[i])
    -- 第5类输出最大值
    elseif i == 5 then
        result[i] = tostring(maximum)
    -- 其他类直接输出和
    else
        result[i] = tostring(sums[i])
    end
end
-- 用空格连接结果并输出
print(table.concat(result, " "))
