# 题目名称：一元多项式求导
# 题目编号：PAT Basic 1010
# 实现原理：
#   将输入的系数和指数按奇偶位置分别提取为两个数组。
#   一元多项式求导规则：系数为 a、指数为 b 的项求导后变为系数 a*b、指数 b-1。
#   过滤掉指数为 0 的项（常数项求导后消失），若过滤后无项则输出 "0 0"。
#   否则将新的系数和指数交替排列输出。
# 时间复杂度：O(n) - n 为多项式项数，只需一次遍历处理每一项
# 空间复杂度：O(n) - 存储系数和指数数组
z <- as.integer(scan("stdin",quiet=TRUE)); a <- z[seq(1,length(z),2)]; b <- z[seq(2,length(z),2)]; keep <- b != 0L; if(!any(keep)) cat("0 0\n") else cat(paste(rbind(a[keep]*b[keep],b[keep]-1L),collapse=" "),"\n")
