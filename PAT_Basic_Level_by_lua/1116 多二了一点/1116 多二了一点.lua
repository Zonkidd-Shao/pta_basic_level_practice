-- 题目编号: 1116 多二了一点
-- 实现原理: 将数字字符串平分为前后两半，分别转为数值，判断后半减去前半是否等于2，按格式输出结果。

local s = io.read("l")
local n = #s

local function normalize(x)
    x = x:gsub("^0+", "")
    return x == "" and "0" or x
end

local function compare(x, y)
    if #x ~= #y then return #x < #y and -1 or 1 end
    if x == y then return 0 end
    return x < y and -1 or 1
end

local function subtract(x, y)
    local result, borrow = {}, 0
    for i = #x, 1, -1 do
        local digit = tonumber(x:sub(i, i)) - borrow
        local other_index = i - #x + #y
        local other = other_index >= 1 and tonumber(y:sub(other_index, other_index)) or 0
        if digit < other then
            digit = digit + 10
            borrow = 1
        else
            borrow = 0
        end
        result[#result + 1] = digit - other
    end
    local out = {}
    for i = #result, 1, -1 do out[#out + 1] = tostring(result[i]) end
    return normalize(table.concat(out))
end

-- 如果长度为奇数，无法平分，输出错误
if n % 2 == 1 then
    print("Error: " .. n .. " digit(s)")
else
    local m = n / 2
    local y = normalize(s:sub(1, m))
    local x = normalize(s:sub(m + 1))
    -- 判断后半减前半是否等于2
    if compare(x, y) >= 0 and subtract(x, y) == "2" then
        print("Yes: " .. x .. " - " .. y .. " = 2")
    else
        print("No: " .. x .. " - " .. y .. " != 2")
    end
end
