-- 题目编号: 1006 换个格式输出整数
-- 实现原理: 将三位整数的百位、十位、个位分别提取，百位用若干个'B'表示，十位用若干个'S'表示，个位用从1到个位数的数字序列表示，拼接后输出。

-- 读取输入的正整数n（不超过1000）
local n = tonumber(io.read())
-- 用于存储输出结果的数组
local result = {}

-- 提取百位数：除以100再取整后对10取余
local hundreds = math.floor(n / 100) % 10
-- 提取十位数：除以10再取整后对10取余
local tens = math.floor(n / 10) % 10
-- 提取个位数：直接对10取余
local ones = n % 10

-- 在结果中添加百位对应的B字符（hundreds个B）
result[#result + 1] = string.rep("B", hundreds)
-- 在结果中添加十位对应的S字符（tens个S）
result[#result + 1] = string.rep("S", tens)
-- 在结果中添加个位对应的数字序列（从1到ones）
for i = 1, ones do
    result[#result + 1] = tostring(i)
end

-- 将结果数组拼接成字符串并输出
print(table.concat(result))
