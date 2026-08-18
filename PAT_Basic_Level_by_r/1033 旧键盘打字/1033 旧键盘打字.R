# 题目名称：旧键盘打字
# 题目编号：PAT Basic 1033
# 实现原理：
#   1. 读取两行输入：坏掉的键、应该输入的文字
#   2. 检查上档键（+）是否坏掉
#   3. 将坏掉的键（除了+）转换为大写，方便比较
#   4. 遍历目标文字的每个字符，判断是否可以打出：
#      - 如果字符的大写形式在坏键中，则不能打出
#      - 如果上档键坏了且字符是大写字母，则不能打出
#   5. 将所有可以打出的字符拼接起来输出
# 时间复杂度：O(n)，其中n为目标文字的长度
# 空间复杂度：O(1)，坏键字符集大小固定，只需常量空间
x<-readLines("stdin",warn=FALSE);broken<-x[1];txt<-x[2];shift<-grepl("\\+",broken);b<-toupper(gsub("\\+","",broken));ok<-vapply(strsplit(txt,"")[[1]],function(ch)!((toupper(ch)%in%strsplit(b,"")[[1]])||(shift&&grepl("[A-Z]",ch))),logical(1));cat(paste0(strsplit(txt,"")[[1]][ok],collapse=""),"\n")
