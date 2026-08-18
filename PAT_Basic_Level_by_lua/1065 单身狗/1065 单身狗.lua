-- 题目编号: 1065 单身狗
-- 实现原理: 建立夫妻/伴侣的配对映射表，记录所有出席者。遍历出席者，若其没有伴侣或伴侣未出席，则判定为"单身狗"，收集后排序输出。
-- n: 伴侣对数，p: 伴侣配对映射表（双向映射）
local n, p = tonumber(io.read()), {}
-- 读取n对伴侣，建立双向映射
for i = 1, n do
    local a, b = io.read("l"):match("^(%S+)%s+(%S+)$")
    p[a] = b
    p[b] = a
end
-- m: 出席人数，present: 出席者集合
local m = tonumber(io.read())
local present = {}
for i = 1, m do
    present[io.read("l")] = true
end
-- o: 存储单身狗的ID
local o = {}
for x in pairs(present) do
    -- 判断：没有伴侣 或 伴侣未出席
    if not p[x] or not present[p[x]] then
        o[#o + 1] = x
    end
end
table.sort(o)  -- 按ID排序
-- 输出单身狗的数量和ID列表
print(#o)
print(table.concat(o, " "))
