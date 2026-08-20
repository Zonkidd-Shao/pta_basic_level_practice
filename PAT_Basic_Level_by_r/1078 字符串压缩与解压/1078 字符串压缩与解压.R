# 题目名称：字符串压缩与解压
# 题目编号：PAT Basic 1078
# 实现原理：
#   根据首字符判断是压缩(C)还是解压(D)。
#   压缩：遍历字符串，统计连续相同字符的个数，个数大于1时输出数字+字符，否则只输出字符。
#   解压：遍历字符串，遇到数字时读取连续数字作为重复次数，将后续字符重复对应次数。
#   使用双指针法统计连续字符/数字的长度。
# 时间复杂度：O(N)，N为字符串长度，每个字符访问一次
# 空间复杂度：O(N)，存储结果字符串
lines<-readLines("stdin",warn=FALSE);mode<-lines[1];s<-lines[2];a<-strsplit(s,"")[[1]];out<-character();if(mode=="C"){i<-1L;while(i<=length(a)){j<-i;while(j<=length(a)&&a[j]==a[i])j<-j+1L;cnt<-j-i;if(cnt>1)out<-c(out,as.character(cnt));out<-c(out,a[i]);i<-j}}else{i<-1L;while(i<=length(a)){if(grepl("[0-9]",a[i])){j<-i;while(j<=length(a)&&grepl("[0-9]",a[j]))j<-j+1L;cnt<-as.integer(paste0(a[i:(j-1)],collapse=""));out<-c(out,strrep(a[j],cnt));i<-j+1L}else{out<-c(out,a[i]);i<-i+1L}}};cat(paste0(out,collapse=""),"\n",sep="")
