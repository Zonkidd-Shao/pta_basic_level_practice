-- 题目编号: 1046 划拳
-- 实现原理: 甲喊 a1、乙喊 b1，两人划拳结果为 a2、b2。谁喊的数字等于两人喊数之和则对方喝酒（输）。记录甲和乙各自输的次数并输出。

-- n: 划拳次数，lose_a: 甲输的次数，lose_b: 乙输的次数
local n, lose_a, lose_b = tonumber(io.read()), 0, 0

-- 遍历每一轮划拳
for _ = 1, n do
    -- 读取：甲喊数 a1、甲划拳 a2、乙喊数 b1、乙划拳 b2
    local a1, a2, b1, b2 = io.read("*n"), io.read("*n"), io.read("*n"), io.read("*n")
    local sum = a1 + b1  -- 两人喊数之和
    
    -- 判断谁输（谁猜对了对方就输）
    -- 甲猜对而乙没猜对，乙输
    if sum == a2 and sum ~= b2 then
        lose_b = lose_b + 1
    -- 乙猜对而甲没猜对，甲输
    elseif sum == b2 and sum ~= a2 then
        lose_a = lose_a + 1
    end
    -- 两人都猜对或都没猜对，则平局，无人喝酒
end

-- 输出甲输的次数和乙输的次数
print(lose_a .. " " .. lose_b)
