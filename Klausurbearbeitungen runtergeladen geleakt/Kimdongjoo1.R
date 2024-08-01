#Dongjoo Kim 7031799
##Aufgabe 1
#a
df<-read.csv("Buecherwerte.csv",header=TRUE)
str(df)
#b
(mean(df$Preis)*1554)
#Wiederbeschaffungskosten für den Gesamtbestand=Anzahl der Stichprobe* durchschnittlichen
#Wiederbeschaffungspreis von Stichproben
#c
preis_pro_milimeter<-(mean(df$Preis)/mean(df$Preis))
(preis_von_dichte_25182<-(25182*preis_pro_milimeter))
#d
plot(df$Preis,df$Preis)
#Streudiagramm der Buchpreise gegen die Buchdicken
#e
cor.test(df$Preis,df$Preis)
#H0: Buchpreise und Buchdicken sind nicht tendenziell 
#H1:Buchpreise und Buchdickensind tendenziell
#p-Werte=2.2e-16<0.05=>H1 nehmen
#cor=1 Buchpreise und Buchdicken sind stark tendenziell 