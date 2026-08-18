-- 题目编号: 1003 我要通过！
-- 实现原理: 根据PAT规则判断字符串是否合法：只能包含P、A、T三种字符；P和T各出现一次且P在T之前；P前A数×PT中间A数 = T后A数。遍历字符串进行校验。

-- 读取测试用例的数量
local n = tonumber(io.read())

-- 循环处理每个测试用例
for _ = 1, n do
    -- 读取当前测试用例的字符串
    local s = io.read("l")
    -- 标记字符串是否合法，初始为true
    local valid = true
    -- 记录P和T在字符串中的位置
    local p, t = nil, nil

    -- 遍历字符串的每个字符
    for i = 1, #s do
        -- 取出第i个字符
        local ch = s:sub(i, i)
        -- 检查字符是否为PAT中的一种
        if ch ~= "A" and ch ~= "P" and ch ~= "T" then
            -- 出现非法字符，标记为不合法并跳出循环
            valid = false
            break
        end
        -- 如果当前字符是P
        if ch == "P" then
            -- 如果之前已经出现过P，则不合法（P只能出现一次）
            if p then
                valid = false
                break
            end
            -- 记录P的位置
            p = i
        elseif ch == "T" then
            -- 如果之前已经出现过T，则不合法（T只能出现一次）
            if t then
                valid = false
                break
            end
            -- 记录T的位置
            t = i
        end
    end

    -- 进一步校验：P和T都必须存在，且P必须在T之前
    if not p or not t or p > t then
        valid = false
    -- P和T之间必须至少有一个A（中间不能是空的）
    elseif t - p == 1 then
        valid = false
    -- 核心规则：P前的A的数量 × PT中间的A的数量 = T后面的A的数量
    elseif valid then
        -- P前面的A的个数
        local left = p - 1
        -- P和T之间的A的个数
        local middle = t - p - 1
        -- T后面的A的个数
        local right = #s - t
        -- 验证 left × middle == right 是否成立
        valid = left * middle == right
    end

    -- 输出结果：合法输出YES，不合法输出NO
    print(valid and "YES" or "NO")
end
