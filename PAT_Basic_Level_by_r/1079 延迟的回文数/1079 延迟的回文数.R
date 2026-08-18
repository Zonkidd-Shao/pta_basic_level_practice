# 题目名称：延迟的回文数
# 题目编号：PAT Basic 1079
# 实现原理：
#   迭代判断一个数是否为回文数，若不是则将其与逆转数相加，
#   重复此过程最多10次。如果在10次内得到回文数则输出成功，
#   否则输出失败。使用字符串反转来实现数字逆转，
#   通过比较字符串与其反转判断是否为回文数。
# 时间复杂度：O(10*D)，D为数字位数，最多10次迭代
# 空间复杂度：O(D)，存储数字字符串
n<-scan("stdin",what="",quiet=TRUE)[1];for(i in 0:10){r<-paste0(rev(strsplit(n,"")[[1]]),collapse="");if(n==r){cat(n," is a palindromic number.\n",sep="");break};cat(n," + ",r," = ",as.numeric(n)+as.numeric(r),"\n",sep="");n<-as.character(as.numeric(n)+as.numeric(r));if(i==9)cat("Not found in 10 iterations.\n")}
