-- 题目编号: 1032 挖掘机技术哪家强
-- 实现原理: 用哈希表（数组）以学校编号为键累加总分，遍历所有学校找出最高分及其编号，输出结果。

-- 读取参赛队伍数量 n，score 表存储各学校的总分
local n, score = tonumber(io.read()), {}

-- 遍历每条记录，累加各学校的总分
for _ = 1, n do
    local id, value = io.read("*n"), io.read("*n")
    -- 如果该学校还没有记录，初始化为 0，然后加上当前分数
    score[id] = (score[id] or 0) + value
end

-- best: 最高分学校编号，maximum: 最高分数
local best, maximum = nil, -1

-- 遍历所有学校，找出总分最高的学校
for id, value in pairs(score) do
    if value > maximum then
        best, maximum = id, value
    end
end

-- 输出最高分学校编号和总分
print(best .. " " .. maximum)
