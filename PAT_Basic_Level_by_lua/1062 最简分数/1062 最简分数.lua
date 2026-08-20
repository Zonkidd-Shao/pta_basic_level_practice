-- 题目编号: 1062 最简分数
-- 实现原理: 给定两个分数 a/b 和 c/d 以及一个分母 k，遍历分子 i 从 1 到 k-1，使用辗转相除法判断 i 与 k 是否互质（最简），同时检查 i/k 是否位于两个给定分数之间，收集所有符合条件的分数后输出。
-- 读取两个分数 a/b 和 c/d，以及指定分母k
local left, right, k_text = io.read("l"):match("^(%S+)%s+(%S+)%s+(%d+)$")
local a, b = left:match("^(%-?%d+)/(%d+)$")
local c, d = right:match("^(%-?%d+)/(%d+)$")
local k
a, b, c, d, k = tonumber(a), tonumber(b), tonumber(c), tonumber(d), tonumber(k_text)
-- 辗转相除法求最大公约数
local function g(x, y)
    while y ~= 0 do
        x, y = y, x % y
    end
    return x
end
-- 首先确保 a/b < c/d，如果不是则交换
if a * d > c * b then
    a, c = c, a
    b, d = d, b
end
-- o: 存储符合条件的最简分数
local o = {}
-- 遍历所有可能的分子i（1到k-1）
for i = 1, k - 1 do
    -- 判断：i与k互质（最简） 且 i/k > a/b 且 i/k < c/d
    -- 用交叉相乘避免浮点数精度问题
    if g(i, k) == 1 and i * b > a * k and i * d < c * k then
        o[#o + 1] = i .. "/" .. k
    end
end
-- 输出所有符合条件的分数
print(table.concat(o, " "))
