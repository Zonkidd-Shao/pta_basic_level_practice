-- 题目编号: 1077 互评成绩计算
-- 实现原理: 对每个学生，读取教师评分和一组互评分，剔除无效分数和最高最低分后取平均，与教师评分取均值并四舍五入输出。
local n, m = io.read("*n"), io.read("*n")  -- n为学生数，m为互评分数量

-- 遍历每个学生
for i = 1, n do
    local teacher = io.read("*n")  -- 读取教师评分
    local a = {}  -- 存储有效的互评分
    -- 读取其余 n-1 个互评分
    for j = 1, n - 1 do
        local x = io.read("*n")  -- 读取一个互评分
        -- 筛选有效分数：在0到满分之间
        if x >= 0 and x <= m then
            a[#a + 1] = x
        end
    end
    table.sort(a)  -- 对有效互评分排序，便于去除最高分和最低分
    local s = 0  -- 累加求和变量
    -- 去掉一个最高分和一个最低分后求和（从第2个到倒数第2个）
    for j = 2, #a - 1 do
        s = s + a[j]
    end
    -- 计算最终成绩：教师分与互评分均值各占50%，四舍五入
    -- math.floor(x + 0.5) 实现四舍五入
    print(math.floor((teacher + s / (#a - 2)) / 2 + .5))
end
