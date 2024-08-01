#Dongjoo Kim 7031799
##Aufgabe 3 
#a
(100*0.03)
#b
result1<-c(rep(1,5))
result2<-c(rep(0,95))
result<-c(result1,result2)
#result=Ergebnis von Stichproben
t.test(result,mu=0.03)
#H0: mean(Stichproben)=mean(Gesamte Gruppe) 
#H1: mean(Stichproben)!=mean(Gesamte Gruppe) 
#p-value = 0.3634
#Ho nehmen
(pbinom(q = 5, size = 100, prob = 0.03,lower.tail = FALSE))
#Wahrscheinlichkeit ein mindestens so schlechtes Ergebnis in dem Produktionsverfahren zu beobachten
#waere, wenn die Ausschussquote tats¨achlich 3 % betruge! 