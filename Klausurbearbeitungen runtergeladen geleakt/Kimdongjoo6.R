#Dongjoo Kim 7031799
##Aufgabe 6
#a
(f <- read.table("Wollknaeuelgewichte2024.txt", header = FALSE))
f<-as.vector(unlist(f))
#b
a<-shapiro.test(f)
(a$p.value)
#H0: Wickelgewichte sind normalverteilt 
#H1: Wickelgewichte sind nicht normalverteilt 
#H1 nehmen
#c-e
((length(f)>=30) | (a$p.value>=0.05))
qqnorm(f)
qqline(f)
##Dann Wilcoxon Signed Rank Test wird gewaehlt

wilcox.test(f,50)

b<-wilcox.test(f,50)

(b$p.value>=0.05)