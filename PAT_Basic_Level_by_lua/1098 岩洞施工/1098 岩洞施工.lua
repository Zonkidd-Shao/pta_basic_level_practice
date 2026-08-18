-- 题目编号: 1098 岩洞施工
-- 实现原理: 读取岩洞顶部和底部的N个点坐标，分别找出顶部的最低点和底部的最高点，计算两者差值。若差值≥1则管道可通过，输出Yes和差值，否则输出No和需要削去的厚度。
local n = tonumber(io.read())  -- 读取点的数量N
local top, bottom = {}, {}  -- top:顶部各点高度，bottom:底部各点高度

-- 读取顶部N个点的高度
for i = 1, n do
    top[i] = io.read("*n")
end
-- 读取底部N个点的高度
for i = 1, n do
    bottom[i] = io.read("*n")
end

local lo, hi = 0, math.huge  -- lo:底部最高点，hi:顶部最低点
-- 遍历所有点，找出底部最高和顶部最低
for i = 1, n do
    lo = math.max(lo, bottom[i])  -- 底部的最高点（最大值）
    hi = math.min(hi, top[i])     -- 顶部的最低点（最小值）
end

-- 若顶部最低 - 底部最高 >= 1，说明管道可以通过
if hi - lo >= 1 then
    print("Yes " .. (hi - lo))  -- 输出Yes和可通过的最大厚度
else
    print("No " .. (1 - hi + lo))  -- 输出No和需要削去的厚度
end
