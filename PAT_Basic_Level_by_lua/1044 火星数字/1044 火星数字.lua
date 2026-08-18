-- 题目编号: 1044 火星数字
-- 实现原理: 火星文采用十三进制。低位表 low 对应 0~12 的火星文，高位表 high 对应 13 的倍数。数字转火星文时按十三进制拆分高低位拼接；火星文转数字时查表累加每位对应的数值。

-- low: 低位火星文（0~12），数组索引从 1 开始对应数字 0~12
local low = { "tret", "jan", "feb", "mar", "apr", "may", "jun", "jly", "aug", "sep", "oct", "nov", "dec" }

-- high: 高位火星文（13的倍数），high[i] 对应数字 (i-1)*13
local high = { "", "tam", "hel", "maa", "huh", "tou", "kes", "hei", "elo", "syy", "lok", "mer", "jou" }

-- value: 火星文到数字的映射表（反向查找）
local value = {}
for i, s in ipairs(low) do value[s] = i - 1 end
for i = 2, #high do value[high[i]] = (i - 1) * 13 end

-- 读取查询次数 n
local n = tonumber(io.read())

-- 逐个处理查询
for _ = 1, n do
    local s = io.read("l")
    
    if s:match("^%d+$") then
        -- 输入是数字，转换为火星文
        local x = tonumber(s)
        if x >= 13 then
            -- 大于等于13，有高位部分
            local result = high[math.floor(x / 13) + 1]
            -- 低位不为0时加上低位火星文
            if x % 13 > 0 then
                result = result .. " " .. low[x % 13 + 1]
            end
            print(result)
        else
            -- 小于13，只有低位
            print(low[x + 1])
        end
    else
        -- 输入是火星文，转换为数字
        local total = 0
        -- 遍历每个火星文单词，累加对应数值
        for word in s:gmatch("%a+") do
            total = total + value[word]
        end
        print(total)
    end
end
