-- 题目编号: 1121 祖传好运
-- 实现原理: 对每个数，从左到右逐位构造前缀数值，判断该前缀是否能被其位数j整除，若所有前缀均满足条件则输出"Yes"。

local k = tonumber(io.read())  -- 读取测试用例数量

-- 处理每个测试用例
for i = 1, k do
    local s = io.read("*n")  -- 读取输入的数
    s = tostring(s)           -- 转为字符串处理
    local x = 0               -- 当前前缀的数值
    local ok = true           -- 标记是否所有前缀都满足条件
    
    -- 从左到右逐位处理
    for j = 1, #s do
        -- 构造当前j位的前缀数值
        x = x * 10 + tonumber(s:sub(j, j))
        -- 判断当前前缀是否能被位数j整除
        if x % j ~= 0 then
            ok = false
            break  -- 不满足条件，提前退出
        end
    end
    
    print(ok and "Yes" or "No")
end
