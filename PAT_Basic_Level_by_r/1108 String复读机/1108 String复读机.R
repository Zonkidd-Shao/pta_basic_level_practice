# 题目名称：String复读机
# 题目编号：PAT Basic 1108
# 实现原理：
#   将输入字符串中的字符按"String"的顺序重新排列输出，忽略其他字符。
#   六种字符(S,t,r,i,n,g)数量可能不同，按顺序循环输出直到所有字符用完。
#   解题思路：1. 统计输入字符串中S、t、r、i、n、g各字符的出现次数；
#   2. 按S→t→r→i→n→g的顺序循环，每次输出还有剩余的字符，直到全部输出完毕。
#   注意区分大小写，仅输出String中的6个字符。
# 时间复杂度：O(n + k)，n为输入长度，k为输出长度（统计+循环输出）
# 空间复杂度：O(1)，仅用6个计数器
s<-scan("stdin",what="",quiet=TRUE)[1];a<-strsplit(s,"")[[1]];for(ch in strsplit("GPLT","")[[1]])cat(strrep(ch,sum(toupper(a)==ch)),sep="");cat("\n")
