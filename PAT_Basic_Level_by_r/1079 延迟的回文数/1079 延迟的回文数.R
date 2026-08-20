# 题目名称：延迟的回文数
# 题目编号：PAT Basic 1079
# 实现原理：
#   迭代判断一个数是否为回文数，若不是则将其与逆转数相加，
#   重复此过程最多10次。如果在10次内得到回文数则输出成功，
#   否则输出失败。使用字符串反转来实现数字逆转，
#   通过比较字符串与其反转判断是否为回文数。
# 时间复杂度：O(10*D)，D为数字位数，最多10次迭代
# 空间复杂度：O(D)，存储数字字符串
add<-function(a,b){x<-as.integer(strsplit(a,"",fixed=TRUE)[[1]]);y<-as.integer(strsplit(b,"",fixed=TRUE)[[1]]);i<-length(x);j<-length(y);carry<-0L;out<-character();while(i>0||j>0||carry>0){s<-carry;if(i>0)s<-s+x[i];if(j>0)s<-s+y[j];out<-c(as.character(s%%10L),out);carry<-s%/%10L;i<-i-1L;j<-j-1L};paste0(out,collapse="")};n<-scan("stdin",what="",quiet=TRUE)[1];for(i in 0:10){r<-paste0(rev(strsplit(n,"",fixed=TRUE)[[1]]),collapse="");if(n==r){cat(n," is a palindromic number.\n",sep="");break};c<-add(n,r);cat(n," + ",r," = ",c,"\n",sep="");if(i==9){cat("Not found in 10 iterations.\n");break};n<-c}
