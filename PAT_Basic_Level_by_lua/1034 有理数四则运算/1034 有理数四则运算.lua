-- 题目编号: 1034 有理数四则运算
-- 实现原理: 用辗转相除法（欧几里得算法）求最大公约数化简分数。对两个分数执行加、减、乘、除四则运算，结果化为最简带分数格式输出，注意分母为0时输出"Inf"。

-- 求最大公约数（辗转相除法 / 欧几里得算法）
local function gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return math.abs(a)
end

-- 约分函数：将分数 n/d 化为最简形式
local function reduce(n, d)
    local g = gcd(n, d)
    return math.floor(n / g), math.floor(d / g)
end

-- 将分数格式化为可读字符串（带分数形式，负数用括号包裹）
local function show(n, d)
    -- 分母为 0，输出 Inf
    if d == 0 then return "Inf" end
    -- 分子为 0，输出 0
    if n == 0 then return "0" end
    
    -- 判断是否为负数，取绝对值处理
    local negative = n * d < 0
    n, d = math.abs(n), math.abs(d)
    n, d = reduce(n, d)  -- 约分为最简分数
    
    -- 构造输出字符串：整数部分 + 真分数部分
    local s = ""
    if n >= d then
        -- 有整数部分
        s = math.floor(n / d)
        if n % d ~= 0 then
            -- 有余数，加上真分数部分
            s = s .. " " .. n % d .. "/" .. d
        end
    else
        -- 纯分数
        s = n .. "/" .. d
    end
    
    -- 负数用括号包裹
    return negative and "(-" .. s .. ")" or s
end

-- 读取输入行，解析两个分数 a/b 和 c/d
local line = io.read("l")
local a, b, c, d = line:match("^([%-]?%d+)/(%d+)%s+([%-]?%d+)/(%d+)$")
a, b, c, d = tonumber(a), tonumber(b), tonumber(c), tonumber(d)

-- 格式化两个输入分数用于显示
local x, y = show(a, b), show(c, d)

-- 加法：a/b + c/d = (a*d + c*b) / (b*d)
print(x .. " + " .. y .. " = " .. show(a * d + c * b, b * d))
-- 减法：a/b - c/d = (a*d - c*b) / (b*d)
print(x .. " - " .. y .. " = " .. show(a * d - c * b, b * d))
-- 乘法：a/b * c/d = (a*c) / (b*d)
print(x .. " * " .. y .. " = " .. show(a * c, b * d))
-- 除法：a/b / c/d = (a*d) / (b*c)
print(x .. " / " .. y .. " = " .. show(a * d, b * c))
