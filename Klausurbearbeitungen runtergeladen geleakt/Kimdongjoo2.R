#Dongjoo Kim 7031799
##Aufgabe 2 
#a
b <- scan(file = "Geburtsdaten.txt",, what = "character")
b<-data.frame(b)
#b
#install.packages("dplyr")
library("dplyr")
b$Vielfachheit<-(duplicated(b))
#Tabellierung ob jede Vielfachheit auftritt
(b_0<-filter(b,Vielfachheit))
(b_1<-filter(b,!Vielfachheit))
