-- 题目编号: 1059 C语言竞赛
-- 实现原理: 用哈希表存储参赛者ID到排名的映射。定义素数判断函数。对每个查询，若ID不在哈希表中则输出"Are you kidding?"；若已查询过则输出"Checked"；否则根据排名输出对应奖项：第1名"Mystery Award"，素数排名"Minion"，其他"Chocolate"。
-- n: 参赛人数，r: ID到排名的映射表
local n, r = tonumber(io.read()), {}
-- 读取参赛者ID，按顺序记录排名（第i名）
for i = 1, n do
    r[io.read("l")] = i
end
-- 素数判断函数
local function p(x)
    if x < 2 then return false end  -- 小于2不是素数
    -- 从2到sqrt(x)遍历，若能整除则不是素数
    for i = 2, math.floor(math.sqrt(x)) do
        if x % i == 0 then return false end
    end
    return true
end
-- seen: 记录已查询过的ID，避免重复颁奖
local seen = {}
-- 处理查询
for _ = 1, tonumber(io.read()) do
    local x = io.read("l")  -- 查询的ID
    if not r[x] then
        -- ID不存在
        print(x .. ": Are you kidding?")
    elseif seen[x] then
        -- 已查询过
        print(x .. ": Checked")
    else
        seen[x] = true  -- 标记为已查询
        -- 根据排名颁奖：第1名Mystery Award，素数排名Minion，其他Chocolate
        print(x .. ": " .. (r[x] == 1 and "Mystery Award" or p(r[x]) and "Minion" or "Chocolate"))
    end
end
