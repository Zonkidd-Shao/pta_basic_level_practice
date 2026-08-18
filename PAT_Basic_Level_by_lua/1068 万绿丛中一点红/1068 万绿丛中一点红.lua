-- 题目编号: 1068 万绿丛中一点红
-- 实现原理: 首先统计每个像素值出现的次数，筛选出唯一出现且值 ≥ 阈值 t 的像素点。对每个候选点，检查其与周围 8 个邻域像素的差值是否都 > t，若满足则为所求的"一点红"。若唯一则输出坐标和值，不唯一输出"Not Unique"，不存在输出"Not Exist"。
-- m: 列数，n: 行数，t: 阈值
-- g: 图像二维数组，cnt: 每个像素值出现的次数
local m, n, t = io.read("*n"), io.read("*n"), io.read("*n")
local g, cnt = {}, {}
-- 读取图像数据并统计各像素值出现次数
for i = 1, n do
    g[i] = {}
    for j = 1, m do
        local x = io.read("*n")
        g[i][j] = x
        cnt[x] = (cnt[x] or 0) + 1
    end
end
-- ans: 存储符合条件的像素点
local ans = {}
-- 遍历每个像素
for i = 1, n do
    for j = 1, m do
        local x = g[i][j]
        -- 候选条件：像素值唯一出现 且 像素值 >= 阈值t
        if cnt[x] == 1 and x >= t then
            local ok = true
            -- 检查周围8个邻域像素（3x3范围）
            for u = math.max(1, i - 1), math.min(n, i + 1) do
                for v = math.max(1, j - 1), math.min(m, j + 1) do
                    -- 排除自身，检查差值是否都大于t
                    if (u ~= i or v ~= j) and math.abs(g[u][v] - x) <= t then
                        ok = false
                    end
                end
            end
            -- 符合条件则加入结果集
            if ok then
                ans[#ans + 1] = {i, j, x}
            end
        end
    end
end
-- 根据结果数量输出
if #ans == 0 then
    print("Not Exist")  -- 不存在
elseif #ans > 1 then
    print("Not Unique")  -- 不唯一
else
    -- 唯一解，输出坐标（注意：输出格式是列在前，行在后）和像素值
    print(string.format("(%d, %d): %d", ans[1][2], ans[1][1], ans[1][3]))
end
