-- 题目编号: 1013 数素数
-- 实现原理: 从2开始逐个判断素数（仅检查到平方根，跳过偶数），将素数存入数组，直到找到第n个素数，然后输出第m到第n个素数，每行10个

-- 读取两个整数m和n（输出第m到第n个素数）
local m, n = io.read("*n"), io.read("*n")

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
    -- 从3开始，只检查奇数因子，步长为2，直到sqrt(x)
    for d = 3, math.floor(math.sqrt(x)), 2 do
        -- 如果能被整除，则不是素数
        if x % d == 0 then
            return false
        end
    end
    -- 没有找到因子，是素数
    return true
end

-- primes: 存储找到的素数，x: 当前待判断的数，从2开始
local primes, x = {}, 2
-- 循环直到找到第n个素数
while #primes < n do
    -- 如果x是素数，加入素数数组
    if is_prime(x) then
        primes[#primes + 1] = x
    end
    -- 检查下一个数
    x = x + 1
end

-- 用于存储当前行的素数
local line = {}
-- 输出第m到第n个素数
for i = m, n do
    -- 将当前素数加入行数组
    line[#line + 1] = primes[i]
    -- 每行满10个，或者已经是最后一个素数，则输出该行
    if #line == 10 or i == n then
        print(table.concat(line, " "))
        -- 清空行数组，准备下一行
        line = {}
    end
end
