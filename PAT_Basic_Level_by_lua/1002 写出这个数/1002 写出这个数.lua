-- 题目编号: 1002 写出这个数
-- 实现原理: 读入一个数字字符串，逐位求和；再将和的每一位数字映射为对应的中文拼音，以空格拼接输出。

-- 读取输入的数字字符串（按行读取）
local number = io.read("l")
-- 数字0-9对应的中文拼音数组，索引从1开始（Lua数组特性）
local words = { "ling", "yi", "er", "san", "si", "wu", "liu", "qi", "ba", "jiu" }
-- 存储各位数字之和
local sum = 0

-- 遍历字符串中的每一位数字
for digit in number:gmatch("%d") do
    -- 将字符转换为数字并累加到sum中
    sum = sum + tonumber(digit)
end

-- 存储结果拼音的数组
local result = {}
-- 将和转换为字符串，遍历每一位数字
for digit in tostring(sum):gmatch("%d") do
    -- 将数字转换为对应的拼音（注意Lua数组下标从1开始，所以要+1）
    result[#result + 1] = words[tonumber(digit) + 1]
end
-- 用空格连接所有拼音并输出
print(table.concat(result, " "))
