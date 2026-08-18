# 题目名称：福尔摩斯的约会
# 题目编号：PAT Basic 1014
# 实现原理：
#   通过 4 个字符串解码约会时间：
#   1. 前两个字符串中，第 1 对相同的大写字母 A-G 对应星期（A=MON, ..., G=SUN）
#   2. 在该位置之后，第 1 对相同的字符（0-9 或 A-N）对应小时（0-9 和 A-N 对应 0-23）
#   3. 后两个字符串中，第 1 对相同的英文字母出现的位置（从 0 开始）对应分钟
#   将字符串拆分为字符数组，逐位比较找出符合条件的位置。
# 时间复杂度：O(L) - L 为字符串最大长度（60），只需线性扫描
# 空间复杂度：O(L) - 存储拆分后的字符数组
x <- readLines("stdin",warn=FALSE); a<-strsplit(x[1],"")[[1]];b<-strsplit(x[2],"")[[1]];i<-which(a==b & a %in% c(LETTERS[1:7]))[1]; day<-c("MON","TUE","WED","THU","FRI","SAT","SUN")[match(a[i],LETTERS[1:7])]; j<-which(a==b & seq_along(a)>i & a %in% c(as.character(0:9),LETTERS))[1]; hour<-if(a[j]%in%LETTERS) match(a[j],LETTERS)+9L else as.integer(a[j]); c1<-strsplit(x[3],"")[[1]];c2<-strsplit(x[4],"")[[1]]; minute<-which(c1==c2 & grepl("[A-Za-z]",c1))[1]-1L; cat(sprintf("%s %02d:%02d\n",day,hour,minute))
