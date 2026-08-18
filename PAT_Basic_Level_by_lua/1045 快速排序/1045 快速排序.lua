-- 题目编号: 1045 快速排序
-- 实现原理: 快速排序的主元满足"左边都小于它，右边都大于它"，即大于左侧最大值且小于右侧最小值。先倒序遍历构建后缀数组 suffix[i] 记录 i 之后的最小值，再正序遍历判断每个元素是否符合条件。

-- 读取数列长度 n 和数列 a
local n, a = io.read("*n"), {}
for i = 1, n do a[i] = io.read("*n") end

-- suffix[i]: 位置 i 之后（不包含 i）的最小元素值
-- minimum: 记录当前遍历位置之后的最小值
local suffix, minimum = {}, math.huge

-- 倒序遍历，构建后缀最小值数组
for i = n, 1, -1 do
    suffix[i] = minimum       -- suffix[i] = i 之后的最小值
    minimum = math.min(minimum, a[i])  -- 更新最小值（含当前元素）
end

-- max: 记录当前位置之前的最大值
-- answer: 存储所有主元
local max, answer = -math.huge, {}

-- 正序遍历，判断每个元素是否是主元
for i = 1, n do
    -- 主元条件：大于左边所有元素（即大于左侧最大值）且小于右边所有元素（即小于右侧最小值）
    if a[i] > max and a[i] < suffix[i] then
        answer[#answer + 1] = a[i]
    end
    -- 更新左侧最大值
    max = math.max(max, a[i])
end

-- 输出主元个数
print(#answer)
-- 输出所有主元（按原数组顺序），如果没有主元则输出空行
print(table.concat(answer, " "))
