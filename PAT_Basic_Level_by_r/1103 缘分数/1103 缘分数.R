# 题目名称：缘分数
# 题目编号：PAT Basic 1103
# 实现原理：
#   判断区间[m,n]内的数a是否是缘分数。缘分数定义：a和a-1的立方差等于c²，
#   且c等于b和b-1的平方和。解题思路：1. 遍历区间内每个a；
#   2. 计算c² = a³ - (a-1)³，判断是否为完全平方数；
#   3. 若是完全平方数，求c并枚举b，判断b² + (b-1)² = c是否成立；
#   4. 收集所有缘分数对，按格式输出。
# 时间复杂度：O((n-m) × √c)，外层遍历区间，内层枚举b
# 空间复杂度：O(k)，k为缘分数对的数量，用于存储结果
z<-as.integer(scan("stdin",quiet=TRUE));out<-character();for(a in z[1]:z[2]){c2<-a^3-(a-1)^3;c<-round(sqrt(c2));if(c*c==c2){for(b in 1:floor(sqrt(c))){if(b*b+(b-1)^2==c){out<-c(out,paste(a,b));break}}}};cat(if(length(out))paste(out,collapse="\n") else "No Solution","\n")
