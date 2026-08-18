# 题目名称：有几个PAT
# 题目编号：PAT Basic 1040
# 实现原理：
#   1. 读取输入字符串，只包含P、A、T三种字符
#   2. 使用动态规划/前缀和思想，一次遍历统计PAT的个数：
#      - p：当前已出现的P的个数
#      - pa：当前已出现的PA组合的个数
#      - ans：当前已出现的PAT组合的个数
#   3. 遍历每个字符：
#      - 遇到P：p加1
#      - 遇到A：pa增加p（每个P都可以和这个A组成PA）
#      - 遇到T：ans增加pa（每个PA都可以和这个T组成PAT）
#   4. 每次累加都对1000000007取模，防止溢出
# 时间复杂度：O(n)，其中n为字符串长度，只需一次遍历
# 空间复杂度：O(1)，只使用三个计数变量
s<-strsplit(scan("stdin",what="",quiet=TRUE)[1],"")[[1]];p<-0;pa<-0;ans<-0;for(ch in s){if(ch=="P")p<-p+1L else if(ch=="A")pa<-(pa+p)%%1000000007L else if(ch=="T")ans<-(ans+pa)%%1000000007L};cat(ans,"\n")
