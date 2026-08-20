# 题目名称：微博转发抽奖
# 题目编号：PAT Basic 1069
# 实现原理：
#   从第S位开始，每隔N个人抽取一位中奖者。
#   使用集合记录已中奖用户，避免重复中奖。
#   如果当前位置的用户已中奖则跳过，取下一位。
#   最后输出所有中奖者名单，或无人中奖时输出提示。
# 时间复杂度：O(M)，M为转发人数
# 空间复杂度：O(K)，K为中奖人数，存储已中奖集合
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);v<-x[2:(h[1]+1)];out<-character();seen<-character();idx<-h[3];while(idx<=h[1]){j<-idx;while(j<=h[1]&&v[j]%in%seen)j<-j+1L;if(j>h[1])break;out<-c(out,v[j]);seen<-c(seen,v[j]);idx<-j+h[2]};cat(if(length(out))paste(out,collapse="\n")else"Keep going...","\n",sep="")
