-- 题目编号: 1122 找奇葩
-- 实现原理: 利用异或运算的性质（a⊕a=0，a⊕0=a），将数组中所有数进行异或，最终结果即为出现奇数次的数。

local n = tonumber(io.read())  -- 读取数组元素个数
local x = 0                     -- 异或结果初始为0

-- 将所有数依次异或
-- 异或性质：相同数异或为0，0异或任何数等于该数本身
-- 因此出现偶数次的数会相互抵消，最终结果就是出现奇数次的数
for i = 1, n do
    local value = io.read("*n")
    if value % 2 == 1 then
        x = x ~ value
    end
end

print(x)
