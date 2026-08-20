-- 题目编号: 1076 Wifi密码
-- 实现原理: 每行有四个选项（A-D），查找以"T"结尾的选项，其对应的选项编号即为一位密码数字，将所有位拼接输出。
local n = tonumber(io.read())  -- 读取题目数量n
local o = {}  -- 用于存储每一行对应的密码数字

-- 遍历每一行题目
for i = 1, n do
    local s = io.read("l")  -- 读取一行内容
    -- 用gmatch匹配所有非空白字符序列（即每个选项）
    for x in s:gmatch("%S+") do
        -- 检查该选项是否以"T"结尾（表示正确答案）
        if x:sub(-1) == "T" then
            o[#o + 1] = string.byte(x, 1) - string.byte("A") + 1
            break  -- 找到后跳出循环，处理下一行
        end
    end
end
print(table.concat(o))  -- 将所有数字拼接成字符串输出
