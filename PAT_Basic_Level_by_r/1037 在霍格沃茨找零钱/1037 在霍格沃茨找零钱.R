# 题目名称：在霍格沃茨找零钱
# 题目编号：PAT Basic 1037
# 实现原理：
#   1. 读取输入：应付的价钱P和实付的钱A，格式都是Galleon.Sickle.Knut
#   2. 将两个金额都转换为最小单位Knut：
#      - 1 Galleon = 17 Sickle = 17*29 = 493 Knut
#      - 1 Sickle = 29 Knut
#   3. 计算找零 = 实付 - 应付（可能为负）
#   4. 将找零金额转换回Galleon.Sickle.Knut格式：
#      - Galleon = 总Knut / 493
#      - Sickle = (总Knut % 493) / 29
#      - Knut = 总Knut % 29
#   5. 如果找零为负，在前面添加负号
# 时间复杂度：O(1)，只需要常量时间的算术运算
# 空间复杂度：O(1)，只使用固定数量的变量
x<-scan("stdin",what="",quiet=TRUE);p<-function(s)as.integer(strsplit(s,"\\.")[[1]]);P<-p(x[1]);A<-p(x[2]);v<-(A[1]*17*29+A[2]*29+A[3])-(P[1]*17*29+P[2]*29+P[3]);sg<-if(v<0)"-"else"";v<-abs(v);cat(sprintf("%s%d.%d.%d\n",sg,v%/%493,(v%%493)%/%29,v%%29))
