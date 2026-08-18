# 题目名称：多选题常见计分法
# 题目编号：PAT Basic 1073
# 实现原理：
#   读取题目信息（分值、选项数、正确答案），然后逐一批改每个学生的答案。
#   计分规则：全对得满分，选对部分且无错选得一半分，有错选不得分。
#   同时统计每道题每个选项的错误次数（漏选或错选都算错）。
#   最后输出每个学生得分，以及错误次数最多的题目选项。
# 时间复杂度：O(N*M)，N为学生人数，M为题目数量
# 空间复杂度：O(M)，存储题目信息和错误统计数组
x<-readLines("stdin",warn=FALSE);h<-as.integer(strsplit(x[1],"\\s+")[[1]]);q<-vector("list",h[2]);for(i in 1:h[2]){p<-strsplit(x[i+1],"\\s+")[[1]];q[[i]]<-list(score=as.numeric(p[1]),total=as.integer(p[2]),ans=p[4:length(p)])};err<-lapply(q,function(v)integer(v$total));for(i in 1:h[1]){parts<-regmatches(x[h[2]+1+i],gregexpr("\\([^)]*\\)",x[h[2]+1+i]))[[1]];score<-0;for(j in 1:h[2]){p<-strsplit(gsub("[()]","",parts[j]),"\\s+")[[1]];sel<-p[-1];right<-q[[j]]$ans;if(setequal(sel,right))score<-score+q[[j]]$score else if(all(sel%in%right))score<-score+q[[j]]$score/2;allopt<-letters[1:q[[j]]$total];wrong<-setdiff(union(sel,right),intersect(sel,right));if(length(wrong))for(v in wrong)err[[j]][match(v,allopt)]<-err[[j]][match(v,allopt)]+1};cat(sprintf("%.1f",score),"\n")};mx<-max(unlist(err));if(mx==0)cat("Too simple\n") else for(j in 1:h[2])for(k in which(err[[j]]==mx))cat(mx,paste0(j,"-",letters[k]),"\n")
