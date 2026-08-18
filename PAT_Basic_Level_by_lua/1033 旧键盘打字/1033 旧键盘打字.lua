-- 题目编号: 1033 旧键盘打字
-- 实现原理: 将坏键统一转为大写存入集合，遍历文本时检查每个字符的大写形式是否在坏键集合中；若上档键"+"坏了，则所有大写字母均不能输出。

-- 读取坏掉的键字符串 broken 和输入的文本 text
local broken, text = io.read("l"), io.read("l")

-- bad: 存储所有坏掉的键（大写形式）
local bad = {}

-- 将所有坏键转为大写存入集合，方便快速查找
for ch in broken:upper():gmatch(".") do
    bad[ch] = true
end

-- 存储可以输出的字符
local out = {}

-- 遍历文本的每个字符，判断是否可以输出
for ch in text:gmatch(".") do
    -- 获取当前字符的大写形式
    local upper = ch:upper()
    -- 判断条件：该字符的大写不是坏键 且 （不是大写字母 或 上档键没坏）
    if not bad[upper] and not (ch:match("%u") and bad["+"]) then
        out[#out + 1] = ch
    end
end

-- 输出最终能打出的文本
print(table.concat(out))
