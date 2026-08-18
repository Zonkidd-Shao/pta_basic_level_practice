-- 题目编号: 1095 解码PAT准考证
-- 实现原理: 读取N条考生记录（准考证号和成绩），根据M个查询类型分别处理：类型1按准考证号首位字母筛选并按成绩降序、准考证号升序排序；类型2按考场号（第5-10位）统计人数和总分；类型3按考点代码（前3位）统计各日期的考生人数。
local n, m = io.read("*n"), io.read("*n")  -- n:考生数，m:查询数
io.read("l")  -- 消耗第一行末尾的换行符
local a = {}  -- 存储所有考生记录

-- 读取所有考生信息
for i = 1, n do
    local id, s = io.read("l"):match("^(%S+)%s+(%d+)$")  -- 正则匹配准考证号和成绩
    a[i] = {id, tonumber(s)}
end

-- 处理每个查询
for q = 1, m do
    local typ, x = io.read("l"):match("^(%S+)%s+(%S+)$")  -- 匹配查询类型和参数
    print("Case " .. q .. ": " .. typ .. " " .. x)
    
    -- 类型1：按级别（准考证首字母）筛选并排序
    if typ == "1" then
        local b = {}
        -- 筛选出首字母等于x的考生
        for _, v in ipairs(a) do
            if v[1]:sub(1, 1) == x then
                b[#b + 1] = v
            end
        end
        -- 排序：成绩降序，成绩相同则准考证号升序
        table.sort(b, function(u, v)
            return u[2] ~= v[2] and u[2] > v[2] or u[1] < v[1]
        end)
        -- 输出结果
        if #b == 0 then
            print("NA")
        else
            for _, v in ipairs(b) do
                print(v[1] .. " " .. v[2])
            end
        end
    
    -- 类型2：按考场号（准考证第5-10位）统计人数和总分
    elseif typ == "2" then
        local c, s = 0, 0  -- c:人数，s:总分
        for _, v in ipairs(a) do
            if v[1]:sub(5, 10) == x then
                c = c + 1  -- 人数+1
                s = s + v[2]  -- 累加总分
            end
        end
        print(c == 0 and "NA" or c .. " " .. s)
    
    -- 类型3：按考点代码（准考证前3位）统计各日期的考生人数
    else
        local c = {}  -- 哈希表，键为日期（第5-10位），值为该日期考生人数
        for _, v in ipairs(a) do
            if v[1]:sub(1, 3) == x then
                local d = v[1]:sub(5, 10)  -- 提取日期部分
                c[d] = (c[d] or 0) + 1  -- 统计该日期人数
            end
        end
        -- 收集所有日期到数组中
        local b = {}
        for d in pairs(c) do
            b[#b + 1] = d
        end
        -- 按日期升序排序
        table.sort(b)
        -- 输出结果
        if #b == 0 then
            print("NA")
        else
            for _, d in ipairs(b) do
                print(d .. " " .. c[d])
            end
        end
    end
end
