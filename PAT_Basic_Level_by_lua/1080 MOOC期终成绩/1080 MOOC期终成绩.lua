-- 题目编号: 1080 MOOC期终成绩
-- 实现原理: 依次读取编程、期中、期末三部分成绩，存入以学号为键的哈希表。筛选编程成绩≥200的学生，若期中成绩高于期末则按四六开计算总评，否则总评等于期末成绩，筛选总评≥60的学生按成绩降序、学号升序排序输出。
local p, m, n = io.read("*n"), io.read("*n"), io.read("*n")  -- p:编程成绩人数，m:期中成绩人数，n:期末成绩人数
io.read("l")  -- 消耗第一行末尾的换行符
local s = {}  -- 以学号为键的哈希表，存储每个学生的信息

-- 读取编程成绩
for i = 1, p do
    local id, g = io.read("l"):match("^(%S+)%s+(%d+)$")  -- 正则匹配学号和成绩
    s[id] = {id, tonumber(g), -1, -1}  -- 存储：学号、编程分、期中分(-1表示缺考)、期末分(-1表示缺考)
end

-- 读取期中成绩
for i = 1, m do
    local id, g = io.read("l"):match("^(%S+)%s+(%d+)$")  -- 正则匹配学号和成绩
    s[id] = s[id] or {id, -1, -1, -1}  -- 若学号不存在则创建（编程缺考）
    s[id][3] = tonumber(g)  -- 更新期中成绩
end

-- 读取期末成绩
for i = 1, n do
    local id, g = io.read("l"):match("^(%S+)%s+(%d+)$")  -- 正则匹配学号和成绩
    s[id] = s[id] or {id, -1, -1, -1}  -- 若学号不存在则创建
    s[id][4] = tonumber(g)  -- 更新期末成绩
end

local a = {}  -- 存储符合条件的学生列表
-- 遍历所有学生，筛选有效成绩
for _, v in pairs(s) do
    -- 只有编程成绩≥200的学生才考虑
    if v[2] >= 200 then
        local g = v[4]  -- 默认总评等于期末成绩
        -- 若期中成绩高于期末成绩，则按期中40%+期末60%计算
        if v[3] > v[4] then
            g = math.floor(.4 * v[3] + .6 * v[4] + .5)  -- 四舍五入取整
        end
        -- 总评≥60分才进入最终名单
        if g >= 60 then
            v[5] = g  -- 存储总评成绩
            a[#a + 1] = v
        end
    end
end

-- 排序规则：总评降序，总评相同则学号升序
table.sort(a, function(x, y)
    if x[5] ~= y[5] then return x[5] > y[5] end
    return x[1] < y[1]
end)

-- 输出结果：学号、编程分、期中分、期末分、总评
for _, v in ipairs(a) do
    print(v[1] .. " " .. v[2] .. " " .. v[3] .. " " .. v[4] .. " " .. v[5])
end
