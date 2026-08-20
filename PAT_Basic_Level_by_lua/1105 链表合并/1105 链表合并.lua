-- 题目编号: 1105 链表合并
-- 按题意交替输出：较长链表连续两个节点，再接较短链表的一个节点；较短链表需要逆序。

local h1, h2, n = io.read("l"):match("^(%S+)%s+(%S+)%s+(%d+)$")
n = tonumber(n)
local nodes = {}
for _ = 1, n do
    local address, value, next_address = io.read("l"):match("^(%S+)%s+([%-]?%d+)%s+(%S+)$")
    nodes[address] = { address, tonumber(value), next_address }
end

local function collect(head)
    local result = {}
    while head ~= "-1" do
        result[#result + 1] = nodes[head]
        head = nodes[head][3]
    end
    return result
end

local first, second = collect(h1), collect(h2)
if #first < #second then first, second = second, first end

local output = {}
local i, j = 1, #second
while i <= #first do
    output[#output + 1] = first[i]
    i = i + 1
    if i <= #first then
        output[#output + 1] = first[i]
        i = i + 1
    end
    if j >= 1 then
        output[#output + 1] = second[j]
        j = j - 1
    end
end

for index, node in ipairs(output) do
    print(node[1] .. " " .. node[2] .. " " .. (output[index + 1] and output[index + 1][1] or "-1"))
end
