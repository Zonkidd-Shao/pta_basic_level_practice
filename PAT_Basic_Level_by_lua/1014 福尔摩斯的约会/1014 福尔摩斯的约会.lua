-- 题目编号: 1014 福尔摩斯的约会
-- 实现原理: 依次扫描前两对字符串找到第一对相同的大写字母（A~G）确定星期，再在后续位置找到相同的数字或字母（A~N）确定小时；扫描后两对字符串找到第一对相同的英文字母位置确定分钟

-- 读取4行输入字符串
local a, b, c, d = io.read("l"), io.read("l"), io.read("l"), io.read("l")

-- 星期对照表：A-G对应星期一到星期日
local days = { A = "MON", B = "TUE", C = "WED", D = "THU", E = "FRI", F = "SAT", G = "SUN" }
-- 存储解析出的星期和小时
local day, hour

-- 遍历前两个字符串的对应位置（取较短的长度）
for i = 1, math.min(#a, #b) do
    -- 取出两个字符串当前位置的字符
    local x, y = a:sub(i, i), b:sub(i, i)
    
    -- 还没找到星期，且两个字符相同且是A~G中的一个
    if not day and x == y and days[x] then
        day = days[x]
    -- 已经找到星期，继续找小时：两个字符相同，且是数字0-9或字母A-N
    elseif day and x == y and ((x >= "0" and x <= "9") or (x >= "A" and x <= "N")) then
        -- 数字0-9直接转换，字母A-N对应10-23
        hour = x >= "0" and x <= "9" and tonumber(x) or string.byte(x) - string.byte("A") + 10
        -- 找到小时后跳出循环
        break
    end
end

-- 存储解析出的分钟
local minute
-- 遍历后两个字符串的对应位置
for i = 1, math.min(#c, #d) do
    -- 取出第一个字符串当前位置的字符
    local x = c:sub(i, i)
    -- 如果两个字符相同，且是英文字母，则该位置的下标（从0开始）就是分钟
    if x == d:sub(i, i) and x:match("%a") then
        minute = i - 1
        break
    end
end

-- 按格式输出结果：星期 小时:分钟（小时和分钟都占2位，不足补0）
print(string.format("%s %02d:%02d", day, hour, minute))
