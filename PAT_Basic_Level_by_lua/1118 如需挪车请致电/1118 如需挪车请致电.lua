-- 题目编号: 1118 如需挪车请致电
-- 实现原理: 解析11行输入，每行可能为拼音数字（直接映射）、sqrt开方运算或二元算术运算，计算结果取整后拼接输出。

-- 拼音数字到阿拉伯数字的映射
local w = {
    ling = 0, yi = 1, er = 2, san = 3, si = 4,
    wu = 5, liu = 6, qi = 7, ba = 8, jiu = 9
}
local o = {}  -- 存储每一位电话号码

-- 处理11位电话号码
for i = 1, 11 do
    local s = io.read("l")  -- 读取一行输入
    -- 尝试匹配二元算术运算：数字 + 运算符 + 数字
    local a, op, b = s:match("^(%d+)([+%-%*/%%%^])(%d+)$")
    local x  -- 存储计算结果
    
    if w[s] then
        -- 情况1：是拼音数字，直接映射
        x = w[s]
    elseif s:sub(1, 4) == "sqrt" then
        -- 情况2：是sqrt开方运算，对后面的数字开平方
        x = math.sqrt(tonumber(s:sub(5)))
    else
        -- 情况3：是二元算术运算，根据运算符计算
        a, b = tonumber(a), tonumber(b)
        if op == "+" then
            x = a + b
        elseif op == "-" then
            x = a - b
        elseif op == "*" then
            x = a * b
        elseif op == "/" then
            x = a / b
        elseif op == "%" then
            x = a % b
        else
            x = a ^ b  -- 幂运算
        end
    end
    
    -- 结果取整后加入电话号码
    o[#o + 1] = math.floor(x)
end

-- 拼接成完整的电话号码输出
print(table.concat(o))
