-- 题目编号: 1030 完美数列
-- 实现原理: 先将数列从小到大排序，然后使用双指针法维护一个滑动窗口。右指针遍历每个数作为最大值，左指针随条件右移，保证窗口内最大值不超过最小值乘以p，记录窗口的最大长度。

-- 读取数列长度 n 和参数 p
local n, p = io.read("*n"), io.read("*n")

-- 读取数列存入数组 a
local a = {}
for i = 1, n do
    a[i] = io.read("*n")
end

-- 将数列从小到大排序，为双指针法做准备
table.sort(a)

-- best: 记录完美数列的最大长度，left: 滑动窗口左指针
local best, left = 0, 1

-- 右指针遍历每个元素作为窗口的右边界（最大值）
for right = 1, n do
    -- 当窗口内最大值 > 最小值 * p 时，左指针右移缩小窗口
    while a[right] > a[left] * p do
        left = left + 1
    end
    -- 更新最大窗口长度
    best = math.max(best, right - left + 1)
end

-- 输出完美数列的最大长度
print(best)
