# 题目名称：小赌怡情
# 题目编号：PAT Basic 1071
# 实现原理：
#   模拟赌博游戏过程。初始给定筹码数，逐局处理游戏：
#   检查下注是否超过现有筹码，不足则提示；
#   否则根据赌大小结果增减筹码。
#   当筹码输光时游戏结束。
# 时间复杂度：O(K)，K为游戏局数
# 空间复杂度：O(1)，仅存储当前筹码数
x<-readLines("stdin",warn=FALSE);money<-as.integer(strsplit(x[1],"\\s+")[[1]][1]);for(s in x[2:length(x)]){v<-as.integer(strsplit(s,"\\s+")[[1]]);if(v[3]>money){cat("Not enough tokens.  Total = ",money,".\n",sep="");next};win<-(v[2]==0&&v[4]<v[1])||(v[2]==1&&v[4]>v[1]);money<-money+if(win)v[3]else-v[3];if(win)cat("Win ",v[3],"!  Total = ",money,".\n",sep="")else cat("Lose ",v[3],".  Total = ",money,".\n",sep="");if(money==0){cat("Game Over.\n");break}}
