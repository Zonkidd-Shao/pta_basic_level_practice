-- 题目编号: 1103 缘分数
-- 实现原理: 在区间[m,n]中枚举a，根据立方差公式推导出条件3a²-3a+1应为完全平方数（记为c²），且2c-1也应为完全平方数（记为r²）且r为奇数，满足条件的a即为缘分数，输出a与其对应的另一个数(r+1)/2。
local m, n = io.read("*n"), io.read("*n")  -- 读取区间范围[m, n]
local any = false                          -- 标记是否找到缘分数

-- 枚举区间内的每个数a
for a = m, n do
    -- 根据立方差公式推导出的中间量：q = 3a² - 3a + 1
    local q = 3 * a * a - 3 * a + 1
    -- 计算q的平方根并取整（加0.5避免浮点误差）
    local c = math.floor(math.sqrt(q) + .5)
    
    -- 判断q是否为完全平方数（即c² == q）
    if c * c == q then
        -- 进一步判断2c-1是否为完全平方数
        local r = math.floor(math.sqrt(2 * c - 1) + .5)
        -- 同时要求r必须为奇数
        if r * r == 2 * c - 1 and r % 2 == 1 then
            -- 输出缘分数a和对应的另一个数(r+1)/2
            print(a .. " " .. math.floor((r + 1) / 2))
            any = true
        end
    end
end

-- 如果没有找到任何缘分数，输出提示
if not any then
    print("No Solution")
end
