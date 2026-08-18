# 题目名称：外观数列
# 题目编号：PAT Basic 1084
# 实现原理：
#   迭代生成外观数列的第N项。每一项都是对前一项的描述：统计连续相同数字的个数，然后将个数和数字依次拼接。
#   关键步骤：
#   1. 读取起始数字d和项数N
#   2. 初始化当前项为d
#   3. 迭代N-1次生成后续项：
#      - 将当前字符串拆分为单个字符
#      - 用 rle 函数（游程编码）统计连续相同字符的个数和值
#      - 将每个字符的"值+个数"拼接成新的字符串
#   4. 输出第N项
#   rle(Run Length Encoding)函数是R语言内置的游程编码函数，非常适合处理此类问题。
# 时间复杂度：O(N * L)，其中N为迭代次数，L为每一项的平均长度
# 空间复杂度：O(L)，存储当前项的字符串
z<-scan("stdin",what="",quiet=TRUE);s<-z[1];for(k in seq_len(as.integer(z[2])-1)){a<-strsplit(s,"")[[1]];r<-rle(a);s<-paste0(paste0(r$values,r$lengths),collapse="")};cat(s,"\n")
