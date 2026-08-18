-- 题目编号: 1027 打印沙漏
-- 实现原理: 根据等差数列求和公式(2n²-1)确定最大层数level，使沙漏所用符号数不超过给定数量。先从上到下打印倒三角，再从下到上打印正三角（不含顶层），最后输出剩余未使用的符号数。

-- 读取符号数量 n 和要打印的字符 ch
local n, ch = io.read("*n"), io.read("*l"):match("%S+")

-- 计算沙漏的最大层数 level
-- 沙漏总符号数公式：2 * level^2 - 1
-- 通过循环找到满足条件的最大 level
local level = 1
while 2 * (level + 1) * (level + 1) - 1 <= n do
    level = level + 1
end

-- 打印上半部分（倒三角）：从 level 层递减到 1 层
-- 每行前面的空格数 = level - i，符号数 = 2*i - 1
for i = level, 1, -1 do
    print(string.rep(" ", level - i) .. string.rep(ch, 2 * i - 1))
end

-- 打印下半部分（正三角）：从 2 层递增到 level 层（顶层已打印过）
for i = 2, level do
    print(string.rep(" ", level - i) .. string.rep(ch, 2 * i - 1))
end

-- 输出剩余未使用的符号数量
print(n - (2 * level * level - 1))
