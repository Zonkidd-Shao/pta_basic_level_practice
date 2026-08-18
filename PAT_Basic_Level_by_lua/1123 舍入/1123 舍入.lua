-- 题目编号: 1123 舍入
-- 实现原理: 将数字按小数点拆分为整数和小数部分，小数部分补足到d+1位，根据第d+1位是否≥5决定进位，处理进位后按格式输出。

local n, d = io.read("*n"), io.read("*n")  -- n个数字，保留d位小数
io.read("l")  -- 读取并丢弃第一行剩余的换行符

-- 处理每个数字
for i = 1, n do
    local s = io.read("l")  -- 读取数字字符串
    -- 拆分为整数部分a和小数部分b
    local a, b = s:match("^(%d+)%.(%d+)$")
    b = (b or "") .. string.rep("0", d + 1)  -- 小数部分补足到d+1位（不足补0）
    
    local keep = b:sub(1, d)  -- 保留的前d位小数
    
    -- 根据第d+1位判断是否需要进位
    if tonumber(b:sub(d + 1, d + 1)) >= 5 then
        -- 需要进位：整数部分和保留的小数部分拼成一个数，加1
        local z = tonumber((a .. keep)) + 1
        local q = tostring(z)
        
        -- 处理进位后的结果，重新拆分整数和小数部分
        if d > 0 then
            -- 补足位数（进位可能导致位数增加，需要在右边补0）
            q = q .. string.rep("0", math.max(0, #a + d - #q))
            a = q:sub(1, #q - d)         -- 新的整数部分
            keep = q:sub(#q - d + 1)     -- 新的小数部分
        end
    end
    
    -- 按格式输出：d>0输出整数.小数，否则只输出整数
    print(d > 0 and a .. "." .. keep or a)
end
