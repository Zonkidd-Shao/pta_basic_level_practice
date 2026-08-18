-- 题目编号: 1096 大美数
-- 实现原理: 找出N的前4个因子，判断N是否能被这4个因子之和整除，若整除则输出Yes，否则输出No。
local k = tonumber(io.read())  -- 读取待检测的数字个数k

-- 对每个数字进行检测
for i = 1, k do
    local n = io.read("*n")  -- 当前待检测的数N
    local a = {}  -- 存储N的因子（按从小到大顺序）
    
    -- 从1开始枚举，找N的因子
    for d = 1, n do
        if n % d == 0 then
            a[#a + 1] = d  -- 找到一个因子
            if #a == 4 then
                break  -- 找到前4个因子就停止
            end
        end
    end
    
    -- 判断：必须至少有4个因子，且N能被前4个因子之和整除
    print(#a == 4 and n % (a[1] + a[2] + a[3] + a[4]) == 0 and "Yes" or "No")
end
