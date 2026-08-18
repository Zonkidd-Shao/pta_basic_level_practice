-- 题目编号: 1099 性感素数
-- 实现原理: 定义素数判断函数（试除法到平方根），判断n和n±6是否均为素数。若n为性感素数则输出Yes及其伴侣（n-6或n+6），否则输出No并找下一个最小的性感素数。
local n = tonumber(io.read())  -- 读取输入的数n

-- 素数判断函数：试除法，判断x是否为素数
local function p(x)
    if x < 2 then return false end  -- 小于2的数不是素数
    -- 从2到sqrt(x)枚举，若能被整除则不是素数
    for i = 2, math.floor(math.sqrt(x)) do
        if x % i == 0 then return false end
    end
    return true  -- 都不能整除则是素数
end

-- 判断x是否为性感素数：x是素数，且x-6或x+6也是素数
local function sexy(x)
    return p(x) and (p(x - 6) or p(x + 6))
end

-- n本身是性感素数
if sexy(n) then
    print("Yes")
    -- 优先输出n-6（如果也是素数），否则输出n+6
    print(p(n - 6) and n - 6 or n + 6)
else
    -- 从n+1开始找下一个最小的性感素数
    repeat
        n = n + 1
    until sexy(n)
    print("No")
    print(n)
end
