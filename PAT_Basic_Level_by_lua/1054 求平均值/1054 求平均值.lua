-- 题目编号: 1054 求平均值
-- 实现原理: 逐个读取输入的字符串，用tonumber尝试转为数字，并用正则匹配校验是否为最多两位小数的合法格式。检查数值范围[-1000,1000]，合法则累加求和并计数；非法则输出错误信息。最后根据合法数字个数输出平均值，注意单复数及Undefined的处理。
-- n: 输入数字个数，sum: 合法数字之和，c: 合法数字个数
local n, sum, c = tonumber(io.read("*n")), 0, 0
local input = io.read("*a")
local values = {}
for s in input:gmatch("%S+") do
    values[#values + 1] = s
end
-- 逐个处理输入
for i = 1, n do
    local s = values[i]
    local x = tonumber(s)  -- 尝试转换为数字
    -- 校验：能转为数字 且 在[-1000, 1000]范围内 且 格式合法（最多两位小数）
    -- 正则说明：^[+-]? 可选正负号，%d+ 整数部分，%.?%d?%d? 可选小数部分（最多两位）
    local format_ok = s and (s:match("^[+-]?%d+$") or s:match("^[+-]?%d+%.%d%d?$"))
    if x and x >= -1000 and x <= 1000 and format_ok then
        sum, c = sum + x, c + 1  -- 累加求和并计数
    else
        -- 非法数字，输出错误信息
        print("ERROR: " .. s .. " is not a legal number")
    end
end
-- 输出结果
if c == 0 then
    -- 没有合法数字，输出Undefined
    print("The average of 0 numbers is Undefined")
else
    -- 输出平均值，注意单复数处理
    print(string.format("The average of %d number%s is %.2f", c, c == 1 and "" or "s", sum / c))
end
