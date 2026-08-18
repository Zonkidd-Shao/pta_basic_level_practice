-- 题目编号: 1092 最好吃的月饼
-- 实现原理: 按列读取N行N列的月饼销量数据，每列累加得到总销量，找出最大值，收集所有达到最大值的列号并输出。
local n = tonumber(io.read())  -- 读取月饼种类数（也是城市数）N
local s = {}  -- 存储每种月饼的总销量，s[j]表示第j种月饼的总销量

-- 按行读取数据，按列累加
for i = 1, n do  -- i表示第i个城市
    for j = 1, n do  -- j表示第j种月饼
        s[j] = (s[j] or 0) + io.read("*n")  -- 累加第j种月饼的销量
    end
end

-- 找出最大销量
local z = 0
for i = 1, n do
    z = math.max(z, s[i])
end

-- 收集所有销量等于最大值的月饼种类编号
local a = {}
for i = 1, n do
    if s[i] == z then
        a[#a + 1] = i
    end
end

print(z)  -- 输出最大销量
print(table.concat(a, " "))  -- 输出所有达到最大销量的种类编号，用空格分隔
