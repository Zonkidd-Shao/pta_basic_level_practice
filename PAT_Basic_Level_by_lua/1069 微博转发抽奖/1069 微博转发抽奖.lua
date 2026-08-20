-- 题目编号: 1069 微博转发抽奖
-- 实现原理: 从第 s 个转发者开始，每隔 n 个人抽奖一次。若当前中奖者已中过奖，则顺延至下一个未中奖者。记录已中奖者防止重复，若无人中奖则输出"Keep going..."。
-- m: 转发人数，n: 间隔人数，s: 起始位置
local m, n, s = io.read("l"):match("^(%d+)%s+(%d+)%s+(%d+)$")
m, n, s = tonumber(m), tonumber(n), tonumber(s)
local a = {}
-- 读取所有转发者ID
for i = 1, m do
    a[i] = io.read("l")
end
-- seen: 已中奖者集合，win: 中奖人数
local seen, win = {}, 0
local i = s  -- 当前位置
-- 从起始位置开始遍历
while i <= m do
    if seen[a[i]] then
        i = i + 1  -- 已中过奖，顺延到下一个
    else
        print(a[i])  -- 中奖，输出ID
        seen[a[i]] = true  -- 标记为已中奖
        win = win + 1  -- 中奖人数加1
        i = i + n  -- 跳过n个人
    end
end
-- 无人中奖输出提示
if win == 0 then
    print("Keep going...")
end
