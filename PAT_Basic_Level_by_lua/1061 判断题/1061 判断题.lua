-- 题目编号: 1061 判断题
-- 实现原理: 读取标准答案和每个学生的作答，逐题比对得分，同时统计每道题的错误次数，最后找出错误次数最多的题号并输出。
-- 将所有输入读入一个数组，便于按顺序处理
local t = {}
for x in io.read("a"):gmatch("%S+") do
    t[#t + 1] = x
end
-- n: 学生人数，m: 题目数量
local n, m = tonumber(t[1]), tonumber(t[2])
-- score: 每题分值，key: 每题正确答案
local score, key = {}, {}
local q = 3  -- 当前处理到的数组下标
for i = 1, m do
    score[i] = tonumber(t[q])
    q = q + 1
end
-- 读取m道题的正确答案
for i = 1, m do
    key[i] = t[q]
    q = q + 1
end
-- 处理每个学生的答题情况
for i = 1, n do
    local s = 0  -- 该学生得分
    for j = 1, m do
        local x = t[q]
        q = q + 1
        if x == key[j] then
            s = s + score[j]
        else
        end
    end
    print(s)
end
