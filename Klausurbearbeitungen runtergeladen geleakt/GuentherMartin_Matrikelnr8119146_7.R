# Günther, Martin---
# Matrikelnr.8119146
#******************************************************
# Aufgabe 7
#******************************************************

#a
lungen_daten <- read.csv2("Lungenlappendichte.csv") # Daten Einlesen
# Überprüfung der Eingelsenen Daten, Header etc.
str(lungen_daten) # Beschreibung 4075x6
head(lungen_daten) # oberste Werte ausgeben lassen
# Ausgabe stimmt mit CSV in Excel überein

is.data.frame(lungen_daten)# Überprüfung auf Typ

#b

lungen_daten$Gesamt <- rowSums(lungen_daten[, c("LU", "LO", "RU", "RM", "RO")])
#neue Spalte Gesamt in DF einfügen
# Prüfugn:
head(lungen_daten) # oberste Werte ausgeben lassen


#c
# cut S.39 Skript
#Siehe auch die Hilfeseiten zu proportions, margin.table und addmargins,


lungen_daten$Faktor <- cut(lungen_daten$HUDichte, breaks = seq(-1100, 3100, by = 100))
#Nutzung cut Funktion
head(lungen_daten)

gruppiert <- tapply(lungen_daten$Gesamt, lungen_daten$Faktor, sum) #gruppieren mit tapply S.40
head(gruppiert) #Ausgabe der gruppierten Daten header
str(gruppiert)


# d
par(las = 1, mar = c(6, 10, 4, 5)) #Beschriftung beider Achsen horizontal, Platz

#Balkendiagramm erstellen
barplot(gruppiert, horiz = TRUE, main = "Gruppierte HUWerte", xlab = "Anzahl", ylab = "Gruppe")




# Aufräumen ----
#***************
rm(list = ls())

