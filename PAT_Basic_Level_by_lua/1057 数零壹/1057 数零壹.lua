-- 题目编号: 1057 数零壹
-- 实现原理: 将输入字符串转为小写，提取所有字母，计算字母序和（a=1, b=2, ..., z=26）。然后将该和反复除以2取余，统计二进制表示中0和1的个数。
local s = 0  -- 字母序累加和
-- 将输入转为小写，遍历每个字母
-- string.byte(c) - 96：将a-z转为1-26
for c in io.read("l"):lower():gmatch("%a") do
    s = s + string.byte(c) - 96
end
local z, o = 0, 0  -- z: 0的个数，o: 1的个数
-- 反复除以2取余，统计二进制中0和1的个数
repeat
    if s % 2 == 0 then
        z = z + 1  -- 余数为0，0的个数加1
    else
        o = o + 1  -- 余数为1，1的个数加1
    end
    s = math.floor(s / 2)  -- 除以2取整
until s == 0  -- 商为0时结束
print(z .. " " .. o)
