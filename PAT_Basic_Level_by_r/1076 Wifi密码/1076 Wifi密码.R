# 题目名称：Wifi密码
# 题目编号：PAT Basic 1076
# 实现原理：
#   每道题有4个选项A-T/B-F/C-F/D-F的形式，
#   标记为T的选项即为正确答案。将A对应1、B对应2、C对应3、D对应4，
#   依次找出每道题中T所在的位置（即第几个选项是对的），
#   将数字连起来就是wifi密码。
# 时间复杂度：O(N)，N为题目数量
# 空间复杂度：O(N)，存储结果密码
x<-readLines("stdin",warn=FALSE)[-1];a<-vapply(x,function(s){p<-strsplit(s,"\\s+")[[1]];which(p=="T")-1L},integer(1));cat(paste(a,collapse=""),"\n")
