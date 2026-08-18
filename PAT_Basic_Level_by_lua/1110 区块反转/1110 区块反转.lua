-- 题目编号: 1110 区块反转
-- 实现原理: 读取链表节点信息存入哈希表，从头节点遍历链表将节点按顺序存入数组a。然后将数组a按每k个节点分为一组，组间反转（即区块整体顺序反转），再按新顺序输出每个节点的地址、数据和下一节点地址。

-- 读取链表头地址、节点总数、每k个节点为一组
local head, n, k = io.read("l"):match("^(%S+)%s+(%d+)%s+(%d+)$")
n, k = tonumber(n), tonumber(k)
local d = {}  -- 哈希表存储所有节点，key为地址

-- 读取所有节点信息
for i = 1, n do
    local a, x, b = io.read("l"):match("^(%S+)%s+([%-]?%d+)%s+(%S+)$")
    d[a] = {a, tonumber(x), b}  -- {地址, 数据, 下一节点地址}
end

-- 从头节点遍历链表，将节点按顺序存入数组a
local a = {}
while head ~= "-1" do
    a[#a + 1] = d[head]
    head = d[head][3]  -- 移动到下一个节点
end

local b = {}  -- 存储分组后的结果

-- 按每k个节点分为一组，并将每组插入到b的开头（实现组间反转）
for i = 1, #a, k do
    local q = {}  -- 当前组的节点
    -- 收集当前组的k个节点（不足k个则取剩余的）
    for j = i, math.min(i + k - 1, #a) do
        q[#q + 1] = a[j]
    end
    table.insert(b, 1, q)  -- 将当前组插入到b的开头，实现区块反转
end

-- 将所有组的节点按顺序合并到输出数组o中
local o = {}
for _, q in ipairs(b) do
    for _, x in ipairs(q) do
        o[#o + 1] = x
    end
end

-- 按新顺序输出每个节点
for i, x in ipairs(o) do
    -- 下一节点地址为数组中下一个节点的地址，最后一个节点为-1
    print(x[1] .. " " .. x[2] .. " " .. (o[i + 1] and o[i + 1][1] or "-1"))
end
