# 题目名称：成绩排名
# 题目编号：PAT Basic 1004
# 实现原理：
#   读入 n 名学生的姓名、学号、成绩，将每行按空格拆分为三列存入矩阵。
#   提取成绩列，使用 which.max 和 which.min 分别找到最高分和最低分的索引，
#   最后按要求输出对应学生的姓名和学号。
# 时间复杂度：O(n) - 需要遍历 n 个学生，找最大最小值各需一次遍历
# 空间复杂度：O(n) - 需要存储 n 名学生的全部信息
x <- readLines("stdin", warn=FALSE); n <- as.integer(x[1]); a <- do.call(rbind, strsplit(x[-1], "\\s+")); score <- as.integer(a[,3]); hi <- which.max(score); lo <- which.min(score); cat(paste(a[hi,1:2], collapse=" "), "\n", paste(a[lo,1:2], collapse=" "), "\n", sep="")
