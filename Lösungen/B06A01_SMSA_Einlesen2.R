### Blatt 6, Aufgabe 1: Einlesen des SMSA-Datensatzes mit
###  read.table und Aufbereiten
### R 4.3.3, 6.6.2024
###*******************************************************

# a) Einlesen der Datei SMSA mit read.table ----
#***********************************************
# Annahme: Die Datei SMSA befindet sich im
# selben Verzeichnis, in dem R gerade läuft.

SMSA.df <- read.table("SMSA", skip = 3,
                      header = TRUE, row.names = "ID")

## Strukturkontrolle ----
str(SMSA.df)


# b) Benennung der Data Frame-Spalten ----
#*****************************************
names(SMSA.df) <- c("Area", "Pop", "CityPop", "PopOver65",
                    "Physicians", "HospBeds", "Graduates",
                    "LaborForce", "Income", "Crimes",
                    "Region")

## Stichprobenartige Inhaltskontrolle ----
# Ansicht des Ausschnitts der ersten 3
# und letzten 2 Zeilen des Data Frames:
head(SMSA.df, 3)
tail(SMSA.df, 2)


# c) Aufbereitung des Data Frames SMSA.df ----
#*********************************************
## Zeilenbenennung ----
row.names(SMSA.df) <- smsaid$City # Aus Lsg. zu B05-A3.

## Umwandlung der Komponente "Region" in einen Faktor ----
SMSA.df$Region <- factor(SMSA.df$Region, levels = 1:4,
                         labels = c("NE", "NC", "S", "W"))

## Kontrolle ----
# Via str und summary:
str(SMSA.df)
summary(SMSA.df)



# Aufräumen ----
#***************
# Dabei wird SMSA.df NICHT gelöscht,
# da es später noch gebraucht wird.
rm(smsa, smsaid, tmp)
