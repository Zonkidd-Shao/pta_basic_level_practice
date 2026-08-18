-- 题目编号: 1079 延迟的回文数
-- 实现原理: 判断一个数是否为回文数，若不是则将其与反转后的数相加得到新数，重复此过程最多10次，直到找到回文数或达到迭代上限。
local n = io.read("l")  -- 读取输入的数字（以字符串形式存储，方便反转和处理大数）

-- 定义反转字符串的函数
local function rev(s)
    return s:reverse()
end

local found = false  -- 标记是否找到回文数

-- 最多迭代10次（i从0到10表示第0次到第10次判断）
for i = 0, 10 do
    -- 判断当前数字是否为回文数（正序等于逆序）
    if n == rev(n) then
        print(n .. " is a palindromic number.")
        found = true  -- 标记找到
        break  -- 跳出循环
    end
    -- 已经到第10次还没找到，不再继续相加
    if i == 10 then
        break
    end
    -- 将当前数和其反转数相加
    local a, b = tonumber(n), tonumber(rev(n))
    print(n .. " + " .. rev(n) .. " = " .. (a + b))
    n = tostring(a + b)  -- 更新n为相加后的结果（转回字符串）
end

-- 10次迭代后仍未找到回文数
if not found then
    print("Not found in 10 iterations.")
end
