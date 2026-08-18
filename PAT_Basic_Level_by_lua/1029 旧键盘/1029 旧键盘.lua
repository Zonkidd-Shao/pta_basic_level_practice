-- 题目编号: 1029 旧键盘
-- 实现原理: 将实际输出的字符串转为大写后标记每个字符为可用。遍历期望输出的字符串（转大写），找出在可用集合中不存在且未被输出过的字符，按顺序输出即为坏掉的键。

-- 读取期望输出的字符串 broken 和实际输出的字符串 typed
local broken, typed = io.read("l"), io.read("l")

-- available: 实际能输出的字符集合（大写），printed: 已输出的坏键（避免重复）
local available, printed = {}, {}

-- 遍历实际输出的字符串，将所有字符转为大写并存入可用集合
for ch in typed:upper():gmatch(".") do
    available[ch] = true
end

-- 存储坏掉的键（按出现顺序）
local out = {}

-- 遍历期望输出的字符串（转大写），找出坏掉的键
for ch in broken:upper():gmatch(".") do
    -- 如果该字符不在可用集合中，且还没有被输出过，则是坏键
    if not available[ch] and not printed[ch] then
        out[#out + 1] = ch
        printed[ch] = true  -- 标记为已输出，避免重复
    end
end

-- 输出所有坏掉的键
print(table.concat(out))
