-- 题目编号: 1063 计算谱半径
-- 实现原理: 谱半径定义为复数特征值模的最大值。对每组输入的实部和虚部，计算 sqrt(x²+y²) 作为模，遍历所有输入取最大值，最后保留两位小数输出。
-- n: 复数个数，m: 最大模的平方（避免重复开方，最后再开方）
local n, m = tonumber(io.read()), 0
-- 遍历每个复数
for i = 1, n do
    local x, y = io.read("*n"), io.read("*n")  -- 实部x，虚部y
    -- 计算模的平方 x²+y²，取最大值
    m = math.max(m, x * x + y * y)
end
-- 开方得到最大模，保留两位小数输出
print(string.format("%.2f", math.sqrt(m)))
