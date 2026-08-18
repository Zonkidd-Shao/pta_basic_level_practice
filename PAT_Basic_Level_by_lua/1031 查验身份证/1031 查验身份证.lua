-- 题目编号: 1031 查验身份证
-- 实现原理: 对前17位数字加权求和，结果模11得到校验码，与第18位比对。记录所有无效身份证号，全部通过则输出"All passed"。

-- 前17位数字对应的权重系数
local weights = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 }

-- 模11结果对应的校验码（索引从1开始，对应模11结果0~10）
local codes = { "1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2" }

-- 读取身份证数量 n，invalid 存储所有无效身份证号
local n, invalid = tonumber(io.read()), {}

-- 逐个检验每个身份证号
for _ = 1, n do
    local id, sum, valid = io.read("l"), 0, true
    
    -- 对前17位数字加权求和，并检查是否都是数字
    for i = 1, 17 do
        local d = tonumber(id:sub(i, i))
        -- 如果某一位不是数字，标记为无效
        if not d then
            valid = false
            break
        end
        sum = sum + d * weights[i]
    end
    
    -- 检查身份证是否有效：前17位都是数字 且 校验码正确
    if not valid or id:sub(18, 18) ~= codes[sum % 11 + 1] then
        invalid[#invalid + 1] = id
    end
end

-- 输出结果：全部通过则输出 "All passed"，否则逐行输出无效身份证号
if #invalid == 0 then
    print("All passed")
else
    for _, id in ipairs(invalid) do
        print(id)
    end
end
