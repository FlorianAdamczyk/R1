### Blatt 5, Aufgabe 3: Einlesen des SMSA-Datensatzes
###  mit scan und Aufbereitung.
### R 4.3.3, 29.5.2024
###*******************************************************

# a) Einlesen der Datei SMSA mit scan ----
#*****************************************
# Annahme: Die Datei "SMSA" befindet sich in demselben
# Verzeichnis, in dem R gerade läuft.
# Das Folgende ergibt zunächst einen Fehler, da sich in
# der Datei "SMSA" ein "Tippfehler" befindet: In Zeile
# "16" steht in Spalte "9" der Eintrag "906.O", dessen
# letztes Zeichen der Buchstabe (!) "O" und nicht die
# Ziffer "0" (Null) ist. Es ist eine entsprechende manu-
# elle Modifikation der Datei "SMSA" notwendig, bevor
# der folgende Befehl funktioniert.

smsa <- matrix(scan(file = "SMSA", skip = 4),
               ncol = 12, byrow = TRUE)

## Zur Kontrolle ----
#********************
# Struktur und Ansicht eines Ausschnitts der Matrix,
# nämlich ihre ersten und letzten 6 Zeilen:
str(smsa)
head(smsa)
tail(smsa)


# b) Benennung der Matrixspalten ----
#************************************
colnames(smsa) <- c("ID", LETTERS[ 1:11])

 # Eine Lösung für a) und b) zusammen
 #***********************************
 # Import mit scan und sofortiges (zeilenweises) Bilden
 # einer Matrix samt Benennung ihrer Spalten, gefolgt
 # von einer stichprobenartigen Kontrolle der Matrix
 # durch Ansicht eines Ausschnitts, nämlich ihrer
 # ersten 3 und letzten 2 Zeilen:
 smsa <- matrix(scan(file = "SMSA", skip = 4),
                ncol = 12, byrow = TRUE,
                dimnames = list(NULL,
                                c("ID", LETTERS[ 1:11])))

## Zur Kontrolle ----
#*******************
# Ansicht eines Ausschnitts der Matrix, nämlich
# ihre ersten 3 und letzten 2 Zeilen
head(smsa, 3)
tail(smsa, 2)


# c) Spaltenweise Kenngrößen ----
#********************************
# Erst spaltenweise die 6-Zahlen-Zusammenfassung, dann
# spaltenweise die Standardabweichung:
apply(smsa, 2, summary)
apply(smsa, 2, sd)

  ## Für die erste und die letzte Spalte
  ## ist dies wohl sinnlos, oder?!


# d) Einlesen der Datei SMSAID mit scan ----
#*******************************************
# Annahme: Die Datei "SMSAID" befindet sich in demselben
# Verzeichnis, in dem R gerade läuft.
# Auch das Folgende ergibt zunächst einen Fehler, da
# sich in der Datei "SMSAID" ein "Tippfehler" befindet: ...
# Es ist eine entsprechende manuelle Modifikation der Datei
# "SMSAID" notwendig, bevor der folgende Befehl funktioniert.
tmp <- scan(file = "SMSAID", sep = "\t", skip = 3,
            what = list(ID1 = 0, City1 = "",
                        ID2 = 0, City2 = "",
                        ID3 = 0, City3 = ""))

str(tmp) # Kontrolle, welche Modi die einzel-
         # nen Komponenten der Liste haben.

# Umbau zu einer Liste mit allen SMSA-IDs in einer
# Komponente und allen City-Namen in einer anderen:
smsaid <- list(ID = c(tmp$ID1, tmp$ID2, tmp$ID3),
               City = c(tmp$City1, tmp$City2, tmp$City3))

 ## Oder etwas kürzer
 smsaid <- with(tmp, list(ID = c(ID1, ID2, ID3),
                          City = c(City1, City2, City3)))

str(smsaid)  # "Endkontrolle" der resultierenden Liste.


 ## Achtung: Beachten Sie, was geschieht, wenn Sie in
 ## obigem scan-Aufruf das einfachere Argument what =
 ## list(ID = 0, City = "") verwenden! Kann das ein
 ## weniger kompliziertes Einlesen der SMSAID-Daten
 ## ermöglichen?


# e) Umwandlung der Matrix in den Data Frame ----
#************************************************
# Umwandlung der Matrix smsa in den Data Frame SMSA.df
# samt sinnvollerer Benennung seiner Variablen:
SMSA.df <- data.frame(smsa)
  # Oder: SMSA.df <- as.data.frame(smsa)

names(SMSA.df) <- c("Id", "Area", "Pop", "CityPop",
                    "PopOver65", "Physicians", "HospBeds",
                    "Graduates", "LaborForce", "Income",
                    "Crimes", "Region")
## Oder: colnames(SMSA.df) <- c("Id", ...., "Region")

## Zur Kontrolle ----
#********************
# Ansicht eines Ausschnitts des Data Frames, nämlich
# seine ersten 3 und letzten 2 Zeilen:
head(SMSA.df, 3)
tail(SMSA.df, 2)


# f) Zeilenbenennung für SMSA.df ----
#************************************
# Zeilenbenennung für SMSA.df und Elimination der ersten
# Komponente:
rownames(SMSA.df) <- smsaid$City

SMSA.df <- SMSA.df[ -1]    # Erste Komponente raus!

## Erneute Inhaltskontrolle ----
#*******************************
head(SMSA.df, 3)
tail(SMSA.df, 2)


# g) Umwandlung der Komponente "Region" in einen Faktor ----
#***********************************************************
SMSA.df$Region <- factor(SMSA.df$Region, levels = 1:4,
                         labels = c("NE", "NC", "S", "W"))

## Kontrolle ----
#****************
head(SMSA.df, 10)


# h) str und summary ----
#************************
# str und summary angewendet auf den Data Frame SMSA.df,
# wobei letzteres den Nutzen von Data Frames verdeutlicht:
str(SMSA.df)

summary(SMSA.df)


# Aufräumen ----
#***************
rm(list = ls())
