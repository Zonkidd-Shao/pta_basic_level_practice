-- 题目编号: 1025 反转链表
-- 实现原理: 用哈希表存储每个节点的地址、值和下一节点地址。从链表头开始按顺序遍历得到有序链表数组，然后每K个节点为一组进行组内反转，最后按新顺序输出每个节点的地址、值和下一节点地址。

-- 读取第一行：首节点地址、节点总数n、每K个节点反转一次
local head, n, k = io.read("l"):match("^(%S+)%s+(%d+)%s+(%d+)$")
-- 将n和k转换为数字
n, k = tonumber(n), tonumber(k)

-- 用哈希表存储所有节点，key是节点地址，value是节点信息表
local nodes = {}
-- 读取n个节点的信息
for _ = 1, n do
    -- 提取地址、值、下一个节点的地址
    local address, value, next_address = io.read("l"):match("^(%S+)%s+(%-?%d+)%s+(%S+)$")
    nodes[address] = {
        address = address,
        value = tonumber(value),
        next = next_address
    }
end

-- 按链表顺序存储的节点数组
local list = {}
-- 当前指针，从首节点开始
local p = head
-- 遍历链表，直到遇到-1（链表结束标志）
while p ~= "-1" and nodes[p] do
    -- 将当前节点加入有序数组
    list[#list + 1] = nodes[p]
    -- 指针移到下一个节点
    p = nodes[p].next
end

-- 每K个节点一组进行反转
for start = 1, #list - k + 1, k do
    -- 组的左右边界
    local left, right = start, start + k - 1
    -- 双指针法：从两端向中间交换元素，实现组内反转
    while left < right do
        -- 交换左右两个位置的节点
        list[left], list[right] = list[right], list[left]
        -- 左指针右移，右指针左移
        left, right = left + 1, right - 1
    end
end

-- 按新顺序输出链表
for i, node in ipairs(list) do
    -- 下一个节点的地址：如果不是最后一个，就是下一个节点的地址；否则是-1
    local next_addr = list[i + 1] and list[i + 1].address or "-1"
    print(node.address .. " " .. node.value .. " " .. next_addr)
end
