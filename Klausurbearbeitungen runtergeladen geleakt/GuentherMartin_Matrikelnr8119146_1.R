# Günther, Martin---
# Matrikelnr.8119146
#******************************************************
# Aufgabe 1
#******************************************************

#a

buecherwerte <- read.csv("Buecherwerte.csv") # Einlesen mittels read.csv
str(buecherwerte)
     

# b
durchschnittspreis <- mean(buecherwerte$Preis) #Durchschnittlichen Wert eines
# einzelnen Exemplares berechnen
wiederbeschaffungskosten_gesamt <- durchschnittspreis * 1554 #mit ANzahl multipl.


#c
durchschnitt_pmm <- mean(buecherwerte$Preis / buecherwerte$Dicke)
# Durchschnitt pro mm berechnen
wiederbeschaffungskosten_dicke <- durchschnitt_pmm*25182
# Gesamtdicke 25182

#d
#Streudiagramm Buchpreise/Buchdicken
plot(daten$Dicke, daten$Preis,
     xlab = "dicke in mm",# xAchse
     ylab = "Preis",# yAchse
     main = "Streudiagramm Buchpreise/Buchdicken",pch = 19, col = "red")

#e

modell <- lm(Preis ~ Dicke, data = buecherwerte) #Regressionsmodell erstellen
summary(modell) #Anzeigen 
# nun noch als Linie einzeichnen
abline(modell, col = "blue")

# Wie man bei Betrachtung des Diagramms nun sehen kann, struen die Punkte relativ
# stark. Insbesondere variieren die Abstände auch sehr, wodurch diese
#Ersatzvariable wenig geeignet scheint. Eventuell könnte man diese näherungs-
# weise für dünne Bücher nutzen, da diese in etwa gleich nach oben und unten 
# streuen und so ein fälschlich hohe Auszahlung bei einem, durch eine fälschlich
# niedrige Auszahlung bei einem anderen kompensiert würde.
# Insbesondere bei Büchern ab 30mm scheint dies jedoch aktuell nicht sinnvoll zu sein
# hier sind weitere Daten nötig





# Aufräumen ----
#***************
rm(list = ls())
