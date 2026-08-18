-- 题目编号: 1115 裁判机
-- 实现原理: 游戏规则为每次出的数必须是已有任意两数之差的绝对值且不能重复。记录已出现的数和所有可能的差值，逐轮淘汰出局玩家，最后输出胜者。

local x, y = io.read("*n"), io.read("*n")  -- 初始的两个数
local n, m = io.read("*n"), io.read("*n")  -- n个玩家，m轮游戏
local a = {}                                 -- 存储每个玩家每轮出的数

-- 读取每个玩家每轮出的数
for i = 1, n do
    a[i] = {}
    for j = 1, m do
        a[i][j] = io.read("*n")
    end
end

-- seen: 已经出现过的数的集合
-- valid: 所有合法（即已有两数差的绝对值）的数的集合
-- alive: 标记玩家是否还在游戏中
local seen = {[x] = true, [y] = true}
local valid = {[math.abs(x - y)] = true}
local alive = {}
for i = 1, n do
    alive[i] = true
end

-- 逐轮进行游戏
for r = 1, m do
    -- 每个玩家依次出牌
    for i = 1, n do
        if alive[i] then
            local z = a[i][r]  -- 当前玩家出的数
            -- 判断是否出局：数已出现过 或 不是合法差值
            if seen[z] or not valid[z] then
                alive[i] = false
                print("Round #" .. r .. ": " .. i .. " is out.")
            else
                -- 合法出牌，更新所有可能的差值集合
                for q in pairs(seen) do
                    valid[math.abs(z - q)] = true
                end
                seen[z] = true  -- 将当前数加入已出现集合
            end
        end
    end
end

-- 收集所有还活着的玩家
local o = {}
for i = 1, n do
    if alive[i] then
        o[#o + 1] = i
    end
end

-- 输出结果
if #o == 0 then
    print("No winner.")
else
    print("Winner(s): " .. table.concat(o, " "))
end
