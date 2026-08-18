-- 题目编号: 1084 外观数列
-- 实现原理: 外观数列的每一项都是对前一项的"描述"——从左到右扫描字符串，统计连续相同数字的个数，将数字和个数拼接形成下一项。重复此过程N-1次得到第N项。
local s, n = io.read("*n"), io.read("*n")  -- s为初始数字，n为要求的项数
s = tostring(s)  -- 转为字符串方便处理

-- 从第2项开始迭代到第n项（共迭代n-1次）
for z = 2, n do
    local o = {}  -- 存储当前项的各段结果
    local i = 1  -- 当前扫描位置指针
    -- 遍历整个字符串
    while i <= #s do
        local j = i  -- 从i开始向后查找连续相同字符
        -- 找到连续相同数字的结束位置
        while j <= #s and s:sub(j, j) == s:sub(i, i) do
            j = j + 1
        end
        -- 拼接：数字 + 连续出现的次数
        o[#o + 1] = s:sub(i, i) .. (j - i)
        i = j  -- 移动到下一个不同数字的位置
    end
    s = table.concat(o)  -- 更新s为新生成的项
end

print(s)  -- 输出第n项
