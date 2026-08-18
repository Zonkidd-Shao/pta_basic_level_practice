# 题目名称：输出PATest
# 题目编号：PAT Basic 1043
# 实现原理：
#   首先统计输入字符串中 P、A、T、e、s、t 六个字符各自出现的次数，
#   然后循环按照 PATest 的顺序依次输出字符，每输出一个字符将对应计数减 1，
#   直到所有字符计数都为 0。
#   使用 factor 指定 levels 保证 table 输出顺序与 PATest 一致。
# 时间复杂度：O(n + k)，n 为输入长度，k 为输出长度（即有效字符总数）
# 空间复杂度：O(1)，只需要固定大小的计数数组
s<-strsplit(scan("stdin",what="",quiet=TRUE)[1],"")[[1]];cnt<-table(factor(s,levels=strsplit("PATest","")[[1]]));out<-"";while(any(cnt>0)){for(ch in names(cnt))if(cnt[ch]>0){out<-paste0(out,ch);cnt[ch]<-cnt[ch]-1L}};cat(out,"\n")
