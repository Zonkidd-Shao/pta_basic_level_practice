# 题目名称：害死人不偿命的(3n+1)猜想
# 题目编号：PAT Basic 1001
# 实现原理：
#   根据卡拉兹猜想，对正整数 n 反复进行如下操作直到 n=1：
#   若 n 为偶数则除以 2，若 n 为奇数则 (3n+1) 除以 2。
#   使用循环计数操作步数，每执行一次操作步数加一，最终输出总步数。
# 时间复杂度：O(log n) - 每次循环 n 至少减半，循环次数与 n 的对数成正比
# 空间复杂度：O(1) - 只使用常数个变量存储中间结果
n <- as.integer(scan(file = "stdin", quiet = TRUE)[1])
steps <- 0L
while (n != 1L) { n <- if (n %% 2L == 0L) n %/% 2L else (3L * n + 1L) %/% 2L; steps <- steps + 1L }
cat(steps, "\n")
