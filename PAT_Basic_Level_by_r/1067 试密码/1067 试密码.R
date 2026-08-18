# 题目名称：试密码
# 题目编号：PAT Basic 1067
# 实现原理：
#   逐行读取用户输入的密码尝试，与正确密码比较。
#   如果输入为"#"则结束输入。密码正确输出欢迎信息，
#   错误则输出错误提示。
# 时间复杂度：O(N*L)，N为尝试次数，L为密码长度
# 空间复杂度：O(1)，仅存储正确密码
x<-readLines("stdin",warn=FALSE);pass<-x[1];for(s in x[-1]){if(s=="#")break;cat(s,if(s==pass)"Welcome in" else "Wrong password: ","\n",sep="")}
