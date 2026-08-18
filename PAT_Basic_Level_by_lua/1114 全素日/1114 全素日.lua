-- 题目编号: 1114 全素日
-- 实现原理: 对输入数字字符串的每个后缀子串，依次判断其是否为素数（从2到根号试除），若所有后缀均为素数则输出"All Prime!"。

local s = io.read("l")  -- 读取输入的数字字符串

-- 判断一个数是否为素数
local function p(x)
    if x < 2 then return false end  -- 小于2的数不是素数
    -- 从2到根号x试除
    for i = 2, math.floor(math.sqrt(x)) do
        if x % i == 0 then return false end  -- 能被整除则不是素数
    end
    return true
end

local ok = true  -- 标记是否所有后缀都是素数

-- 遍历每个后缀子串
for i = 1, #s do
    local t = s:sub(i)  -- 从第i位开始的后缀子串
    local yes = p(tonumber(t))  -- 判断是否为素数
    -- 输出当前后缀和判断结果
    print(t .. " " .. (yes and "Yes" or "No"))
    -- 如果有一个不是素数，标记ok为false
    if not yes then ok = false end
end

-- 如果所有后缀都是素数，输出提示
if ok then
    print("All Prime!")
end
