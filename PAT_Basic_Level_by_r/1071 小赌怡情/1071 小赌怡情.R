# 题目名称：小赌怡情
# 题目编号：PAT Basic 1071
# 实现原理：
#   模拟赌博游戏过程。初始给定筹码数，逐局处理游戏：
#   检查下注是否超过现有筹码，不足则提示；
#   否则根据赌大小结果增减筹码。
#   当筹码输光时游戏结束。
# 时间复杂度：O(K)，K为游戏局数
# 空间复杂度：O(1)，仅存储当前筹码数
x<-readLines("stdin",warn=FALSE);money<-as.numeric(x[1]);for(s in x[-1]){v<-as.numeric(strsplit(s,"\\s+")[[1]]);if(v[2]==0)break;if(v[4]>money){cat("Not enough tokens.  Total =",money,".\n")}else{money<-money+ifelse(v[1]==v[3],v[4],-v[4]);cat("Win",ifelse(v[1]==v[3],"","not"),"!  Total =",money,".\n")};if(money==0)break}
