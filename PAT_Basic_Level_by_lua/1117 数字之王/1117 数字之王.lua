-- 题目编号: 1117 数字之王
-- 实现原理: 对区间内每个数，反复执行"每位数字的立方乘积再求各位数字之和"的操作，直到所有数均小于10。统计最终结果中每个数字出现的次数，输出出现次数最多的数字。

local a, b = io.read("*n"), io.read("*n")  -- 区间[a, b]
local v = {}                                 -- 存储区间内的所有数

-- 初始化区间内的所有数
for i = a, b do
    v[#v + 1] = i
end

-- 对一个数执行操作：各位数字的立方的乘积，再求各位数字之和
local function f(x)
    local p = 1  -- 各位数字立方的乘积
    for d in tostring(x):gmatch("%d") do
        p = p * tonumber(d) ^ 3
    end
    local s = 0  -- 乘积的各位数字之和
    for d in tostring(p):gmatch("%d") do
        s = s + tonumber(d)
    end
    return s
end

-- 反复执行操作，直到所有数都小于10
while true do
    local done = true  -- 标记是否所有数都已小于10
    for i = 1, #v do
        v[i] = f(v[i])
        if v[i] >= 10 then done = false end
    end
    if done then break end
end

-- 统计每个数字出现的次数
local c = {}
for _, x in ipairs(v) do
    c[x] = (c[x] or 0) + 1
end

-- 找出出现次数最多的次数
local z = 0
for _, x in pairs(c) do
    z = math.max(z, x)
end

-- 收集所有出现次数最多的数字
local o = {}
for x, y in pairs(c) do
    if y == z then
        o[#o + 1] = x
    end
end

-- 按数字升序排序后输出
table.sort(o)
print(z)
print(table.concat(o, " "))
