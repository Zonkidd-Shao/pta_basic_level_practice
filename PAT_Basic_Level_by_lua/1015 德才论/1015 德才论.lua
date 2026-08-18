-- 题目编号: 1015 德才论
-- 实现原理: 将考生按德才分达标情况分为四类（才德全尽、德胜才、才德兼亡但德胜才、其他），每类内部按总分降序、同分按德分降序、再同分按准考证号升序排序，最后依次输出

-- 读取第一行的三个数：考生总数n、录取最低分low、优先录取线high
local first = {}
for x in io.read("l"):gmatch("%d+") do
    first[#first + 1] = tonumber(x)
end
local n, low, high = first[1], first[2], first[3]

-- 四个分组：第1类才德全尽，第2类德胜才，第3类才德兼亡但德胜才，第4类其他
local groups = { {}, {}, {}, {} }

-- 读取每个考生的信息
for _ = 1, n do
    -- 用正则匹配提取准考证号、德分、才分
    local id, virtue, talent = io.read("l"):match("^(%S+)%s+(%d+)%s+(%d+)$")
    -- 转换为数字
    virtue, talent = tonumber(virtue), tonumber(talent)
    
    -- 只有德分和才分都不低于最低分的考生才参与排名
    if virtue >= low and talent >= low then
        local group
        -- 第1类：德分和才分都不低于优先录取线（才德全尽）
        if virtue >= high and talent >= high then
            group = 1
        -- 第2类：德分不低于优先录取线，但才分不到（德胜才）
        elseif virtue >= high then
            group = 2
        -- 第3类：德才都不到优先线，但德分不低于才分（才德兼亡但德胜才）
        elseif virtue >= talent then
            group = 3
        -- 第4类：其他达到最低线的考生
        else
            group = 4
        end
        -- 将考生加入对应分组
        groups[group][#groups[group] + 1] = { id = id, v = virtue, t = talent }
    end
end

-- 自定义比较函数：用于排序
local function compare(a, b)
    -- 首先按总分降序排列
    if a.v + a.t ~= b.v + b.t then
        return a.v + a.t > b.v + b.t
    end
    -- 总分相同则按德分降序排列
    if a.v ~= b.v then
        return a.v > b.v
    end
    -- 德分也相同则按准考证号升序排列
    return a.id < b.id
end

-- 存储最终输出的行，以及总人数
local output, total = {}, 0
-- 按类别从高到低依次处理
for g = 1, 4 do
    -- 对当前分组进行排序
    table.sort(groups[g], compare)
    -- 将排序后的考生信息加入输出数组
    for _, s in ipairs(groups[g]) do
        output[#output + 1] = s.id .. " " .. s.v .. " " .. s.t
        total = total + 1
    end
end

-- 输出达线考生总数
print(total)
-- 输出每个考生的信息
for _, line in ipairs(output) do
    print(line)
end
