-- 题目编号: 1024 科学计数法
-- 实现原理: 用正则提取符号位、尾数和指数。当指数为正时，根据指数大小移动小数点位置或补零；当指数为负时，在数字前补相应数量的零并添加小数点，最后加上符号位输出。

-- 读取输入的科学计数法字符串
local s = io.read("l")

-- 用正则提取三部分：符号位、尾数（如1.234）、指数部分（如+5或-3）
local sign, mantissa, exponent = s:match("([+-])(%d%.%d+)E([+-]%d+)")

-- 去掉尾数中的小数点，得到纯数字字符串（如"1234"）
local digits = mantissa:gsub("%.", "")
-- 将指数转换为数字
local e = tonumber(exponent)

-- 存储转换后的普通数字字符串
local value

-- 指数非负的情况（小数点右移）
if e >= 0 then
    -- 如果指数足够大，小数点移到末尾后还要补零
    if e + 1 >= #digits then
        -- 原数字后面补(e+1-#digits)个零
        value = digits .. string.rep("0", e + 1 - #digits)
    else
        -- 小数点向右移动e位：前e+1位是整数部分，后面是小数部分
        value = digits:sub(1, e + 1) .. "." .. digits:sub(e + 2)
    end
-- 指数为负的情况（小数点左移，即数字前面补零）
else
    -- 0.后面补(-e-1)个零，再接上原数字
    value = "0." .. string.rep("0", -e - 1) .. digits
end

-- 加上符号位（负号就加，正号不加）并输出
print((sign == "-" and "-" or "") .. value)
