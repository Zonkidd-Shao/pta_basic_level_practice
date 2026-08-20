-- 题目编号: 1065 单身狗
-- 实现原理: 建立夫妻/伴侣的配对映射表，记录所有出席者。遍历出席者，若其没有伴侣或伴侣未出席，则判定为"单身狗"，收集后排序输出。
-- n: 伴侣对数，p: 伴侣配对映射表（双向映射）
local tokens = {}
for x in io.read("a"):gmatch("%S+") do tokens[#tokens + 1] = x end
local pos = 1
local n, p = tonumber(tokens[pos]), {}
pos = pos + 1
-- 读取n对伴侣，建立双向映射
for i = 1, n do
    local a, b = tokens[pos], tokens[pos + 1]
    pos = pos + 2
    p[a] = b
    p[b] = a
end
-- m: 出席人数，present: 出席者集合
local m = tonumber(tokens[pos])
pos = pos + 1
local present = {}
for i = 1, m do
    present[tokens[pos]] = true
    pos = pos + 1
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
