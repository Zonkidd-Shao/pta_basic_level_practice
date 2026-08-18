-- 题目编号: 1047 编程团体赛
-- 实现原理: 通过正则从"队伍编号-队员编号 得分"中提取队伍编号，累加各队伍总分。遍历哈希表找出总分最高的队伍编号和分数并输出。

-- n: 参赛人数，score: 存储各队伍的总分
local n, score = tonumber(io.read()), {}

-- 遍历每条记录，累加各队伍的总分
for _ = 1, n do
    -- 从输入行中提取队伍编号 id 和得分 s（格式：队伍编号-队员编号 得分）
    local id, s = io.read("l"):match("^(%d+)%-%d+%s+(%d+)$")
    score[id] = (score[id] or 0) + tonumber(s)
end

-- best: 最高分队伍编号，maximum: 最高分数
local best, maximum = nil, -1

-- 遍历所有队伍，找出总分最高的队伍
for id, s in pairs(score) do
    if s > maximum then
        best, maximum = id, s
    end
end

-- 输出冠军队伍编号和总分
print(best .. " " .. maximum)
