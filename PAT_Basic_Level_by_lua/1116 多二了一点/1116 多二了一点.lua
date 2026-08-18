-- 题目编号: 1116 多二了一点
-- 实现原理: 将数字字符串平分为前后两半，分别转为数值，判断后半减去前半是否等于2，按格式输出结果。

local s = io.read("l")  -- 读取输入的数字字符串
local n = #s             -- 字符串长度

-- 如果长度为奇数，无法平分，输出错误
if n % 2 == 1 then
    print("Error: " .. n .. " digit(s)")
else
    local m = n / 2  -- 一半的长度
    local y = tonumber(s:sub(1, m))      -- 前半部分数值
    local x = tonumber(s:sub(m + 1))     -- 后半部分数值
    -- 判断后半减前半是否等于2
    if x - y == 2 then
        print("Yes: " .. x .. " - " .. y .. " = 2")
    else
        print("No: " .. x .. " - " .. y .. " != 2")
    end
end
