# 题目名称：2019数列
# 题目编号：PAT Basic 1106
# 实现原理：
#   构造一个无穷数列，前4项为2、0、1、9，第n项(n>4)为前4项之和的个位数字。
#   输出前n项。解题思路：递推生成数列，每项等于前四项之和取模10。
#   可直接用数组或变量滚动计算，由于每次只需前4项，可用滑动窗口优化空间。
# 时间复杂度：O(n)，依次计算n项，每项为常数时间运算
# 空间复杂度：O(n)，存储前n项（或O(1)若只需边算边输出）
n<-as.integer(scan("stdin",quiet=TRUE)[1]);base<-c(2L,0L,1L,9L);if(n<=4){cat(paste0(base[1:n],collapse=""),"\n")}else{for(i in 5:n)base[i]<-sum(base[(i-4):(i-1)])%%10L;cat(paste0(base,collapse=""),"\n")}
