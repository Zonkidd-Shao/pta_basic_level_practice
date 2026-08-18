-- 题目编号: 1017 A除以B
-- 实现原理: 模拟手工除法（高精度除法），从被除数最高位开始逐位取数，每次将余数乘10加下一位，除以除数得到商的当前位，最后去除商的前导零后输出

-- 读取一行输入，用正则匹配提取被除数A（字符串形式）和除数B（数字）
local a, b = io.read("l"):match("^(%d+)%s+(%d+)$")
-- 将除数转换为数字
b = tonumber(b)

-- 存储商的每一位数字，以及当前余数
local quotient, remainder = {}, 0

-- 遍历被除数的每一位数字（从高位到低位）
for digit in tostring(a):gmatch("%d") do
    -- 余数乘10加上当前位的数字，得到当前的被除数
    remainder = remainder * 10 + tonumber(digit)
    -- 计算当前位的商（向下取整）
    quotient[#quotient + 1] = math.floor(remainder / b)
    -- 更新余数
    remainder = remainder % b
end

-- 找到第一个非零数字的位置（去除前导零）
local first = 1
while first < #quotient and quotient[first] == 0 do
    first = first + 1
end

-- 构建最终的商（从第一个非零位开始）
local result = {}
for i = first, #quotient do
    result[#result + 1] = quotient[i]
end
-- 输出商和余数
print(table.concat(result) .. " " .. remainder)
