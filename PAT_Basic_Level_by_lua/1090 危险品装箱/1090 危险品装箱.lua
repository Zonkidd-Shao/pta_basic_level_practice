-- 题目编号: 1090 危险品装箱
-- 实现原理: 用哈希表记录每对不相容物品的映射关系（双向）。对每批货物，双重循环检查任意两物品是否在不相容表中，若存在则标记为不安全，最终输出"Yes"或"No"。
local n, m = io.read("*n"), io.read("*n")  -- n:不相容物品对数，m:货物批次数
local bad = {}  -- 哈希表，bad[a][b]=true表示a和b不相容（双向存储）

-- 构建不相容物品的映射表
for i = 1, n do
    local a, b = io.read("*n"), io.read("*n")  -- 读取一对不相容物品
    bad[a] = bad[a] or {}  -- 若a不存在则初始化
    bad[b] = bad[b] or {}  -- 若b不存在则初始化
    bad[a][b] = true  -- 标记a和b不相容
    bad[b][a] = true  -- 双向标记，b和a也不相容
end

-- 处理每批货物
for i = 1, m do
    local k = io.read("*n")  -- 这批货物的数量
    local a = {}  -- 存储这批货物的物品编号
    local ok = true  -- 标记是否安全（默认为安全）
    
    -- 读取这批货物的所有物品
    for j = 1, k do
        a[j] = io.read("*n")
    end
    
    -- 双重循环检查任意两个物品是否不相容
    for x = 1, k do
        for y = x + 1, k do
            -- 如果bad[a[x]]存在且bad[a[x]][a[y]]为true，说明两物品不相容
            if bad[a[x]] and bad[a[x]][a[y]] then
                ok = false  -- 标记为不安全
            end
        end
    end
    
    -- 输出结果：安全输出Yes，不安全输出No
    print(ok and "Yes" or "No")
end
