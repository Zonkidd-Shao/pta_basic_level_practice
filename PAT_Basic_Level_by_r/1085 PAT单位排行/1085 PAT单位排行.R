# 题目名称：PAT单位排行
# 题目编号：PAT Basic 1085
# 实现原理：
#   统计每个学校的加权总分和考生人数，按规则排序并计算排名后输出。
#   关键步骤：
#   1. 读取所有考生信息，提取准考证号、得分、学校
#   2. 将学校名称统一转为小写
#   3. 根据考试级别计算加权分数：甲级(A)*1，乙级(B)*2/3，顶级(T)*1.5
#   4. 用 tapply 按学校分组求和，得到每个学校的加权总分
#   5. 用 table 统计每个学校的考生人数
#   6. 加权总分取整数部分（floor向下取整）
#   7. 排序规则：加权总分降序 -> 考生人数升序 -> 学校名字典序升序
#   8. 计算排名：总分相同则排名相同，用cumsum和diff实现并列排名
#   9. 输出单位个数和排名结果
#   加权总分的整数部分使用floor取整，注意乙级除以1.5等价于乘以2/3。
# 时间复杂度：O(N log N)，主要由排序操作决定，N为考生人数
# 空间复杂度：O(N + S)，其中S为学校数量
x<-readLines("stdin",warn=FALSE);n<-as.integer(x[1]);p<-do.call(rbind,strsplit(x[2:(n+1)],"\\s+"));school<-tolower(p[,3]);score<-as.numeric(p[,2])*ifelse(substr(p[,1],1,1)=="A",1,ifelse(substr(p[,1],1,1)=="B",2/3,1.5));s<-tapply(score,school,sum);cnt<-table(school);v<-floor(s);o<-order(-v,cnt[names(s)],names(s));rs<-seq_along(o);if(length(o)>1)for(i in 2:length(o))if(v[o[i]]==v[o[i-1]])rs[i]<-rs[i-1]else rs[i]<-i;cat(length(s),"\n");for(i in seq_along(o))cat(rs[i],names(s)[o[i]],v[o[i]],cnt[names(s)[o[i]]],"\n",sep=" ")
