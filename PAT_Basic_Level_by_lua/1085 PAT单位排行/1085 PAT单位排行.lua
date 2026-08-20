-- 题目编号: 1085 PAT单位排行
-- 实现原理: 解析每行考生信息（准考证号、得分、学校），将学校名统一转为小写作为键，累加加权得分（B级除1.5、A级不变、T级乘1.5）并统计考生人数。取整后按总分降序、人数升序、校名升序排序，输出排名（同分排名并列）。
local n = tonumber(io.read())  -- 读取考生人数
local s = {}  -- 以学校名（小写）为键的哈希表，存储学校信息

-- 处理每个考生
for i = 1, n do
    -- 正则匹配：准考证号、得分、学校
    local id, score, school = io.read("l"):match("^(%S+)%s+(%d+)%s+(%S+)$")
    school = school:lower()  -- 学校名转为小写，统一比较
    
    -- 若学校不存在则初始化：{校名, 加权总分分子, 考生人数}
    s[school] = s[school] or {school, 0, 0}
    
    -- 统一乘以6：B级得分乘4，A级乘6，T级乘9，避免浮点误差
    local w = id:sub(1, 1) == "B" and 4
              or id:sub(1, 1) == "T" and 9
              or 6
    
    s[school][2] = s[school][2] + tonumber(score) * w
    s[school][3] = s[school][3] + 1  -- 考生人数加1
end

-- 收集所有学校到数组中，并对加权总分向下取整
local a = {}
for _, v in pairs(s) do
    v[2] = math.floor(v[2] / 6)  -- 总分取整
    a[#a + 1] = v
end

-- 排序规则：
-- 1. 总分降序
-- 2. 人数升序
-- 3. 校名字典序升序
table.sort(a, function(x, y)
    if x[2] ~= y[2] then return x[2] > y[2] end
    if x[3] ~= y[3] then return x[3] < y[3] end
    return x[1] < y[1]
end)

print(#a)  -- 输出学校总数

-- 输出排名（同分并列）
local rank, last = 0, nil  -- rank为当前排名，last为上一个学校的总分
for i, v in ipairs(a) do
    -- 总分与上一个不同，排名更新为当前位置i
    if v[2] ~= last then
        rank = i
        last = v[2]
    end
    -- 输出：排名 学校名 总分 人数
    print(rank .. " " .. v[1] .. " " .. v[2] .. " " .. v[3])
end
