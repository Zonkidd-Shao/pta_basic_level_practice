-- 题目编号: 1083 是否存在相等的差
-- 实现原理: 遍历1到N，计算每个数字与对应下标之差的绝对值，用哈希表统计每个差值出现的次数。遍历哈希表，将出现次数大于1的差值收集到数组中，按差值从大到小排序后输出。
local n = tonumber(io.read())  -- 读取数字个数N
local c = {}  -- 哈希表，键为差值，值为出现次数

-- 遍历每个位置i（从1到n）
for i = 1, n do
    -- 计算第i个数字与i的差的绝对值
    local d = math.abs(io.read("*n") - i)
    -- 统计该差值出现的次数（若不存在则默认为0）
    c[d] = (c[d] or 0) + 1
end

-- 收集出现次数大于1的差值
local a = {}
for d, x in pairs(c) do
    if x > 1 then
        a[#a + 1] = d
    end
end

-- 按差值从大到小排序
table.sort(a, function(x, y)
    return x > y
end)

-- 输出结果：差值 出现次数
for _, d in ipairs(a) do
    print(d .. " " .. c[d])
end
