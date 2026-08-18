-- 题目编号: 1072 开学寄语
-- 实现原理: 读取违禁物品列表存入哈希表，逐位学生检查其携带物品，若发现违禁品则记录并输出该学生信息及违禁品编号。
-- n: 学生人数，m: 违禁物品数量
local n, m = io.read("*n"), io.read("*n")
-- bad: 违禁物品集合（哈希表）
local bad = {}
for i = 1, m do
    bad[io.read("l")] = true
end
-- stu: 携带违禁品的学生数，item: 查获的违禁品总数
local stu, item = 0, 0
-- 逐个检查学生
for i = 1, n do
    -- name: 学生姓名，k: 携带物品数量
    local name, k = io.read("l"):match("^(%S+)%s+(%d+)$")
    local a = {}  -- 存储该学生携带的违禁品
    for j = 1, tonumber(k) do
        local x = io.read("*n")
        if bad[x] then
            -- 违禁品，格式化为四位数字编号
            a[#a + 1] = string.format("%04d", x)
            item = item + 1
        end
    end
    -- 该学生携带了违禁品
    if #a > 0 then
        stu = stu + 1
        print(name .. ": " .. table.concat(a, " "))
    end
end
-- 输出携带违禁品的学生总数和违禁品总数
print(stu .. " " .. item)
