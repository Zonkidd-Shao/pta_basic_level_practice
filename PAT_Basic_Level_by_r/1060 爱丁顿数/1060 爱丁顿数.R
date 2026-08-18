# 题目名称：爱丁顿数
# 题目编号：PAT Basic 1060
# 实现原理：
#   爱丁顿数 E 的定义：有 E 天骑车超过 E 英里的最大整数 E。
#   算法思路：
#   1. 将每天的骑车距离按降序排序
#   2. 排序后第 i 天（1 开始）的距离为 a[i]
#   3. 若 a[i] > i，说明至少有 i 天超过 i 英里
#   4. 找到满足 a[i] > i 的最大 i，即为爱丁顿数
#   使用排序 + 向量化比较高效求解。
# 时间复杂度：O(N log N)，主要由排序决定
# 空间复杂度：O(N)
z<-as.integer(scan("stdin",quiet=TRUE));a<-sort(z[-1],decreasing=TRUE);cat(max(c(0L,which(a>seq_along(a)))),"\n")
