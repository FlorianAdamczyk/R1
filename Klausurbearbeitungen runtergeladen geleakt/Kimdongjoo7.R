#Dongjoo Kim 7031799
##Aufgabe 7
#a
a<-read.csv2("Lungenlappendichte.csv",header=TRUE,sep = ";")
#b
rs  <-  rowSums(a[-1])
a$Gesamt<-rs
#c
plot(a$Gesamt)
a2  <-  cbind(a, rs)
brk<-cut(a$Gesamt, breaks = seq(-1100, 3100, 100))
plot(brk)
