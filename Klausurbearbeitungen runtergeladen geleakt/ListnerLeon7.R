#Listner, Leon. 8108323
#Aufgabe 7

#a)
Dichte <- read.csv2("Lungenlappendichte.csv")
str(Dichte)
Dichte

#b)
(Gesamt <- rowSums(Dichte[,3:6]))
#Berechnung der Zeilensummen ohne die HU-Dichten
(Dichte.Gesamt <- cbind(Dichte, Gesamt))

#c)
(gruppiert <- ordered(cut(Dichte$HUDichte, breaks = seq(from = -1100, to = 3100, by = 100))))
#Die Intervallaufteilung geschieht mit seq, cut erstellt einen Faktorvektor,
#durch ordered wird er zu einem geordneten Faktor.

(Häufigkeistverteilung <- tapply(Gesamt, gruppiert, sum))
#In jedem Intervall steht nun die Anzahl der HUDichten über alle Orte hinweg,
#die in diesem Intervall liegen.

#d)

par(las = 1, mar = c(5, 10, 4, 2))
barplot(Häufigkeistverteilung, horiz = TRUE)
#Die Verteilung ist stark rechtsschief, die Masse ist links/unten gebündelt,
#dennoch gibt es rechts/oben Ausreißer
#las sorgt für Horizontalen Schriftzug, der zweite Eintrag 10 in mar sorgt für
#ausreichenden Platz für die Beschriftungen.

#e) ?
Rekonstruktion


#f)
set.seed(80)
Stichproben <- sample(Rekonstruktion, 18000)
qqplot(Stichproben)
qqline(Stichproben)

#Da das Diagramm in d) schon rechtsschief war, werden auch die QQplots
#vermutlich Ausreißer nach oben anzeigen.




