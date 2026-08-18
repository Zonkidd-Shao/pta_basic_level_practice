# 题目名称：字符串压缩与解压
# 题目编号：PAT Basic 1078
# 实现原理：
#   根据首字符判断是压缩(C)还是解压(D)。
#   压缩：遍历字符串，统计连续相同字符的个数，个数大于1时输出数字+字符，否则只输出字符。
#   解压：遍历字符串，遇到数字时读取连续数字作为重复次数，将后续字符重复对应次数。
#   使用双指针法统计连续字符/数字的长度。
# 时间复杂度：O(N)，N为字符串长度，每个字符访问一次
# 空间复杂度：O(N)，存储结果字符串
s<-scan("stdin",what="",quiet=TRUE)[1];if(substr(s,1,1)=="C"){a<-strsplit(substr(s,3,nchar(s)),"")[[1]];out<-"";i<-1;while(i<=length(a)){j<-i;while(j<=length(a)&&grepl("[0-9]",a[j]))j<-j+1;out<-paste0(out,strrep(a[j],as.integer(paste(a[i:(j-1)],collapse=""))));i<-j+1}}else{a<-strsplit(substr(s,3,nchar(s)),"")[[1]];out<-"";i<-1;while(i<=length(a)){j<-i;while(j<=length(a)&&a[j]==a[i])j<-j+1;out<-paste0(out,if(j-i>1)j-i else "",a[i]);i<-j}};cat(out,"\n")
