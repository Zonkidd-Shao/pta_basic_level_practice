# 题目名称：到底买不买
# 题目编号：PAT Basic 1039
# 实现原理：
#   1. 读取两行输入：摊主的珠串、小红想做的珠串
#   2. 分别统计两个珠串中每种颜色珠子的数量（使用table函数）
#   3. 计算缺少的珠子数量：
#      - 对小红需要的每种颜色，计算需要的数量减去摊主有的数量
#      - 如果结果为正，表示缺少，累加到miss中
#   4. 如果有缺少的珠子，输出"No"和缺少的数量
#   5. 如果不缺少，输出"Yes"和多余的珠子数量（摊主总数 - 需要总数）
# 时间复杂度：O(n+m)，其中n和m分别为两个珠串的长度
# 空间复杂度：O(1)，字符集大小固定（数字+大小写字母共62种）
x<-readLines("stdin",warn=FALSE);a<-table(strsplit(x[1],"")[[1]]);b<-table(strsplit(x[2],"")[[1]]);miss<-sum(pmax(0,b[names(b)]-a[names(b)]));cat(if(miss)paste("No",miss) else paste("Yes",nchar(x[1])-nchar(x[2])),"\n")
