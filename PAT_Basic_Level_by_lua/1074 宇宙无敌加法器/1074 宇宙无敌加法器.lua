-- 题目编号: 1074 宇宙无敌加法器
-- 实现原理: 按位进制加法器。将进制表和两个加数反转，从低位到高位逐位相加，每位使用进制表中对应位的数值（0表示十进制），处理进位后反转结果并去除前导零。
-- base: 进制表字符串，a: 第一个加数，b: 第二个加数
local base, a, b = io.read("l"), io.read("l"), io.read("l")
-- 反转字符串，便于从低位（索引1）开始计算
base, a, b = base:reverse(), a:reverse(), b:reverse()
local c = 0  -- 进位
local out = {}  -- 存储每一位的计算结果
-- 从低位到高位逐位相加
for i = 1, math.max(#a, #b) do
    -- 获取该位的进制，0表示10进制
    local r = tonumber(base:sub(i, i)) or 0
    if r == 0 then r = 10 end
    -- 获取两个加数该位的数字，不存在则为0
    local x = tonumber(a:sub(i, i)) or 0
    local y = tonumber(b:sub(i, i)) or 0
    -- 该位相加结果（加上进位）
    local z = x + y + c
    out[#out + 1] = z % r  -- 该位的结果
    c = math.floor(z / r)  -- 新的进位
end
-- 最高位仍有进位
if c > 0 then
    out[#out + 1] = c
end
-- 反转结果并去除前导零
local s = table.concat(out):reverse():gsub("^0+", "")
-- 结果为空（全零）则输出0，否则输出结果
print(s == "" and "0" or s)
