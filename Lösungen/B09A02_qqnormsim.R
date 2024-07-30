### Blatt 9, Aufgabe 2: Hilfsfkt. qqnorm.sim
### R 4.3.3, 11.7.2024
###************************************************************

# Die Funktionsimplementation ----
#*********************************

qqnorm.sim <- function(x) {
  oldp <- par(mfrow = c(3, 4))   # oldp speichert die aktuellen
    # Einstellungen des Grafiklayouts (bevor der (3x4)-Mehr-
    # fachplotrahmen aktiviert wird), um sie nachher wiederher-
    # zustellen.
        
   qqnorm(x, main = "Originaldaten",  # Normal-QQ-Plot der zu
          datax = TRUE, col = "red")  # beurteilenden Daten
   qqline(x, datax = TRUE)            # (rot) mit Refenzlinie.
        
   n <- length(x)   # Stichprobenumfang der zu beurteil. Daten.
   replicate(11, {  # 11-fache Wiederh. der Befehle in {....}.
         xx <- rnorm(n)  # Erzeugung normalverteilter Daten.
         qqnorm(xx, main = "Simulationsdaten", datax = TRUE)
         qqline(xx, datax = TRUE)
         } )
 invisible(par(oldp))  # Restauration des vorherigen Grafik-
                       # layouts, ohne dass ein Rückgabewert
                       # an der Aufrufstelle ausgegeben wird.
 # Alternative: on.exit(par(oldp)) # Bedeutung siehe Hifeseite!
 }



# Anwendungsbsp. ----
#********************
# Die Mietdaten aus Aufgabe 3 von Blatt 6.
# Import und Kontrolle der Rohdaten:
(Mieten <- scan(file = "MietenFrankfurt"))

# Normal-QQ-Plot der zu beurteilenden Schmelztemperaturen
# (in rot) sowie zum Vergleich die Normal-QQ-Plots der 11
# simulierten, tatsächlich normalverteilten Stichproben
# gleichen Umfangs:
qqnorm.sim(Mieten)

# Frage: Ergeben sich Zweifel an der Normalverteilungsannahme
# für diese Schmelztemperaturen?


# "Stilfrage" ----
#*****************
# Lässt sich das Layout verbessern, z. B. evtl. "ausdünnen",
# indem Redundanzen in der Beschriftung und unnötiger "white
# space" entfernt werden? Probieren Sie es, z. B. mit Hilfe
# von `par` usw.!
