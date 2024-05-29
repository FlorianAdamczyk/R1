### Blatt 4, Aufgabe 1: Variablenweises Normieren multi-
### variater Daten.
### R 4.3.3, 23.5.2024
###*******************************************************

# Beispieldaten ----
#*******************
# Der in base-R "eingebaute" Datensatz airquality:
str(airquality)
summary(airquality)

## Nur die Luftqualitätsvariablen ----
aq.varnames <- c("Ozone", "Solar.R", "Wind", "Temp")

# Ihre arithmet. Mittelwerte und (Stichproben-)Standard-
# abweichungen:
(aq.means <- sapply(airquality[aq.varnames], mean, na.rm = TRUE))
(aq.stdevs <- sapply(airquality[aq.varnames], sd, na.rm = TRUE))

# Beobachtung/Fazit: ?!?


# Normierung der Luftqualitätsvariablen ----
#*******************************************

## Variante 1: sweep ----
#************************
# Erst spaltenweise zentrieren: 
aq.centered <- sweep(airquality[aq.varnames], MARGIN = 2,
                     STATS = aq.means) 

# Danach (!) spaltenweise standardisieren:
aq.normed <- sweep(aq.centered, MARGIN = 2,
                   STATS = aq.stdevs, FUN = "/") 

### Kontrolle ----
#*****************
# ... ihrer "neuen" arithmet. Mittelwerte und (Stich-
# proben-)Standardabweichungen:

# Beachte: Bekommt sweep einen Data Frame übergeben,
# liefert es auch einen zurück; daher verwenden wir
# wieder sapply:
sapply(aq.normed, mean, na.rm = TRUE)
sapply(aq.normed, sd, na.rm = TRUE)

# Zur Ergänzung:
summary(aq.normed)

# Beobachtung/Fazit: ?!?


## Variante 2: scale ----
#************************
# Mit einem einzigen Befehl erst spaltenweise zentrieren
# und danach (!) spaltenweise standardisieren:
aq.normed2 <- scale(airquality[aq.varnames])

### Kontrolle ----
#*****************
# ... ihrer "neuen" arithmet. Mittelwerte und (Stich-
# proben-)Standardabweichungen:

# Beachte: scale liefert stets eine Matrix zurück;
# daher verwenden wir hier nun apply:
apply(aq.normed2, MARGIN = 2, FUN = mean, na.rm = TRUE)
apply(aq.normed2, MARGIN = 2, FUN = sd, na.rm = TRUE)

# Zur Ergänzung:
summary(aq.normed2)

# Beobachtung/Fazit: ?!?


# Aufräumen ----
#***************
rm(list = ls())
