-- 题目编号: 1058 选择题
-- 实现原理: 读取每道题的满分、选项数和正确答案，用表存储正确答案选项。对每个学生，用正则提取每道题所选选项，完全匹配正确答案则得满分，否则该题错误计数加1。最后输出每个学生的总分，以及错误次数最多的题号（若全对则输出Too simple）。
-- n: 学生人数，m: 题目数量
-- score: 每题满分，key: 每题正确答案（哈希表），wrong: 每题错误次数
local n, m = io.read("*n"), io.read("*n")
io.read("l")  -- 跳过第一行剩余内容
local score, key, wrong = {}, {}, {}
-- 读取每道题的信息
for i = 1, m do
    local t = {}
    -- 分割该行的所有字段
    for x in io.read("l"):gmatch("%S+") do
        t[#t + 1] = x
    end
    score[i] = tonumber(t[1])  -- 该题满分
    key[i] = {}  -- 正确答案选项集合
    wrong[i] = 0  -- 错误次数初始化为0
    -- 存储正确答案选项到哈希表（t[3]是正确选项个数，后面是具体选项）
    for j = 1, tonumber(t[3]) do
        key[i][t[j + 3]] = true
    end
end
-- 处理每个学生的答题情况
for i = 1, n do
    local line = io.read("l")  -- 读取该学生的所有答案
    local total, q = 0, 0  -- total: 总分，q: 当前题号
    -- 用正则提取每道题的答案（括号内的内容）
    for part in line:gmatch("%(([^)]*)%)") do
        q = q + 1
        local got = {}
        -- 提取学生选的所有选项
        for x in part:gmatch("%a") do
            got[x] = true
        end
        -- 判断答案是否完全正确
        local ok = true
        -- 检查正确答案中的每个选项学生是否都选了
        for x in pairs(key[q]) do
            if not got[x] then
                ok = false
            end
        end
        -- 检查学生选的每个选项是否都在正确答案中
        for x in pairs(got) do
            if not key[q][x] then
                ok = false
            end
        end
        if ok then
            total = total + score[q]  -- 答对加分
        else
            wrong[q] = wrong[q] + 1  -- 答错，该题错误次数加1
        end
    end
    print(total)  -- 输出该学生的总分
end
-- 找出错误次数最多的题目
local z = 0
for i = 1, m do
    z = math.max(z, wrong[i])
end
if z == 0 then
    print("Too simple")  -- 全部答对
else
    -- 收集所有错误次数等于最大值的题号
    local o = {}
    for i = 1, m do
        if wrong[i] == z then
            o[#o + 1] = i
        end
    end
    print(z .. " " .. table.concat(o, " "))
end
