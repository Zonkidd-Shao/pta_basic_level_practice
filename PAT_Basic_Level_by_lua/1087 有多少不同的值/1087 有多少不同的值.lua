-- 题目编号: 1087 有多少不同的值
-- 实现原理: 对于1到N的每个整数i，计算 floor(i/2)+floor(i/3)+floor(i/5) 的值，用哈希表记录所有出现的不同值，最后统计哈希表中键的个数即为答案。
local n, s = tonumber(io.read()), {}  -- n为输入的N，s为哈希表（集合）

-- 遍历1到N的每个整数
for i = 1, n do
    -- 计算 floor(i/2) + floor(i/3) + floor(i/5) 的值，作为哈希表的键
    s[math.floor(i / 2) + math.floor(i / 3) + math.floor(i / 5)] = true
end

-- 统计哈希表中键的个数（即不同值的数量）
local c = 0
for _ in pairs(s) do
    c = c + 1
end

print(c)
