-- 题目编号: 1016 部分A+B
-- 实现原理: 将数字转为字符串，遍历每个数位，将与指定数字相同的数位拼接成新数，最后将两个新数相加输出

-- 读取4个输入：正整数A、DA、正整数B、DB
local a, da, b, db = io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n")

-- 辅助函数：从number中提取所有等于digit的数位，拼接成新数字
local function extract(number, digit)
    -- 存储提取出的数字字符串
    local result = ""
    -- 将数字转为字符串，遍历每一位数字
    for ch in tostring(number):gmatch("%d") do
        -- 如果当前位等于指定数字，拼接到结果中
        if tonumber(ch) == digit then
            result = result .. ch
        end
    end
    -- 返回数字结果，如果为空字符串则返回0
    return tonumber(result) or 0
end

-- 计算PA + PB并输出
print(extract(a, da) + extract(b, db))
