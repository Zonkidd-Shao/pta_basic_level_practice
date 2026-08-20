# 题目名称：有理数四则运算
# 题目编号：PAT Basic 1034
# 实现原理：
#   1. 读取两个有理数（分数形式a/b）
#   2. 解析函数parse将字符串形式的分数转换为分子分母数组
#   3. 格式化函数fmt将分数转换为输出格式：
#      - 若分母为0，输出Inf
#      - 负数用括号包裹
#      - 假分数转换为带分数形式（整数部分 分子/分母）
#      - 真分数直接输出分子/分母
#      - 整数直接输出整数
#   4. 分别计算加、减、乘、除四种运算的结果：
#      - 加法：a1/b1 + a2/b2 = (a1*b2 + a2*b1) / (b1*b2)
#      - 减法：a1/b1 - a2/b2 = (a1*b2 - a2*b1) / (b1*b2)
#      - 乘法：a1/b1 * a2/b2 = (a1*a2) / (b1*b2)
#      - 除法：a1/b1 / a2/b2 = (a1*b2) / (b1*a2)
#   5. 按格式输出每个运算式
# 时间复杂度：O(1)，只涉及固定次数的算术运算和字符串处理
# 空间复杂度：O(1)，只使用固定数量的变量
x<-scan("stdin",what="",quiet=TRUE);parse<-function(s){as.integer(strsplit(s,"/")[[1]])};a<-parse(x[1]);b<-parse(x[2]);gcd<-function(x,y){while(y!=0){t<-x%%y;x<-y;y<-t};abs(x)};norm<-function(v){if(v[2]<0)v<--v;v/gcd(abs(v[1]),abs(v[2]))};fmt<-function(v){if(v[2]==0)return("Inf");v<-norm(v);if(v[1]==0)return("0");sg<-v[1]<0;x<-abs(v[1]);y<-v[2];q<-x%/%y;r<-x%%y;z<-if(r==0)as.character(q)else if(q==0)paste0(r,"/",y)else paste0(q," ",r,"/",y);if(sg)paste0("(-",z,")")else z};ops<-list(c(a[1]*b[2]+b[1]*a[2],a[2]*b[2]),c(a[1]*b[2]-b[1]*a[2],a[2]*b[2]),c(a[1]*b[1],a[2]*b[2]),c(a[1]*b[2],a[2]*b[1]));sym<-c("+","-","*","/");for(i in 1:4)cat(fmt(a)," ",sym[i]," ",fmt(b)," = ",fmt(ops[[i]]),"\n",sep="")
