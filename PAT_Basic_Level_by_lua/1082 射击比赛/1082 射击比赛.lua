-- 题目编号: 1082 射击比赛
-- 实现原理: 读取每位选手的ID和坐标(x,y)，计算到原点(0,0)的距离平方（避免开根号以保持整数精度），记录距离最小和最大的选手ID，最后输出冠军和菜鸟的ID。
local n = tonumber(io.read())  -- 读取选手数量
local lo, hi  -- lo存储距离最小的选手（冠军），hi存储距离最大的选手（菜鸟）

-- 遍历每位选手
for i = 1, n do
    -- 正则匹配：选手ID、x坐标、y坐标
    local id, x, y = io.read("l"):match("^(%S+)%s+([%-]?%d+)%s+([%-]?%d+)$")
    -- 计算到原点的距离平方（x²+y²），用距离平方比较可避免开根号，提高精度和效率
    local d = tonumber(x) ^ 2 + tonumber(y) ^ 2
    
    -- 更新最小值（最近的选手，即冠军）
    if not lo or d < lo[2] then
        lo = {id, d}
    end
    -- 更新最大值（最远的选手，即菜鸟）
    if not hi or d > hi[2] then
        hi = {id, d}
    end
end

-- 输出冠军ID和菜鸟ID
print(lo[1] .. " " .. hi[1])
