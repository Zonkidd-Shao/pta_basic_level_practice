-- 题目编号: 1060 爱丁顿数
-- 实现原理: 将骑车距离数据从大到小排序，然后遍历数组，找到最大的e使得前e个数都大于e。即当a[i] > i时更新e为i，否则终止遍历。
-- n: 天数，a: 每天骑车距离数组
local n, a = tonumber(io.read()), {}
-- 读取n天的骑车距离
for i = 1, n do
    a[i] = io.read("*n")
end
-- 从大到小排序
table.sort(a, function(x, y) return x > y end)
-- 遍历找最大的e，满足前e天都大于e英里
local e = 0
for i = 1, n do
    if a[i] > i then
        e = i  -- 第i天的距离大于i，更新e
    else
        break  -- 不满足则终止（因为已排序，后面更小）
    end
end
print(e)
