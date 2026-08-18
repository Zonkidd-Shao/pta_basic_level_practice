# 题目名称：是否存在相等的差
# 题目编号：PAT Basic 1083
# 实现原理：
#   计算每张卡片正反面数字的绝对差值，统计每个差值出现的次数，然后按从大到小输出出现多次的差值。
#   关键步骤：
#   1. 读取N和背面数字序列
#   2. 用 seq_along(a) 生成正面数字序列 1,2,...,N
#   3. 计算每个位置的绝对差值 abs(a - seq_along(a))
#   4. 用 table 函数统计每个差值出现的次数
#   5. 筛选出出现次数大于1的差值
#   6. 按差值从大到小排序，依次输出差值和重复次数
#   使用 table 进行频数统计是R语言中高效的计数方法。
# 时间复杂度：O(N log N)，主要由排序操作决定，table统计为O(N)
# 空间复杂度：O(N)，存储差值数组和统计表
z<-as.integer(scan("stdin",quiet=TRUE));a<-z[-1];d<-table(abs(a-seq_along(a)));for(v in sort(as.integer(names(d[d>1])),decreasing=TRUE))cat(v,d[as.character(v)],"\n")
