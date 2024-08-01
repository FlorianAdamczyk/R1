# Günther, Martin---
# Matrikelnr.8119146
#******************************************************
# Aufgabe 6
#******************************************************


#geg:
# Soll-Gewicht = 50g
# Stichprobe = 20

#a
Wollknaeuel <- scan("Wollknaeuelgewichte2024.txt") #Einlesen mit scan

str(Wollknaeuel) # Struktur und Anzahl Einträge prüfen
head(Wollknaeuel) #erste Einträge ausgeben
# Vergleich mit Editor - sieht gut aus


#b
# normal - qqnorm, Blatt 7 A2

# Vorab einheitliche Festlegung der Anzahl der "break
# points", die die x-Achsen der Histogramme äquidistant
# einteilen werden:
brks <- 20
hist(Wollknaeuel, freq = FALSE, breaks = brks,
     main = "Gewichtsverteilung Wollknäule", xlab = "", ylab = "")

qqnorm(Wollknaeuel, datax = TRUE, main = "")
qqline(Wollknaeuel, datax = TRUE)

# Sowohl die Betrachtung des Histogramms als auch des qqplots legt nahe,
# dass die Annahme einer normalverteilung gerechtfertig sein kann.
# beim Histogramm gibt es lediglich 3 "Ausreisser" und auch wenn die qqline
# keine "schöne" regressionsgerade durch die oberen Punkte liefert, sieht
# man anhand des Plots dass dies grundsätzlich möglich wäre



#c
# von mir gewähltes Verfahren: T-Test

# Voraussetzungen für den T-test sind im wesentlichen folgende:

# Die Daten wurden kontinuierlich erhoben und sind einheitlich skaliert,
# scheint hier bei Betrachtung der rohdaten gegeben zu sein

# Weiterhin müssen die Beobachtungen unabängig voneinander sein - auch 
# dies schein hier gegeben, wir wiegen ja einfach, ein Wiegevorgang beeinflusst
# ja die andere Wiegevorgänge nicht

# Die Stichprobe muss ausserdem repäsenatativ /normalverteilt sein, dies ist ins
# besondere wichtig wenn wir eine kleine Stichprobe haben (so wie hier)
# sollte die Stichprobe nicht repräsentativ sein ist folglich das Ergebnis auch
# nicht repräsentativ

#d

# Für die Durchführung des T-Tests sind insbesondere folgende Formalia relevatn:
# Es ist eine Nullhypothese notwendig. Diese würde beschreiben, dass die Beobachtung
# keinen Einfluss hätte. In unserem Wollbeispiel hier bedeuted dies, dass dass
# die durschnittliche Differenz zwischen Sollgewicht und beobachtetem Gewicht 0 ist

# als Altnativhypothese ist praktisch das Gegenteil und damit hier die Aussage, dass
# das die durschnicttliche Differenz des Gwichts größer als 0 ist

# weiterhin brauchen wir die Teststatistik, also den eigentlichen T-Test,
# dieser ist definiert als der Mittelwert der Differenzen, geteilt durch die 
# Standardabweichung und der Wurzel aus der Stichprobengröße

#weiterhin haben wir den p Wert, dieser sagt aus wie wahrscheintlich die 
# Nullhypothese aufgrund der Beobachtung ist. Großes p -> Nullhypothese ist wahrscheinlich

# T-Test Skript 139ff

#e
# wie Blatt 11,A2

differenz <- Wollknaeuel - 50 #Abweichung von 50g berechene

t_test <- t.test(differenz, alternative = "greater") # T-Test auf die Differenz
#durchführen


print(t_test) #Ergebnisse des T- test ausgeben

# Überprüfung der Nullhypothere
t_test$p.value <= 0.05  #darf nicht True sein, sonst ablehen

#Ergebnis ist True, daher müssen wir die Nullhypothese ablehnen, denn der 
# Mittelwert ist signifikant größer als das Sollgewicht von 50g

# Grundsätzlich stellt sich die Frage, was hier ein angemessenes Signifikanz-
# niveau wäre, 5% scheinen zwar eine akzeptable größenordnung zu sein, aber
# für eine spezifische Aussage wäre eine Vorgabe notwendig



# Aufräumen ----
#***************
rm(list = ls())


