-- 题目编号: 1007 素数对猜想
-- 实现原理: 定义素数判断函数（仅检查奇数因子），遍历3到n-2之间的奇数，统计满足x和x+2均为素数的素数对个数。

-- 读取输入的正整数n
local n = tonumber(io.read())

-- 判断一个数是否为素数的函数
local function is_prime(x)
    -- 小于2的数不是素数
    if x < 2 then
        return false
    end
    -- 2是唯一的偶素数
    if x == 2 then
        return true
    end
    -- 偶数（除了2）都不是素数
    if x % 2 == 0 then
        return false
    end
    -- 从3开始，只检查奇数因子，步长为2
    local divisor = 3
    -- 只需检查到sqrt(x)，因为如果x有大于sqrt(x)的因子，则必然有一个对应的小于sqrt(x)的因子
    while divisor * divisor <= x do
        -- 如果能被整除，则不是素数
        if x % divisor == 0 then
            return false
        end
        -- 检查下一个奇数
        divisor = divisor + 2
    end
    -- 没有找到因子，是素数
    return true
end

-- 计数器：统计满足条件的素数对个数
local count = 0
-- 遍历3到n-2之间的所有奇数（步长为2）
-- 只检查奇数，因为除了2以外所有素数都是奇数
for x = 3, n - 2, 2 do
    -- 如果x和x+2都是素数，则构成一个素数对
    if is_prime(x) and is_prime(x + 2) then
        count = count + 1
    end
end
-- 输出素数对的个数
print(count)
