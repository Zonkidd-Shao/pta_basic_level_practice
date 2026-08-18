-- 题目编号: 1073 多选题常见计分法
-- 实现原理: 按题目存储正确答案和各选项错误次数，逐题比对学生的选项与正确答案：漏选得一半分，错选或漏选均记录错误选项。最后找出错误次数最多的选项并输出。
-- n: 学生人数，m: 题目数量
local n, m = io.read("*n"), io.read("*n")
io.read("l")  -- 跳过第一行剩余内容
-- sc: 每题满分，key: 每题正确答案（哈希表）
-- opts: 每题选项数，err: 每题各选项错误次数
local sc, key, opts, err = {}, {}, {}, {}
-- 读取每道题的信息
for i = 1, m do
    local z = {}
    -- 分割该行所有字段
    for x in io.read("l"):gmatch("%S+") do
        z[#z + 1] = x
    end
    sc[i] = tonumber(z[1])  -- 该题满分
    opts[i] = tonumber(z[2])  -- 选项总数
    key[i] = {}  -- 正确答案选项集合
    err[i] = {}  -- 各选项错误次数
    -- 初始化每个选项错误次数为0（a, b, c, ...）
    for j = 1, opts[i] do
        err[i][string.char(96 + j)] = 0
    end
    -- 存储正确答案选项
    for j = 1, tonumber(z[3]) do
        key[i][z[j + 3]] = true
    end
end
-- 处理每个学生的答题情况
for i = 1, n do
    local sum, q = 0, 0  -- sum: 总分，q: 当前题号
    -- 提取每道题的答案（括号内的内容）
    for p in io.read("l"):gmatch("%(([^)]*)%)") do
        q = q + 1
        local got = {}
        -- 提取学生选的所有选项
        for x in p:gmatch("%a") do
            got[x] = true
        end
        local bad = false  -- 是否有选错的选项（选了不正确的）
        local all = true   -- 是否所有正确选项都选了
        -- 遍历每个选项，统计错误
        for j = 1, opts[q] do
            local x = string.char(96 + j)
            -- 该选项学生选择情况与正确答案不一致
            if key[q][x] ~= got[x] then
                err[q][x] = err[q][x] + 1  -- 该选项错误次数加1
                if key[q][x] then
                    all = false  -- 正确的选项没选（漏选）
                else
                    bad = true   -- 错误的选项选了（错选）
                end
            end
        end
        -- 计分：没有错选才得分
        -- 全对得满分，漏选得一半分
        if not bad then
            sum = sum + (all and sc[q] or sc[q] / 2)
        end
    end
    -- 输出该学生总分，保留一位小数
    print(string.format("%.1f", sum))
end
-- 找出错误次数最多的次数
local mx = 0
for i = 1, m do
    for _, v in pairs(err[i]) do
        mx = math.max(mx, v)
    end
end
if mx == 0 then
    print("Too simple")  -- 没有错误，全部答对
else
    -- 输出所有错误次数等于最大值的选项
    for i = 1, m do
        for j = 1, opts[i] do
            local x = string.char(96 + j)
            if err[i][x] == mx then
                print(mx .. " " .. i .. "-" .. x)
            end
        end
    end
end
