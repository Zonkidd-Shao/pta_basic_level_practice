# 题目名称：卖个萌
# 题目编号：PAT Basic 1052
# 实现原理：
#   读取输入字符串，按下划线 _ 分割成多个部分。
#   输出格式为：先输出 (^_^)，然后对每个分割后的部分用括号包裹并拼接起来。
#   使用 scan 读取输入，strsplit 分割字符串，paste0 拼接结果。
# 时间复杂度：O(n)，n 为输入字符串长度
# 空间复杂度：O(n)
x<-readLines("stdin",warn=FALSE);get<-function(s){r<-regmatches(s,gregexpr("\\[[^]]*\\]",s,perl=TRUE))[[1]];gsub("^\\[|\\]$","",r)};sets<-lapply(x[1:3],get);k<-as.integer(x[4]);req<-scan(text=paste(x[5:length(x)],collapse=" "),what=integer(),quiet=TRUE);for(i in seq(1,length(req),by=5)){v<-req[i:(i+4)];if(any(v<1L|v>sapply(sets,length)))cat("Are you kidding me? @\\/@\n")else cat(sets[[1]][v[1]],"(",sets[[2]][v[2]],sets[[3]][v[3]],sets[[2]][v[4]],")",sets[[1]][v[5]],"\n",sep="")}
