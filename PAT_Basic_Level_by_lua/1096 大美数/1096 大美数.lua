-- 题目编号: 1096 大美数
-- 实现原理: 枚举N的四个不同正因子，判断N是否能被它们的和整除。
local k = tonumber(io.read())  -- 读取待检测的数字个数k

-- 对每个数字进行检测
for i = 1, k do
    local n = io.read("*n")  -- 当前待检测的数N
    local a = {}  -- 存储N的全部因子
    
    -- 从1开始枚举，找N的因子
    for d = 1, n do
        if n % d == 0 then
            a[#a + 1] = d
        end
    end
    
    local ok = false
    for p = 1, #a - 3 do
        for q = p + 1, #a - 2 do
            for r = q + 1, #a - 1 do
                for u = r + 1, #a do
                    if n % (a[p] + a[q] + a[r] + a[u]) == 0 then
                        ok = true
                    end
                end
            end
        end
    end
    print(ok and "Yes" or "No")
end
