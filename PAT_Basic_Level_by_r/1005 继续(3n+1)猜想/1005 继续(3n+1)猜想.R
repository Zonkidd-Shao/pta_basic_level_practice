# 题目名称：继续(3n+1)猜想
# 题目编号：PAT Basic 1005
# 实现原理：
#   对每个输入的数字，按照卡拉兹猜想的规则进行迭代，将迭代过程中出现的所有数
#   （除了初始数本身）加入"被覆盖"集合。遍历完所有数字后，原始输入中不在
#   "被覆盖"集合中的数即为"关键数"。最后将关键数按从大到小排序输出。
#   核心思想：利用集合记录所有被覆盖的数，通过集合差集运算找出关键数。
# 时间复杂度：O(K * log n) - K 为输入数字个数，每个数字迭代次数与其大小的对数成正比
# 空间复杂度：O(K * log n) - 存储所有被覆盖的数，总数约为 K 乘以每个数的平均迭代步数
z <- as.integer(scan("stdin", quiet=TRUE)); a <- z[-1]; covered <- integer(); for (v in a) { n <- v; while (n != 1L) { n <- if(n%%2L==0L) n%/%2L else (3L*n+1L)%/%2L; covered <- c(covered,n) } }; cat(paste(sort(setdiff(a,covered), decreasing=TRUE), collapse=" "), "\n")
