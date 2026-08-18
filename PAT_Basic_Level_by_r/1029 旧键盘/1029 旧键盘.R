# 题目名称：旧键盘
# 题目编号：PAT Basic 1029
# 实现原理：
#   1. 读取两行输入：坏掉的键、应该输入的文字
#   2. 将两行都转换为大写，方便比较
#   3. 将坏掉的键和目标文字都拆分成单个字符
#   4. 找出目标文字中不在坏键中的字符
#   5. 使用unique去除重复字符，保持首次出现的顺序
#   6. 将结果拼接成字符串输出
# 时间复杂度：O(n+m)，其中n和m分别为两个字符串的长度
# 空间复杂度：O(1)，字符集大小固定，只需常量空间存储坏键集合
x<-readLines("stdin",warn=FALSE);bad<-toupper(x[1]);need<-toupper(x[2]);cat(paste0(unique(strsplit(need,"")[[1]][!(strsplit(need,"")[[1]] %in% strsplit(bad,"")[[1]])]),collapse=""),"\n")
