# 题目名称：天长地久
# 题目编号：PAT Basic 1104
# 实现原理：
#   找出K位正整数A，满足各位数字之和为m，且A+1的各位数字之和n与m的最大公约数
#   是大于2的素数。解题思路：1. 用DFS枚举所有K位数字且各位和为m的数；
#   2. 对每个数A计算n = digits_sum(A+1)；3. 计算gcd(m,n)并判断是否为大于2的素数；
#   4. 收集所有符合条件的(n,A)，按n递增再按A递增排序后输出。
#   关键算法：深度优先搜索(DFS)生成数字组合，欧几里得算法求GCD，试除法判断素数。
# 时间复杂度：O(C(K+m-1, m-1) × K)，组合数级别的DFS，每个数计算数字和与素数判断
# 空间复杂度：O(K + S)，K为递归深度，S为结果集大小
x<-readLines("stdin",warn=FALSE);gcd<-function(a,b){while(b!=0L){t<-a%%b;a<-b;b<-t};a};prime<-function(v){if(v<=2)return(FALSE);if(v%%2==0)return(FALSE);if(v<9)return(TRUE);!any(v%%seq(3L,floor(sqrt(v)),by=2L)==0)};ds<-function(v)sum(as.integer(strsplit(as.character(v),"",fixed=TRUE)[[1]]));if(length(x)>1)for(case in seq_along(x[-1])){p<-as.integer(strsplit(trimws(x[case+1]),"\\s+")[[1]]);k<-p[1];m<-p[2];out<-list();dfs<-function(pos,left,s){if(pos>k){if(left==0){a<-as.numeric(s);n<-ds(a+1);if(prime(gcd(m,n)))out[[length(out)+1]]<<-c(n,a)};return(invisible(NULL))};lo<-if(pos==1)1 else 0;if(lo<=min(9,left))for(d in lo:min(9,left))dfs(pos+1,left-d,paste0(s,d))};if(m>=1&&m<=9*k)dfs(1,m,"");cat("Case ",case,"\n",sep="");if(!length(out))cat("No Solution\n")else{a<-do.call(rbind,out);a<-a[order(a[,1],a[,2]),,drop=FALSE];for(i in 1:nrow(a))cat(a[i,1],format(a[i,2],scientific=FALSE,trim=TRUE),"\n")}}
