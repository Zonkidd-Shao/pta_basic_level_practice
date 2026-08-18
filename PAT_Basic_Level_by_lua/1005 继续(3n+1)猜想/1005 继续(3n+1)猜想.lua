-- 题目编号: 1005 继续(3n+1)猜想
-- 实现原理: 读取一组数字，对每个数字执行(3n+1)猜想过程并标记被覆盖的数，未被其他数字覆盖的即为"关键数"，最后降序输出。

-- 存储所有输入数据的数组
local data = {}
-- 读取全部输入内容，用正则提取所有数字
for value in io.read("a"):gmatch("%d+") do
    data[#data + 1] = tonumber(value)
end

-- present: 记录输入中出现过的数字（用于快速查找）
-- covered: 记录被其他数字的猜想过程覆盖的数字
local present, covered = {}, {}

-- 从第2个元素开始遍历（第1个元素是数字的个数n）
for i = 2, #data do
    -- 将数字标记为存在
    present[data[i]] = true
end

-- 对每个出现过的数字，执行(3n+1)猜想过程
for value in pairs(present) do
    -- x用于跟踪猜想过程中的当前值
    local x = value
    -- 循环直到x变为1
    while x ~= 1 do
        -- 判断奇偶性
        if x % 2 == 0 then
            -- 偶数：除以2
            x = math.floor(x / 2)
        else
            -- 奇数：(3x+1)/2
            x = math.floor((3 * x + 1) / 2)
        end
        -- 如果变换后得到的数也在输入集合中，标记为被覆盖
        if present[x] then
            covered[x] = true
        end
    end
end

-- 收集所有关键数（未被覆盖的数）
local answer = {}
for value in pairs(present) do
    -- 没有被其他数覆盖的就是关键数
    if not covered[value] then
        answer[#answer + 1] = value
    end
end
-- 按降序排序关键数
table.sort(answer, function(a, b) return a > b end)
-- 用空格连接并输出
print(table.concat(answer, " "))
