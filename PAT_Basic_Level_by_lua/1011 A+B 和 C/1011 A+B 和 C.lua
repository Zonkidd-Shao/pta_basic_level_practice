-- 题目编号: 1011 A+B 和 C
-- 实现原理: 读取所有输入整数，每三个数为一组，分别判断 A+B 是否大于 C，按格式输出结果

-- 存储所有输入数值的数组
local values = {}
-- 读取全部输入内容，用正则提取所有整数（包括负数）
for value in io.read("a"):gmatch("%-?%d+") do
    values[#values + 1] = tonumber(value)
end

-- t为测试用例数量，index为当前读取位置的索引（从第2个元素开始，第1个是t）
local t, index = values[1], 2
-- 遍历每个测试用例
for case = 1, t do
    -- 取出当前用例的三个数A、B、C
    local a, b, c = values[index], values[index + 1], values[index + 2]
    -- 索引后移3位，准备读取下一组
    index = index + 3
    -- 按格式输出结果：A+B > C 输出true，否则输出false
    print(string.format("Case #%d: %s", case, a + b > c and "true" or "false"))
end
