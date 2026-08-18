-- 题目编号: 1091 N-自守数
-- 实现原理: 对于每个数K，枚举N从1到9，计算N*K²，通过取模10^len(K)判断末尾是否与K相同，找到第一个满足条件的N并输出，否则输出No。
local m = tonumber(io.read())  -- 读取待检测的数字个数m
local a = {}  -- 存储所有待检测的数字

-- 读取所有输入数字（从标准输入全部内容中匹配数字）
for x in io.read("a"):gmatch("%d+") do
    a[#a + 1] = tonumber(x)
end

-- 对每个数字进行检测
for i = 1, m do
    local k = a[i]  -- 当前待检测的数K
    local p = 10 ^ #tostring(k)  -- 10的K的位数次方，用于取模判断末尾
    local ok = false  -- 标记是否找到满足条件的N
    
    -- 枚举N从1到9
    for n = 1, 9 do
        local x = n * k * k  -- 计算 N * K²
        -- 判断 N*K² 的末尾是否等于 K（通过取模实现）
        if x % p == k then
            print(n .. " " .. x)  -- 输出N和 N*K²
            ok = true
            break  -- 找到第一个就退出
        end
    end
    
    -- 没有找到满足条件的N
    if not ok then
        print("No")
    end
end
