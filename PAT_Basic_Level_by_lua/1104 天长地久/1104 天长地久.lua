-- 题目编号: 1104 天长地久
-- 实现原理: 使用深度优先搜索（DFS）枚举所有k位数，剪枝条件为当前各位和不超过m。找到各位和为m的数a后，计算a+1的各位和n，若m与n的最大公约数为质数，则为一组解。所有解按(n, a)排序输出。

-- 求最大公约数（欧几里得算法）
local function gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a
end

-- 判断一个数是否为质数
local function prime(x)
    if x <= 2 then return false end  -- 小于等于2的数不是质数
    for i = 2, math.floor(math.sqrt(x)) do
        if x % i == 0 then return false end  -- 能被整除则不是质数
    end
    return true
end

local t = tonumber(io.read())  -- 读取测试用例数量

-- 处理每个测试用例
for cs = 1, t do
    local k, m = io.read("*n"), io.read("*n")  -- k位数，各位和为m
    print("Case " .. cs)
    local out = {}  -- 存储所有符合条件的解
    
    -- 深度优先搜索枚举k位数
    -- pos: 当前处理到第几位，sum: 当前各位数字之和，s: 当前拼接的数字字符串
    local function dfs(pos, sum, s)
        -- 已经枚举完k位
        if pos > k then
            -- 检查各位和是否等于m
            if sum == m then
                local a = tonumber(s)  -- 当前数a
                local q = a + 1         -- a + 1
                local n = 0             -- 计算a+1的各位数字之和n
                
                -- 遍历a+1的每一位数字，求和
                for d in tostring(q):gmatch("%d") do
                    n = n + tonumber(d)
                end
                
                -- 判断m和n的最大公约数是否为质数
                if prime(gcd(m, n)) then
                    out[#out + 1] = {n, a}  -- 存储解：{n, a}
                end
            end
            return
        end
        
        -- 第一位不能为0，所以lo从1开始，其余位从0开始
        local lo = pos == 1 and 1 or 0
        -- 枚举当前位可能的数字0-9
        for d = lo, 9 do
            -- 剪枝：如果当前和加上当前数字超过m，跳过
            if sum + d <= m then
                dfs(pos + 1, sum + d, s .. d)
            end
        end
    end
    
    dfs(1, 0, "")  -- 从第1位开始，当前和为0，当前数字为空字符串
    
    -- 按n升序、a升序排序
    table.sort(out, function(x, y)
        return x[1] ~= y[1] and x[1] < y[1] or x[2] < y[2]
    end)
    
    -- 输出结果
    if #out == 0 then
        print("No Solution")
    else
        for _, v in ipairs(out) do
            print(v[1] .. " " .. v[2])
        end
    end
end
