-- 题目编号: 1109 擅长C
-- 实现原理: 先读取26个大写字母的7行点阵图形存入数组f。然后读取一行字符串，用正则匹配提取所有连续大写字母单词。对每个单词，逐行将各字母对应的点阵行拼接在一起输出，单词间用空行分隔。

local f = {}  -- f[i]存储第i个大写字母（A=1, B=2, ...）的7行点阵

-- 读取26个大写字母的点阵图形，每个字母7行
for i = 1, 26 do
    f[i] = {}
    for r = 1, 7 do
        f[i][r] = io.read("l")
    end
end

local s = io.read("l")  -- 读取输入字符串
local words = {}         -- 存储提取出的大写字母单词

-- 用正则匹配提取所有连续的大写字母序列作为单词
for w in s:gmatch("%u+") do
    words[#words + 1] = w
end

-- 逐个输出单词的点阵
for z, w in ipairs(words) do
    -- 单词之间输出空行分隔（第一个单词前不需要空行）
    if z > 1 then print() end
    -- 逐行输出：第r行
    for r = 1, 7 do
        local o = {}
        -- 将当前单词中每个字母的第r行点阵拼接起来
        for i = 1, #w do
            -- 通过ASCII码计算字母索引（A=65，减64得1）
            o[#o + 1] = f[string.byte(w:sub(i, i)) - 64][r]
        end
        -- 字母之间用空格分隔输出
        print(table.concat(o, " "))
    end
end
