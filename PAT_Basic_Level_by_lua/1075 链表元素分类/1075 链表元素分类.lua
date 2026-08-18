-- 题目编号: 1075 链表元素分类
-- 实现原理: 遍历链表将所有结点按数据域值分为三类（负数、≤K的正数、>K的正数），按分类顺序重新拼接链表，最后输出重排后的链表各结点信息。
-- head: 链表头结点地址，n: 结点总数，k: 分界值K
local head, n, k = io.read("l"):match("^(%S+)%s+(%d+)%s+([%-]?%d+)$")
n, k = tonumber(n), tonumber(k)
-- d: 结点字典（地址 -> {地址, 数据, 下一个地址}）
local d = {}
-- 读取所有结点
for i = 1, n do
    local a, x, b = io.read("l"):match("^(%S+)%s+([%-]?%d+)%s+(%S+)$")
    d[a] = {a, tonumber(x), b}
end
-- g: 三类结点的数组
-- g[1]: 负数，g[2]: [0, K]之间的数，g[3]: 大于K的数
local g = {{}, {}, {}}
while head ~= "-1" do
    local x = d[head]
    -- 根据数据值分类
    local q = x[2] < 0 and 1 or x[2] <= k and 2 or 3
    g[q][#g[q] + 1] = x
    head = x[3]  -- 移动到下一个结点
end
-- 按分类顺序拼接：负数 -> 0~K -> 大于K
local a = {}
for i = 1, 3 do
    for _, x in ipairs(g[i]) do
        a[#a + 1] = x
    end
end
-- 输出重排后的链表
for i, x in ipairs(a) do
    -- 下一个结点的地址，最后一个结点为-1
    print(x[1] .. " " .. x[2] .. " " .. (a[i + 1] and a[i + 1][1] or "-1"))
end
