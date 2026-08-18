-- 题目编号: 1022 D进制的A+B
-- 实现原理: 先计算A+B的和，再用除基取余法将和转换为D进制数，将余数逆序输出得到结果。

-- 读取三个输入：非负整数A、非负整数B、进制D
local a, b, d = io.read("*n"), io.read("*n"), io.read("*n")

-- n存储A+B的和，out存储每次除以D得到的余数（低位在前）
local n, out = a + b, {}

-- 除基取余法：不断除以D，记录余数
repeat
    -- 记录当前位的余数
    out[#out + 1] = n % d
    -- 商继续参与下一轮计算
    n = math.floor(n / d)
until n == 0  -- 商为0时停止

-- 由于余数是低位在前，需要逆序输出才是正确的D进制表示
local result = {}
for i = #out, 1, -1 do
    result[#result + 1] = out[i]
end
-- 输出结果
print(table.concat(result))
