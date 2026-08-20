# 题目名称：擅长C
# 题目编号：PAT Basic 1109
# 实现原理：
#   用7×5的C字母矩阵输出给定句子。输入26个大写字母的点阵图案，
#   然后按单词输出每个字母的点阵形式，字母间用空格分隔，单词间用空行分隔。
#   解题思路：1. 读取26个字母的7×5点阵，按行存储；2. 读取句子，提取其中的单词；
#   3. 对每个单词，逐行输出所有字母的对应行（字母间用空格分隔）；
#   4. 不同单词之间输出空行。
# 时间复杂度：O(26×7×5 + L×7)，L为句子中字母总数，读取点阵+逐行输出
# 空间复杂度：O(26×7×5) = O(1)，存储26个字母的点阵
x<-readLines("stdin",warn=FALSE);patterns<-vector("list",26);idx<-1L;for(i in 1:26){patterns[[i]]<-x[idx:(idx+6L)];idx<-idx+7L};sentence<-if(idx<=length(x))paste(x[idx:length(x)],collapse=" ")else"";words<-regmatches(sentence,gregexpr("[A-Z]+",sentence,perl=TRUE))[[1]];for(wi in seq_along(words)){w<-strsplit(words[wi],"",fixed=TRUE)[[1]];ids<-match(w,LETTERS);for(r in 1:7)cat(paste(vapply(patterns[ids],function(z)z[r],character(1)),collapse=" "),"\n",sep="");if(wi<length(words))cat("\n")}
