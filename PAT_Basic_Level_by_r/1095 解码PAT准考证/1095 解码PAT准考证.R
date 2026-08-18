# 题目名称：解码PAT准考证
# 题目编号：PAT Basic 1095
# 实现原理：
#   根据PAT准考证号的结构（级别+考场+日期+考生编号），处理三种类型的查询请求。
#   关键步骤：
#   1. 读取考生人数N和查询数M
#   2. 读取所有考生的准考证号和分数，存储为矩阵
#   3. 对每个查询，根据类型分别处理：
#      - 类型1：按指定级别筛选考生，按分数降序、准考证号升序排序输出
#      - 类型2：按指定考场筛选，统计考生人数和总分
#      - 类型3：按指定日期筛选，按考场统计人数，按人数降序、考场号升序排序输出
#   4. 若无结果则输出NA
#   准考证号结构：第1位级别，第2-4位考场，第5-10位日期，最后3位考生编号
#   使用substr函数提取准考证号各部分信息。
# 时间复杂度：O(N log N)，主要由排序操作决定
# 空间复杂度：O(N)，存储所有考生信息
x <- readLines("stdin", warn = FALSE); n <- as.integer(x[1]); a <- do.call(rbind, strsplit(x[2:(n+1)], "\\s+")); q <- as.integer(x[n+2]);
for (s in x[(n+3):length(x)]) { p <- strsplit(s, "\\s+")[[1]]; cat("Case ", match(s, x[(n+3):length(x)]), ": ", s, "\n", sep=""); if (p[1]=="1") {r<-a[substr(a[,1],1,1)==p[2],,drop=FALSE];if(!nrow(r))cat("NA\n") else {r<-r[order(-as.integer(r[,2]),r[,1]),,drop=FALSE];for(i in 1:nrow(r))cat(r[i,1],r[i,2],"\n")}} else if(p[1]=="2"){r<-a[substr(a[,1],4,9)==p[2],,drop=FALSE];cat(if(nrow(r))sum(as.integer(r[,2])) else "NA","\n")} else {r<-a[substr(a[,1],2,4)==p[2],,drop=FALSE];if(!nrow(r))cat("NA\n") else {t<-sort(table(substr(r[,1],4,9)),decreasing=TRUE);for(k in names(t))cat(k,t[k],"\n")}}
