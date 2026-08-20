-- 题目编号: 1055 集体照
-- 实现原理: 将所有人按身高降序（同名按字母升序）排序。最后一排人数为n-(k-1)*floor(n/k)，其余每排为floor(n/k)。每排先取中间位置（ceil(z/2)）放最高的那个人，然后左右交替从排序后的人员中依次插入，最终输出每排的名字。
-- 读取总人数n和排数k
local n, k = io.read("*n"), io.read("*n")
io.read("l")
local a = {}
-- 读取每个人的姓名和身高
for i = 1, n do
    local x, h = io.read("l"):match("^(%S+)%s+(%d+)$")
    a[i] = {x, tonumber(h)}
end
-- 排序：按身高降序，身高相同则按姓名字母升序
table.sort(a, function(x, y)
    if x[2] ~= y[2] then return x[2] > y[2] end
    return x[1] < y[1]
end)
local p = 1  -- 当前取到第几个（排序后的索引）
-- 逐排处理
for r = 1, k do
    -- 计算该排人数z：第一排（最后一排在输出中是第一排）人数特殊
    -- 最后一排（输出时的第一排）人数 = n - (k-1) * floor(n/k)
    -- 其他排人数 = floor(n/k)
    local z = r == 1 and n - (k - 1) * math.floor(n / k) or math.floor(n / k)
    local b = {}  -- 该排人员数组
    local mid = math.floor(z / 2) + 1  -- 中间位置
    -- 中间位置放最高的人（当前排序后第一个）
    b[mid] = a[p]
    p = p + 1
    -- 左右交替插入：先左后右，依次插入
    local l = mid - 1  -- 左侧位置指针
    local q = mid + 1  -- 右侧位置指针
    while l >= 1 or q <= z do
        if l >= 1 then
            b[l] = a[p]
            p = p + 1
            l = l - 1
        end
        if q <= z then
            b[q] = a[p]
            p = p + 1
            q = q + 1
        end
    end
    -- 提取该排的姓名数组并输出
    local o = {}
    for i = 1, z do
        o[i] = b[i][1]
    end
    print(table.concat(o, " "))
end
