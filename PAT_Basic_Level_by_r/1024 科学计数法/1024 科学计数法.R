# 题目名称：科学计数法
# 题目编号：PAT Basic 1024
# 实现原理：
#   1. 使用正则表达式解析科学计数法字符串，提取：符号、整数位、小数位、指数符号、指数值
#   2. 将整数位和小数位合并为纯数字字符串
#   3. 根据指数的正负进行不同处理：
#      - 指数为正：小数点向右移动，若超出小数位数则补0
#      - 指数为负：小数点向左移动，前面补0和小数点
#   4. 根据原始符号决定是否添加负号
#   5. 输出最终的普通数字表示
# 时间复杂度：O(n)，其中n为字符串长度，主要耗时在字符串拼接和截取
# 空间复杂度：O(n)，需要存储转换后的数字字符串
s<-scan("stdin",what="",quiet=TRUE)[1];m<-regexec("([+-])(\\d)\\.(\\d+)E([+-])(\\d+)",s);p<-regmatches(s,m)[[1]];digits<-paste0(p[3],p[4]);e<-as.integer(p[6])*ifelse(p[5]=="+",1,-1);ans<-if(e>=0){if(nchar(digits)<=e+1)paste0(digits,strrep("0",e+1-nchar(digits))) else paste0(substr(digits,1,e+1),".",substr(digits,e+2,nchar(digits)))}else paste0("0.",strrep("0",-e-1),digits);cat(ifelse(p[2]=="-",paste0("-",ans),ans),"\n")
