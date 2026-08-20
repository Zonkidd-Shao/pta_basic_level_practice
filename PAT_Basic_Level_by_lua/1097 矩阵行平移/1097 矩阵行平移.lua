-- 题目编号: 1097 矩阵行平移
-- 实现原理: 奇数行根据平移量循环右移（平移量按1~k循环），空缺位置用x填充；偶数行保持不变。计算每行平移后的元素之和并输出。
local n, k, x = io.read("*n"), io.read("*n"), io.read("*n")
-- n:矩阵边长，k:平移量循环周期，x:填充值

local sums = {}
for j = 1, n do sums[j] = 0 end

-- 处理每一行
for i = 1, n do
    local a = {}  -- 存储当前行的n个元素
    for j = 1, n do
        a[j] = io.read("*n")
    end
    
    -- 计算当前行的平移量：
    -- 奇数行：平移量按1~k循环，第1行移1位，第3行移2位，第5行移3位...
    -- 偶数行：平移量为0（不移）
    local shift = i % 2 == 1 and ((math.floor((i + 1) / 2) - 1) % k + 1) or 0
    
    -- 将平移后的元素累加到对应列
    for j = 1, n do
        -- 前shift个位置用x填充，后面的取原数组中对应位置的元素
        sums[j] = sums[j] + (j <= shift and x or a[j - shift])
    end
end

for j = 1, n do
    io.write(sums[j] .. (j == n and "\n" or " "))
end
