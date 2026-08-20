# 题目名称：N-自守数
# 题目编号：PAT Basic 1091
# 实现原理：
#   对每个待检测的数K，枚举N从1到9（题目保证N<10），计算N*K²，判断其末尾几位是否等于K。
#   关键步骤：
#   1. 读取检测个数M和M个待检测数字
#   2. 对每个数字n：
#      - 枚举k从1到9（题目保证N<10）
#      - 计算 v = n * n * k
#      - 取v的最后len(n)位，与n的字符串形式比较
#      - 若相等则找到最小的k，输出k和v，跳出循环
#      - 若枚举完都没找到，输出No
#   从1开始枚举N，第一个找到的就是最小的N。
#   用字符串截取末尾几位数，避免取模运算的复杂性。
# 时间复杂度：O(M * 9 * D)，M为检测个数，D为数字位数
# 空间复杂度：O(1)，仅使用常数额外空间
z<-as.integer(scan("stdin",quiet=TRUE));for(n in z[-1]){ans<-NULL;for(k in 1:9){v<-n*n*k;s<-as.character(n);if(substr(as.character(v),nchar(as.character(v))-nchar(s)+1,nchar(as.character(v)))==s){ans<-c(k,v);break}};if(is.null(ans))cat("No\n")else cat(ans[1],ans[2],"\n",sep=" ")}
