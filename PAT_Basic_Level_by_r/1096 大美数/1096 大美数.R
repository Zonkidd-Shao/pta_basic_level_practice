# 题目名称：大美数
# 题目编号：PAT Basic 1096
# 实现原理：
#   判断一个正整数是否能整除它的4个不同正因数之和。
#   关键步骤：
#   1. 读取检测个数K和K个待检测数字
#   2. 对每个数字n：
#      - 找出n的所有正因数
#      - 枚举所有4个不同因数的组合
#      - 判断n是否能整除这4个因数的和
#      - 若存在这样的组合则输出Yes，否则输出No
#   先找出所有因数，再用组合枚举验证条件。
#   注意：大美数的定义是存在4个不同正因数，它们的和能被N整除。
# 时间复杂度：O(K * d(n)^4)，其中d(n)为n的因数个数，远小于n
# 空间复杂度：O(d(n))，存储n的所有正因数
z<-as.integer(scan("stdin",quiet=TRUE));for(n in z[-1]){d<-which(n%%(1:n)==0);ok<-FALSE;if(length(d)>=4){for(v in combn(d,4,simplify=FALSE))if(sum(v)%%n==0){ok<-TRUE;break}};cat(if(ok)"Yes"else"No","\n",sep="")}
