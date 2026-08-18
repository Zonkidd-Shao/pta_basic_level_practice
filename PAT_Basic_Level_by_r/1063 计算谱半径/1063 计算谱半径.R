# 题目名称：计算谱半径
# 题目编号：PAT Basic 1063
# 实现原理：
#   谱半径是矩阵特征值的最大模。对于每个复数特征值（实部+虚部），
#   计算其模长（实部平方加虚部平方开根号），然后取所有模长中的最大值。
#   使用向量化操作批量计算所有特征值的模，再取最大值。
# 时间复杂度：O(N)，N为特征值个数
# 空间复杂度：O(N)，存储特征值矩阵
z<-as.numeric(scan("stdin",quiet=TRUE));n<-z[1];a<-matrix(z[-1],ncol=2,byrow=TRUE);cat(sprintf("%.2f\n",max(sqrt(rowSums(a*a)))))
