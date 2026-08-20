# 题目名称：火星数字
# 题目编号：PAT Basic 1044
# 实现原理：
#   火星数字是 13 进制，低位 0-12 用 tret 和 jan-dec 表示，
#   高位 1-12（对应 13-156）用 tam-jou 表示。
#   地球转火星：除以 13 得到高位和低位，分别对应映射表输出。
#   火星转地球：判断是 1 个还是 2 个单词，分别查表计算数值。
#   利用 match 函数快速查找索引完成双向映射。
# 时间复杂度：O(N)，N 为输入行数
# 空间复杂度：O(1)，映射表大小固定
x<-readLines("stdin",warn=FALSE);low<-c("tret","jan","feb","mar","apr","may","jun","jly","aug","sep","oct","nov","dec");high<-c("tam","hel","maa","huh","tou","kes","hei","elo","syy","lok","mer","jou");for(s in x[-1]){s<-trimws(s);if(grepl("^[0-9]+$",s)){n<-as.integer(s);ans<-if(n<13)low[n+1]else if(n%%13==0)high[n%/%13]else paste(high[n%/%13],low[n%%13+1]);cat(ans,"\n")}else{p<-strsplit(s," +")[[1]];ans<-if(length(p)==1){v<-match(p,low);if(!is.na(v))v-1L else match(p,high)*13L}else match(p[1],high)*13L+match(p[2],low)-1L;cat(ans,"\n")}}
