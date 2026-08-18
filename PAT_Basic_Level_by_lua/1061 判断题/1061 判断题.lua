-- 题目编号: 1061 判断题
-- 实现原理: 读取标准答案和每个学生的作答，逐题比对得分，同时统计每道题的错误次数，最后找出错误次数最多的题号并输出。
-- 将所有输入读入一个数组，便于按顺序处理
local t = {}
for x in io.read("a"):gmatch("%S+") do
    t[#t + 1] = x
end
-- n: 学生人数，m: 题目数量
local n, m = tonumber(t[1]), tonumber(t[2])
-- key: 每题正确答案，wrong: 每题错误次数
local key, wrong = {}, {}
local q = 3  -- 当前处理到的数组下标
-- 读取m道题的正确答案
for i = 1, m do
    key[i] = t[q]
    wrong[i] = 0
    q = q + 1
end
-- 处理每个学生的答题情况
for i = 1, n do
    local s = 0  -- 该学生得分
    for j = 1, m do
        local x = t[q]
        q = q + 1
        if x == key[j] then
            s = s + 1  -- 答对得1分
        else
            wrong[j] = wrong[j] + 1  -- 答错，该题错误次数加1
        end
    end
    print(s)  -- 输出该学生得分
end
-- 找出错误次数最多的次数
local z = 0
for i = 1, m do
    z = math.max(z, wrong[i])
end
-- 收集所有错误次数等于最大值的题号
local a = {}
for i = 1, m do
    if wrong[i] == z then
        a[#a + 1] = i
    end
end
-- 输出最大错误次数和对应的题号
print(z .. " " .. table.concat(a, " "))
