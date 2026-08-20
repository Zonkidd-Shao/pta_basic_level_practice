# 题目名称：多二了一点
# 题目编号：PAT Basic 1116
# 实现原理：
#   判断一个正整数是否"多二了一点"：若有2n个数位，则后n位组成的数比前n位组成的数恰好多2。
#   输入可能很大（可达10^1000位），需用字符串处理。
#   解题思路：1. 读入数字为字符串，判断长度是否为偶数；
#   2. 若不是偶数位，输出"Error: X digit(s)"；
#   3. 若是偶数位，将字符串分为前后两半，分别转为数值X和Y；
#   4. 判断X - Y是否等于2，按格式输出Yes或No。
#   注意：题目保证Y的个位不大于7，即X-Y=2时不会有借位问题，可直接字符串比较。
# 时间复杂度：O(L)，L为数字长度，字符串分割和比较
# 空间复杂度：O(L)，存储输入字符串
z<-scan("stdin",what="",quiet=TRUE)[1];norm<-function(s){s<-sub("^0+","",s);if(!nzchar(s))"0"else s};addsmall<-function(s,n){d<-as.integer(strsplit(s,"",fixed=TRUE)[[1]]);i<-length(d);while(i>0&&n>0){v<-d[i]+n;d[i]<-v%%10L;n<-v%/%10L;i<-i-1L};if(n>0)d<-c(as.integer(strsplit(as.character(n),"",fixed=TRUE)[[1]]),d);paste0(d,collapse="")};L<-nchar(z);if(L%%2==1){cat("Error: ",L," digit(s)\n",sep="")}else{h<-L%/%2;y<-substr(z,1,h);xx<-substr(z,h+1,L);yes<-norm(addsmall(norm(y),2L))==norm(xx);cat(if(yes)"Yes: "else"No: ",xx," - ",y,if(yes)" = 2"else" != 2","\n",sep="")}
