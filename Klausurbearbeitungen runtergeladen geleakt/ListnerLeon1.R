#Listner, Leon. 8108323
#Aufgabe 1

#a)
buecher <- read.csv("Buecherwerte.csv")
str(buecher)
#Die erste Spalte ist eine ID-Spalte, die zweite gibt den Preis der 100 Buecher
#an, die dritte Spalte gibt die Dicke an.

#b)
mittlerer.preis <- mean(buecher$Preis)
Wiederbeschaffungskosten <- mittlerer.preis*1554
#Bildet man den Mittelwert der Stichprobe und multipliziert diesen mit dem
#Gesamtbestand, kommt man auf Wiederbeschaffungskosten in Höhe von 803728,8
#Britischen Pence.

#c)
Dicke.der.Stichprobe <- sum(buecher$Dicke)
Kosten.der.Stichprobe <- sum(buecher$Preis)
Kosten.pro.mm.Stichprobe <- Kosten.der.Stichprobe/Dicke.der.Stichprobe

Gesamtkosten <- Kosten.pro.mm.Stichprobe*25182
#Die Gesamtkosten belaufen sich in diesem Fall auf 905711,43 Pence

#d)
with(buecher, plot(Preis, Dicke))

#e)
#Es zeigt sich eine (schwache) positive Korrelation, d.h. man könnte mithilfe 
#einer Regressionsgeraden durchaus von der Dicke auf den Preis schließen.
#Dieser Schätzwert muss jedoch nicht zuverlässig sein, da die Abstände zu der 
#Geraden doch groß sind (700,5) und (400,35) hätten etwa den gleichen Abstand 
#Besonders bei dicken Büchern gibt es Ausreißer (1400,70) und (2000, 40)











