z<-scan("stdin",what="",quiet=TRUE);for(s in z[-1]){ok<-TRUE;if(nchar(s)>1L)for(i in 2:nchar(s))if(as.numeric(substr(s,1,i))%%i!=0){ok<-FALSE;break};cat(if(ok)"Yes" else "No","\n")}
