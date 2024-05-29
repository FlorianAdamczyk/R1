### Blatt 4, Aufgabe 3: Extraktion von Teilen des Data
### Frames cu.summary.
### R 4.3.3, 23.5.2024
###*******************************************************

# Zur-Verfügung-Stellen von cu.summary ----

# Zur-Verfügung-Stellen des Objektes "cu.summary" aus
# dem -- bereits installierten -- Paket "rpart": Durch
# data(....) wird im workspace eine Kopie (!) von
# "cu.summary" angelegt. Es folgt die Überprüfung des
# aktuellen workspaces.
#*****************************************************
data(cu.summary, package = "rpart");    ls()


 # Zur Kontrolle: Welche Struktur hat cu.summary und
 # was steht zusammengefasst sozusagen "drin"?
str(cu.summary);     summary(cu.summary)


# a) Dt. Fahrzeuge ----
#**********************
# Extraktion des Teil-Data Frames der Zeilen mit
# deutschen Fahrzeugen:
(DAutos <- subset(cu.summary,
                  subset = Country == "Germany"))


# b) Dt. Fahrzeuge ohne Country-Spalte ----
#******************************************
# Extraktion des Teil-Data Frames der Zeilen mit
# deutschen Fahrzeugen, aber ohne die nun überflüssige
# Spalte Country:
(DAutos <- subset(cu.summary,
                  subset = Country == "Germany",
                  select = -Country))


# c) Levelsbereinigung ----
#**************************
# Wie sieht es jetzt mit den Faktorlevels aus?
str(DAutos)

# Elimination nicht auftretender/benötigter Levels
# aus allen (!) Faktoren eines Data Frames:
DAutos <- droplevels(DAutos)

# Und jetzt?
str(DAutos)


# Aufräumen ----
#***************
rm(list = ls())
