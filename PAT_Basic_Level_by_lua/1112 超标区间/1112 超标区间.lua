-- 题目编号: 1112 超标区间
-- 实现原理: 遍历数组，用双指针查找所有连续大于阈值t的子区间并输出；若不存在超标区间，则输出数组中的最大值。

local n, t = io.read("*n"), io.read("*n")  -- n个元素，阈值t
local a = {}                                 -- 存储数组元素

-- 读取数组元素
for i = 1, n do
    a[i] = io.read("*n")
end

local found = false  -- 标记是否找到超标区间
local i = 1          -- 遍历指针

-- 查找所有连续大于阈值的区间
while i <= n do
    -- 如果当前元素大于阈值，找到连续区间的起点和终点
    if a[i] > t then
        local l = i  -- 区间左端点
        -- 向右扩展，直到不大于阈值为止
        while i <= n and a[i] > t do
            i = i + 1
        end
        -- i 已经指向下一个未超标位置，最后一个超标下标为 i-2
        print("[" .. (l - 1) .. ", " .. (i - 2) .. "]")
        found = true
    else
        i = i + 1
    end
end

-- 如果没有找到超标区间，输出数组中的最大值
if not found then
    local m = 0
    for i = 1, n do
        m = math.max(m, a[i])
    end
    print(m)
end
