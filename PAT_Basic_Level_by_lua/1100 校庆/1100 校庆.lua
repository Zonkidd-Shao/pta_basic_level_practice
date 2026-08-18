-- 题目编号: 1100 校庆
-- 实现原理: 读取校友名单存入哈希表，遍历所有来宾，筛选出校友并记录。按身份证号排序（数值最小即最年长），输出校友人数和年长者的身份证号（若无非校友则取所有来宾中最年长者）。
local n = tonumber(io.read())  -- 校友人数n
local old = {}  -- 校友哈希表（集合），用于快速查找

-- 读取所有校友的身份证号
for i = 1, n do
    old[io.read("l")] = true
end

local m = tonumber(io.read())  -- 来宾人数m
local a, all = {}, {}  -- a:校友来宾列表，all:所有来宾列表

-- 遍历所有来宾
for i = 1, m do
    local x = io.read("l")
    all[#all + 1] = x  -- 加入所有来宾列表
    if old[x] then
        a[#a + 1] = x  -- 如果是校友，加入校友列表
    end
end

table.sort(a)    -- 校友按身份证号排序（字典序即年龄序，越小越年长）
table.sort(all)  -- 所有来宾按身份证号排序

print(#a)  -- 输出校友人数
-- 若有校友来宾，输出最年长的校友；否则输出所有来宾中最年长者
print(#a > 0 and a[1] or all[1])
