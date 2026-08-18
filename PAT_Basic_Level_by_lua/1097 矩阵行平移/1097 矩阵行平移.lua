-- 题目编号: 1097 矩阵行平移
-- 实现原理: 奇数行根据平移量循环右移（平移量按1~k循环），空缺位置用x填充；偶数行保持不变。计算每行平移后的元素之和并输出。
local n, m, k, x = io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n")
-- n:行数，m:列数，k:平移量循环周期，x:填充值

-- 处理每一行
for i = 1, n do
    local a = {}  -- 存储当前行的m个元素
    for j = 1, m do
        a[j] = io.read("*n")
    end
    
    -- 计算当前行的平移量：
    -- 奇数行：平移量按1~k循环，第1行移1位，第3行移2位，第5行移3位...
    -- 偶数行：平移量为0（不移）
    local shift = i % 2 == 1 and ((math.floor(i / 2) % k) + 1) or 0
    
    -- 计算平移后的行元素之和
    local s = 0
    for j = 1, m do
        -- 前shift个位置用x填充，后面的取原数组中对应位置的元素
        s = s + (j <= shift and x or a[j - shift])
    end
    
    -- 输出和，行之间用空格分隔，最后一行用换行
    io.write(s .. (i == n and "\n" or " "))
end
