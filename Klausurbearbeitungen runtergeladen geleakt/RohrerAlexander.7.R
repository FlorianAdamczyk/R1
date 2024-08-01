### Name: Alexander Rohrer
### Matrikelnummer: 8120463

### Aufgabe 7


#*******************************************************************************************
# 7 a)

lld <- read.csv("Lungenlappendichte.csv", header=TRUE, sep = ";")
sum(is.na(lld))
str((lld))

# Es gibt keine Fehlwerte und es sind alles Integer

#*******************************************************************************************
# 7 b)

lld["Gesamt"] <- rowSums(lld[2:6])

#*******************************************************************************************
# 7 c)

# Intervallgrenzen
breaks <- seq(-1100, 3100, by = 100)

# Erstellen des Faktorvektors
lld$HUDichte_Faktor <- cut(lld$HUDichte, breaks = breaks, right = FALSE, 
                            labels = paste0("[", head(breaks, -1), ",", tail(breaks, -1), ")"))

# Gruppieren der Daten für jedes Intervall
lld_gruppiert <- tapply(lld$Gesamt, lld$HUDichte_Faktor, sum)


#*******************************************************************************************
# 7 d)

par(mar = c(5, 8, 4, 2) + 0.6)
barplot(lld_gruppiert, 
        horiz = TRUE, 
        las = 1,  # Beschriftung der Y-Achse horizontal
        main = "Häufigkeitsverteilung der gruppierten HUDichte",
        xlab = "Summe der Gesamtwerte",
        #ylab = "HUDichte Intervalle",
        cex.names = 0.8)  # Schriftgröße der Achsenbeschriftungen anpassen, falls nötig

mtext("HUDichte Intervalle", side = 2, line = 5, cex = 0.8)

# Die Verteilung der Daten ist stark linksschief mit fast ausschließlich negativen daten
#*******************************************************************************************
# 7 e)

rohdaten <- rep(lld$HUDichte, lld$Gesamt)

#*******************************************************************************************
# 7 f)
seet(123)
size <- length(rohdaten) * 0.005
sample <- sample(rohdaten, size = size)
qqnorm(sample, main = "QQ-Plot der Teilstichprobe")
qqline(sample, col = "red")

# Schlussfolgerung:
# Die Normalverteilungsanname ist definitv nicht haltbar, da die Daten
# einen großen Schlenker machen