# 题目名称：检查密码
# 题目编号：PAT Basic 1081
# 实现原理：
#   逐行读取每个密码，按照优先级依次进行合法性检查：
#   1. 首先检查密码长度是否小于6，若小于则直接输出"太短"
#   2. 然后用正则表达式 [^A-Za-z0-9.] 检查是否存在非法字符（非字母、非数字、非小数点）
#   3. 接着检查是否包含字母，若没有则输出"需要字母"
#   4. 再检查是否包含数字，若没有则输出"需要数字"
#   5. 以上都通过则输出"完美"
#   使用 grepl 函数进行正则匹配，按优先级顺序判断，确保输出正确的错误信息。
# 时间复杂度：O(N * L)，其中 N 为密码数量，L 为密码最大长度（80）
# 空间复杂度：O(1)，仅使用常数额外空间
x<-readLines("stdin",warn=FALSE);for(s in x[-1]){if(nchar(s)<6)cat("Your password is tai duan le.\n") else if(grepl("[^A-Za-z0-9.]",s))cat("Your password is tai luan le.\n") else if(!grepl("[A-Za-z]",s))cat("Your password needs zi mu.\n") else if(!grepl("[0-9]",s))cat("Your password needs shu zi.\n") else cat("Your password is wan mei.\n")}
