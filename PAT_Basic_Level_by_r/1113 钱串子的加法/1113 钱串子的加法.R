# 题目名称：钱串子的加法
# 题目编号：PAT Basic 1113
# 实现原理：
#   实现30进制大数加法。数字0-9用0-9表示，10-29用a-t表示。输入两个30进制数（可能很长），
#   输出它们的和，结果不得有前导零。
#   解题思路：1. 建立字符到数值的映射（0-9, a-t对应0-29）；
#   2. 从最低位（字符串末尾）开始，逐位相加，记录进位carry；
#   3. 每位和s = carry + a的当前位 + b的当前位，结果位为s%30，新进位为s%/%30；
#   4. 直到两个数都处理完且进位为0；5. 反转结果（因为从低位开始加），去除前导零后输出。
#   类似手工竖式加法，只不过基数是30而不是10。
# 时间复杂度：O(max(L1, L2))，L1和L2为两个数的位数，逐位相加
# 空间复杂度：O(max(L1, L2))，存储结果
x <- strsplit(scan("stdin", what="", quiet=TRUE), "")
a <- x[[1]]; b <- x[[2]]; val <- function(c) match(c, c(as.character(0:9), letters[1:20])) - 1L
i <- length(a); j <- length(b); carry <- 0L; out <- character()
while(i>0 || j>0 || carry>0) { s <- carry + if(i>0) val(a[i]) else 0L + if(j>0) val(b[j]) else 0L; out <- c(c(as.character(0:9),letters[1:20])[s%%30+1L],out); carry <- s%/%30L; i<-i-1L;j<-j-1L }
cat(paste0(out,collapse=""),"\n")
