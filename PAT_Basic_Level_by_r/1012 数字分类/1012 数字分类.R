# 题目名称：数字分类
# 题目编号：PAT Basic 1012
# 实现原理：
#   给定 N 个正整数，按被 5 除的余数分为 5 类分别计算：
#   A1：能被 5 整除的偶数之和
#   A2：被 5 除余 1 的数的交错和（正负交替）
#   A3：被 5 除余 2 的数的个数
#   A4：被 5 除余 3 的数的平均数（保留 1 位小数）
#   A5：被 5 除余 4 的数中的最大值
#   某类无数字时输出 N。利用向量化操作和逻辑索引高效分类计算。
# 时间复杂度：O(n) - n 为数字个数，只需遍历一次进行分类和计算
# 空间复杂度：O(n) - 存储所有输入数字
z <- as.integer(scan("stdin",quiet=TRUE)); x <- z[-1]; a1 <- sum(x[x%%5L==0L & x%%2L==0L]); q <- x[x%%5L==1L]; a2 <- sum(q * rep(c(1L,-1L),length.out=length(q))); a3 <- length(x[x%%5L==2L]); a4 <- x[x%%5L==3L]; a5 <- x[x%%5L==4L]; out <- c(ifelse(a1==0,NA,a1),ifelse(length(q)==0,NA,a2),ifelse(a3==0,NA,a3),ifelse(length(a4)==0,NA,sprintf("%.1f",mean(a4))),ifelse(length(a5)==0,NA,max(a5))); cat(paste(ifelse(is.na(out),"N",out),collapse=" "),"\n")
