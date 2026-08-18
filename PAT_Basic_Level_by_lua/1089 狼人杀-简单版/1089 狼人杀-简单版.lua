-- 题目编号: 1089 狼人杀-简单版
-- 实现原理: 枚举两狼人组合(x,y)，模拟每个人说的话：若说的与实际不符则为说谎。统计总说谎人数是否为2，且其中狼人说谎人数是否为1。找到第一组满足条件的组合即输出。
local n = tonumber(io.read())  -- 玩家总数
local a = {}  -- 存储每个人说的话（正数表示指认某号是好人，负数表示指认某号是狼人）

-- 读取每个人的陈述
for i = 1, n do
    a[i] = io.read("*n")
end

-- 枚举所有可能的两狼人组合(x,y)，x<y保证不重复
for x = 1, n - 1 do
    for y = x + 1, n do
        local lie, w = 0, 0  -- lie:总说谎人数，w:狼人中说谎的人数
        -- 遍历每个人，判断其是否说谎
        for i = 1, n do
            local wolf = i == x or i == y  -- 当前玩家i是不是狼人
            -- 玩家i指认的目标是不是狼人（取绝对值看是不是x或y）
            local target = math.abs(a[i]) == x or math.abs(a[i]) == y
            -- 判断是否说谎：
            -- - 如果a[i]>0（说某人是好人），但实际那人是狼人 → 说谎
            -- - 如果a[i]<0（说某人是狼人），但实际那人是好人 → 说谎
            local bad = a[i] > 0 and not target or a[i] < 0 and target
            if bad then
                lie = lie + 1  -- 总说谎人数+1
                if wolf then
                    w = w + 1  -- 如果是狼人说谎，w+1
                end
            end
        end
        -- 满足条件：总共有2人说谎，且其中恰好1个是狼人
        if lie == 2 and w == 1 then
            print(x .. " " .. y)
            return  -- 找到第一个解就退出
        end
    end
end
