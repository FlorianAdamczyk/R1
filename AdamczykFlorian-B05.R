# Florian Adamczyk R Aufgabenblatt 5
#Aufgabe 1

data(cu.summary, package = "rpart")

head(cu.summary)

class(cu.summary)

apply(cu.summary, 2, class)
lapply(cu.summary, class)
sapply(cu.summary, class)

# macht keinen großen Unterschied, aber sapply ist am besten
# sapply gibt einen Vektor zurück, lapply eine Liste
# apply gibt eine Matrix zurück

# mit "with" kann man auf die Spalten direkt zugreifen

#d) Ermitteln Sie zum einen unter Verwendung der Funktion unique und zum anderen der Funktion levels, welche verschiedenen Typen von Autos und welche L¨ander in cu.summary auftreten!

unique(cu.summary$Type)

levels(cu.summary$Type)

# das erste gibt einen Vektor zurück, das zweite eine Liste mit strings zurück

#e) Erstellen Sie die gemeinsame H¨aufigkeitstabelle (Kontingenztafel) der beiden Variablen Country und Type von cu.summary!

table(cu.summary$Country, cu.summary$Type)

#f) Bestimmen Sie unter Verwendung der Funktion tapply f¨ur jeden Autotyp den mittleren Preis und die zugeh¨orige Standardabweichung sowie schließlich den Variationskoeffizienten (= Standardabweichung relativ zum Mittelwert) der Preise eines jeden Autotyps!

tapply(cu.summary$Price, cu.summary$Type, mean)

# Aufgabe 2
# habe mir nochmal den Inhalt des Kapitels 3 ”Import und Export von Daten bzw. ihre Ausgabe am Bildschirm“ im Vorlesungsskript angeschaut.

#Aufgabe 3
#a) Lesen Sie die kopierte Datei SMSA aus Ihrem Arbeitsverzeichnis mit Hilfe der Funktion scan in R in eine Matrix namens smsa ein!

SMSA_mod <- readLines("SMSA") #einlesen der Datei
SMSA_mod <- sub("\\.O", ".0", SMSAO) # Ersetzen von ".O" durch ".0"
writeLines(SMSA_mod, "SMSA_mod") #Speichern der Datei
(smsa <- scan("SMSA_mod", skip = 4))# Einlesen der Datei in R. Das funktioniert jetzt, weil keine ".O" mehr in der Datei enthalten ist.

# was ist smsa für ein Objekt? ein Vektor
class(smsa)

smsa <- matrix(smsa, ncol = 12, byrow = TRUE) # Umwandeln des Vektors in eine Matrix
class(smsa)

# b) Benennen Sie die erste Spalte der Matrix smsa mit ”ID“ und die restlichen Spalten mit den Buchstaben ”A“ bis ”K“!
colnames(smsa) <- c("ID", LETTERS[1:11])

# c) Bestimmen Sie f¨ur jede Spalte vom smsa die folgenden Kenngr¨oßen: Arithmetisches Mittel, Median, Standardabweichung, erstes und drittes Quartil sowie Minimum und Maximum! (Ist dies f¨ur die erste und die letzte Spalte von smsa sinnvoll?)

apply(smsa, 2, mean)
apply(smsa, 2, median)
apply(smsa, 2, sd)
apply(smsa, 2, quantile, probs = c(0.25, 0.75))
apply(smsa, 2, min)
apply(smsa, 2, max)
