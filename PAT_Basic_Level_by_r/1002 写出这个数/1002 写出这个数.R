# 题目名称：写出这个数
# 题目编号：PAT Basic 1002
# 实现原理：
#   由于输入数字可能很大（最多100位），以字符串形式读入。
#   第一步：将字符串按字符拆分，逐位转为整数后求和，得到各位数字之和 s。
#   第二步：将 s 转为字符串并按字符拆分，通过拼音映射表将每一位数字转为对应的拼音，
#   最后用空格连接输出。
# 时间复杂度：O(n) - n 为输入数字的位数，需要遍历每一位数字求和，再遍历和的每一位输出
# 空间复杂度：O(1) - 拼音映射表为固定大小，额外空间与输入规模无关
s <- sum(as.integer(strsplit(scan("stdin", what = "", quiet = TRUE)[1], "")[[1]]))
word <- c("ling", "yi", "er", "san", "si", "wu", "liu", "qi", "ba", "jiu")
cat(paste(word[as.integer(strsplit(as.character(s), "")[[1]]) + 1L], collapse = " "), "\n")
