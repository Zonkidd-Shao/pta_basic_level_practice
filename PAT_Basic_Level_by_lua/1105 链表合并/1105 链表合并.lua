-- 题目编号: 1105 链表合并
-- 实现原理: 读取两个链表头地址和所有节点信息存入哈希表。从两个头地址分别遍历链表，将所有节点收集到一个数组中，按数据域大小排序，然后按顺序输出每个节点的地址、数据和下一节点地址。

-- 读取两个链表头地址和节点总数
local h1, h2, n = io.read("l"):match("^(%S+)%s+(%S+)%s+(%d+)$")
n = tonumber(n)
local d = {}  -- 哈希表存储所有节点，key为地址，value为{地址, 数据, 下一节点地址}

-- 读取所有节点信息
for i = 1, n do
    local a, x, b = io.read("l"):match("^(%S+)%s+([%-]?%d+)%s+(%S+)$")
    d[a] = {a, tonumber(x), b}
end

-- 从两个链表头出发，收集所有节点到数组a中
local a = {}
for _, h in ipairs({h1, h2}) do
    while h ~= "-1" do
        a[#a + 1] = d[h]
        h = d[h][3]  -- 移动到下一个节点
    end
end

-- 按数据域从小到大排序
table.sort(a, function(x, y) return x[2] < y[2] end)

-- 按排序后的顺序输出，下一节点地址为数组中下一个节点的地址
for i, x in ipairs(a) do
    print(x[1] .. " " .. x[2] .. " " .. (a[i + 1] and a[i + 1][1] or "-1"))
end
