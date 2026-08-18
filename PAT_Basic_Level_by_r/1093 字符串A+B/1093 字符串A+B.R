# 题目名称：字符串A+B
# 题目编号：PAT Basic 1093
# 实现原理：
#   将两个字符串拼接后，按出现顺序保留首次出现的字符，去除重复字符。
#   关键步骤：
#   1. 读取两行字符串A和B
#   2. 将两个字符串拼接成一个长字符串
#   3. 将长字符串拆分为单个字符的向量
#   4. 用 duplicated 函数找出重复的字符（首次出现为FALSE，后续出现为TRUE）
#   5. 保留非重复的字符（!duplicated(a)）
#   6. 将字符向量重新拼接为字符串输出
#   duplicated函数保证只保留首次出现的字符，维持原顺序。
#   注意：空格也是有效字符，需要保留。
# 时间复杂度：O(L)，其中L为两个字符串总长度
# 空间复杂度：O(L)，存储字符向量和结果
x<-readLines("stdin",warn=FALSE);a<-strsplit(paste0(x,collapse=""),"")[[1]];cat(paste0(a[!duplicated(a)],collapse=""),"\n")
