-- 题目编号: 1052 卖个萌
-- 实现原理: 定义提取函数f，使用正则匹配方括号内的表情符号存入数组。对手、眼、嘴三行分别提取表情集合。根据用户输入的手部索引，从对应集合中取出表情按指定格式拼接输出；若索引越界则输出"Are you kidding?"。
-- 定义提取函数：从字符串中提取所有方括号内的内容，返回数组
local function f(s)
    local r = {}
    -- 使用正则匹配 [xxx] 格式，提取括号内的内容
    for x in s:gmatch("%[([^%]]*)%]") do
        r[#r + 1] = x
    end
    return r
end
-- 分别读取三行输入，提取手部、眼部、嘴部表情集合
local h, e, m = f(io.read("l")), f(io.read("l")), f(io.read("l"))
-- 读取查询次数
for _ = 1, tonumber(io.read()) do
    local v = {}
    -- 从输入行中提取5个数字索引
    for x in io.read("l"):gmatch("%d+") do
        v[#v + 1] = tonumber(x)
    end
    -- 检查索引数量是否为5，且所有索引都在有效范围内
    if #v == 5 and h[v[1]] and e[v[2]] and m[v[3]] and e[v[4]] and h[v[5]] then
        -- 按格式拼接输出：左手(左眼 嘴 右眼)右手
        print(h[v[1]] .. "(" .. e[v[2]] .. m[v[3]] .. e[v[4]] .. ")" .. h[v[5]])
    else
        -- 索引无效，输出错误提示
        print("Are you kidding me? @\\/@")
    end
end
