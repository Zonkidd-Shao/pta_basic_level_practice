-- 题目编号: 1009 说反话
-- 实现原理: 读取一行字符串，按空格分割为单词列表，然后逆序遍历单词列表并用空格拼接输出。

-- 存储所有单词的数组
local words = {}
-- 读取一行输入，用正则匹配所有非空白字符序列（即单词）
for word in io.read("l"):gmatch("%S+") do
    words[#words + 1] = word
end

-- 存储反转后结果的数组
local result = {}
-- 从后往前遍历单词数组，实现逆序
for i = #words, 1, -1 do
    result[#result + 1] = words[i]
end
-- 用空格连接所有单词并输出
print(table.concat(result, " "))
