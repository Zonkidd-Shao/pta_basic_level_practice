-- 题目编号: 1028 人口普查
-- 实现原理: 遍历所有人，筛选出生日期在1814/09/06到2014/09/06之间的有效生日，同时记录最早和最晚生日对应的姓名。最后输出有效人数及最年长者和最年轻者的姓名。

-- 读取总人数 n
local n = tonumber(io.read())

-- minimum: 记录最年长者（生日最小），maximum: 记录最年轻者（生日最大），count: 有效人数
local minimum, maximum, count = nil, nil, 0

-- 遍历每个人的信息
for _ = 1, n do
    -- 从输入行中提取姓名和生日（格式：YYYY/MM/DD）
    local name, date = io.read("l"):match("^(%S+)%s+(%S+)$")
    
    -- 判断生日是否在有效范围内（1814/09/06 到 2014/09/06）
    -- 由于日期格式统一为 YYYY/MM/DD，可以直接用字符串比较
    if date >= "1814/09/06" and date <= "2014/09/06" then
        -- 有效人数加 1
        count = count + 1
        
        -- 更新最年长者（生日更小的更年长）
        if not minimum or date < minimum.date then
            minimum = { name = name, date = date }
        end
        
        -- 更新最年轻者（生日更大的更年轻）
        if not maximum or date > maximum.date then
            maximum = { name = name, date = date }
        end
    end
end

-- 输出结果：若无有效数据则只输出 0，否则输出人数、最年长者姓名、最年轻者姓名
if count == 0 then
    print(0)
else
    print(count .. " " .. minimum.name .. " " .. maximum.name)
end
