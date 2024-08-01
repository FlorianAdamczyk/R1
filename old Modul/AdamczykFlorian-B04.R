# Florian Adamczyk R Aufgabenblatt 4
#Aufgabe 1
airquality

# Normieren Sie die Werte der vier Variablen in airquality, die Messwerte der Luftqualitat enthalten!

airquality$Ozone <- (airquality$Ozone - min(airquality$Ozone, na.rm = TRUE)) / (max(airquality$Ozone, na.rm = TRUE) - min(airquality$Ozone, na.rm = TRUE))
airquality$Solar.R <- (airquality$Solar.R - min(airquality$Solar.R, na.rm = TRUE)) / (max(airquality$Solar.R, na.rm = TRUE) - min(airquality$Solar.R, na.rm = TRUE))
airquality$Wind <- (airquality$Wind - min(airquality$Wind, na.rm = TRUE)) / (max(airquality$Wind, na.rm = TRUE) - min(airquality$Wind, na.rm = TRUE))
airquality$Temp <- (airquality$Temp - min(airquality$Temp, na.rm = TRUE)) / (max(airquality$Temp, na.rm = TRUE) - min(airquality$Temp, na.rm = TRUE))

airquality

#Aufgabe 3

# Machen Sie sich (wie im Skript am Anfang von Abschnitt 2.10 gezeigt) mit Hilfe der Funktion data den Data Frame cu.summary des R-Paketes rpart verfügbar
# > library("rpart")

data(cu.summary, package = "rpart")

head(cu.summary)

# a) Extrahieren Sie mithilfe der Funktion subset aus cu.summary den (Teil-)Data Frame, der nur die Daten zu deutschen Fahrzeugen enth¨alt.

german_cars <- subset(cu.summary, Country == "Germany")

german_cars

# b) Im Resultat von eben ist die Spalte Country nun offenbar ¨uberfl¨ussig. Eliminieren Sie sie bereits bei der Extraktion des (Teil-)Data Frames im Aufruf von subset.

german_cars <- subset(cu.summary, Country == "Germany", select = -Country) # das ist die Musterlösung!

german_cars

# c) In den verbliebenen Factor-Spalten treten einige ihrer Factor-Levels nicht mehr auf. Eliminieren Sie diese ¨uberfl¨ussigen Levels.

german_cars$Type <- droplevels(german_cars$Type)

german_cars
