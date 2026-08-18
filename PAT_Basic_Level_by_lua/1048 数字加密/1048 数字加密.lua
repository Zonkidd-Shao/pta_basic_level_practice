-- 题目编号: 1048 数字加密
-- 实现原理: 将两个数字字符串反转后按位处理，位数不足补 0。奇数位（从 1 开始）将两数相加模 13，结果 10~12 映射为 J/Q/K；偶数位计算差值模 10。最后将结果反转输出。

-- 读取两个数字字符串 a 和 b
local a, b = io.read("l"):match("^(%d+)%s+(%d+)$")

-- 反转字符串，方便从低位到高位按位处理
a, b = a:reverse(), b:reverse()
local out = {}

-- 按位处理，取两个数中较长的长度
for i = 1, math.max(#a, #b) do
    -- 取出当前位的数字，位数不足则补 0
    local x = tonumber(a:sub(i, i)) or 0
    local y = tonumber(b:sub(i, i)) or 0
    
    if i % 2 == 1 then
        -- 奇数位（第1、3、5...位）：(x + y) % 13
        -- 结果 0-9 直接用数字，10→J，11→Q，12→K
        local r = (x + y) % 13
        if r == 10 then
            out[#out + 1] = "J"
        elseif r == 11 then
            out[#out + 1] = "Q"
        elseif r == 12 then
            out[#out + 1] = "K"
        else
            out[#out + 1] = tostring(r)
        end
    else
        -- 偶数位（第2、4、6...位）：(y - x + 10) % 10
        -- 加 10 再取模是为了保证结果非负
        out[#out + 1] = tostring((y - x + 10) % 10)
    end
end

-- 反转结果并输出（因为之前是从低位开始处理的）
print(table.concat(out):reverse())
