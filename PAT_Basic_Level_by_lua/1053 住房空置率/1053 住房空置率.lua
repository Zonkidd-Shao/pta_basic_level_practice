-- 题目编号: 1053 住房空置率
-- 实现原理: 对每套住房，统计用电量低于阈值e的天数。若超过一半天数低于阈值，则视为"可能空置"；若同时观察天数超过阈值d，则视为"空置"。最后分别计算两类房屋的百分比并输出。
-- 读取输入：住房数量n，电量阈值e，观察天数阈值d
-- p: 可能空置的数量，q: 空置的数量
local n, e, d = io.read("*n"), io.read("*n"), io.read("*n")
local p, q = 0, 0
-- 遍历每套住房
for i = 1, n do
    local k = io.read("*n")  -- 该住房的观察天数
    local c = 0  -- 用电量低于阈值的天数
    -- 统计低于电量阈值e的天数
    for j = 1, k do
        if io.read("*n") < e then
            c = c + 1
        end
    end
    -- 判断是否超过一半天数低于阈值
    if c > k / 2 then
        -- 观察天数超过d则为空置，否则为可能空置
        if k > d then
            q = q + 1
        else
            p = p + 1
        end
    end
end
-- 输出两类房屋的百分比，保留一位小数
print(string.format("%.1f%% %.1f%%", p * 100 / n, q * 100 / n))
