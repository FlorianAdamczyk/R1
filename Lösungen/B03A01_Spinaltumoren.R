### Blatt 3, Aufgabe 1: Zwei Faktoren (Blutgruppe und Spinaltumor-
### ätiologie) und verschiedene Tabellierungen
### R 4.3.3, 16.5.2024
###*******************************************************************

# Die "Rohdaten" ----
#********************
# ... (als Zeichenkettenvektoren), die man *so* nie in R
# erfassen/einlesen würde; besseres lernen wir in Kap. 3:
# (Die eigentliche Bearbeitung folgt unten.)
Blutgruppe <- c(
 "B", "0", "0", "0", "A", "0", "0", "0", "0", "0", "A", "A", "0", "0", "0",
 "0", "0", "0", "A", "A", "B", "A", "A", "0", "A", "A", "A", "0", "0", "A",
 "A", "0", "0", "A", "0", "0", "A", "0", "A", "A", "A", "A", "A", "A", "A",
 "0", "A", "0", "A", "A", "AB", "B", "A", "A", "A", "0", "0", "B", "0", "A",
 "0", "A", "A", "0", "A", "AB", "AB", "0", "A", "A", "A", "B", "A", "0", "A",
 "A", "0", "A", "A", "A", "0", "0", "A", "A", "0", "0", "A", "B", "B", "0",
 "0", "B", "A", "0", "B", "A", "0", "0", "0", "0", "0", "0", "0", "0", "AB",
 "B", "B", "0", "B", "A", "A", "0", "A", "0", "A", "AB", "A", "A", "0", "A",
 "0", "A", "0", "B", "0", "A", "0", "A", "0", "A", "A", "A", "A", "A", "0",
 "0", "A", "0", "0", "0", "A", "A", "A", "B", "A", "A", "A", "B", "0", "A",
 "A", "B", "0", "0", "B", "B", "0", "A", "0", "A", "AB", "B", "0", "A", "0",
 "A", "0", "A", "A", "0", "AB", "A", "A", "A", "A", "0", "A", "0", "B", "0",
 "A", "AB", "AB", "A", "AB", "A", "0", "A", "A", "AB", "0", "0", "A", "B",
 "0", "A", "B", "0", "0", "B", "0", "0", "0", "0", "A", "A", "B", "A", "0",
 "0", "A", "0", "A", "0", "A", "A", "A", "0", "A", "A", "A", "A", "A", "0",
 "A", "A", "A", "0", "0", "A", "0", "B", "A", "0", "A", "A", "B", "0", "0",
 "0", "AB", "0", "A", "0", "AB", "A", "B", "0", "0", "A", "A", "0", "0", "A",
 "0", "AB", "AB", "A", "A", "A", "B", "0", "A", "B", "A", "0", "A", "A", "A",
 "A", "0", "A", "A", "B", "0", "0", "B", "A", "0", "0", "0", "0", "0", "A",
 "0", "0", "0", "0", "A", "0", "0", "A", "A", "A", "A", "0", "0", "A", "0",
 "A", "A", "0", "0", "0", "0", "B", "0", "B", "A", "A", "A", "A", "A", "0",
 "0", "0", "A", "A", "A", "AB", "A", "0", "0", "B")

Tumoraetiologie <- c(
 "Mesenchymal", "Sonstiges", "Mesenchymal", "Mesenchymal", "Metastase",
 "Mesenchymal", "Metastase", "Metastase", "Metastase", "Metastase",
 "Neuroepithelial", "Metastase", "Mesenchymal", "Metastase",
 "Neuroepithelial", "Nervenscheiden", "Sonstiges", "Metastase",
 "Nervenscheiden", "Metastase", "Metastase", "Neuroepithelial",
 "Nervenscheiden", "Mesenchymal", "Metastase", "Sonstiges", "Mesenchymal",
 "Neuroepithelial", "Mesenchymal", "Sonstiges", "Sonstiges", "Sonstiges",
 "Sonstiges", "Neuroepithelial", "Sonstiges", "Nervenscheiden",
 "Neuroepithelial", "Sonstiges", "Nervenscheiden", "Metastase", "Metastase",
 "Sonstiges", "Metastase", "Mesenchymal", "Metastase", "Nervenscheiden",
 "Sonstiges", "Metastase", "Mesenchymal", "Metastase", "Sonstiges",
 "Neuroepithelial", "Mesenchymal", "Mesenchymal", "Sonstiges", "Mesenchymal",
 "Mesenchymal", "Metastase", "Nervenscheiden", "Mesenchymal", "Sonstiges",
 "Neuroepithelial", "Nervenscheiden", "Nervenscheiden", "Metastase",
 "Mesenchymal", "Neuroepithelial", "Metastase", "Metastase", "Sonstiges",
 "Metastase", "Nervenscheiden", "Metastase", "Metastase", "Neuroepithelial",
 "Sonstiges", "Neuroepithelial", "Metastase", "Nervenscheiden", "Sonstiges",
 "Sonstiges", "Metastase", "Metastase", "Metastase", "Neuroepithelial",
 "Nervenscheiden", "Metastase", "Sonstiges", "Nervenscheiden", "Metastase",
 "Sonstiges", "Mesenchymal", "Metastase", "Metastase", "Metastase",
 "Sonstiges", "Sonstiges", "Metastase", "Neuroepithelial", "Mesenchymal",
 "Metastase", "Sonstiges", "Mesenchymal", "Neuroepithelial", "Sonstiges",
 "Metastase", "Metastase", "Metastase", "Mesenchymal", "Metastase",
 "Neuroepithelial", "Metastase", "Mesenchymal", "Nervenscheiden",
 "Mesenchymal", "Metastase", "Neuroepithelial", "Neuroepithelial",
 "Neuroepithelial", "Neuroepithelial", "Neuroepithelial", "Nervenscheiden",
 "Mesenchymal", "Metastase", "Nervenscheiden", "Mesenchymal", "Metastase",
 "Neuroepithelial", "Mesenchymal", "Neuroepithelial", "Mesenchymal",
 "Mesenchymal", "Metastase", "Sonstiges", "Neuroepithelial", "Metastase",
 "Metastase", "Metastase", "Sonstiges", "Metastase", "Metastase",
 "Sonstiges", "Nervenscheiden", "Metastase", "Nervenscheiden", "Sonstiges",
 "Neuroepithelial", "Mesenchymal", "Mesenchymal", "Metastase", "Metastase",
 "Metastase", "Metastase", "Metastase", "Nervenscheiden", "Metastase",
 "Nervenscheiden", "Mesenchymal", "Mesenchymal", "Sonstiges", "Sonstiges",
 "Metastase", "Mesenchymal", "Mesenchymal", "Neuroepithelial",
 "Mesenchymal", "Metastase", "Neuroepithelial", "Metastase",
 "Neuroepithelial", "Neuroepithelial", "Metastase", "Neuroepithelial",
 "Neuroepithelial", "Neuroepithelial", "Metastase", "Mesenchymal",
 "Mesenchymal", "Sonstiges", "Nervenscheiden", "Mesenchymal",
 "Mesenchymal", "Nervenscheiden", "Metastase", "Nervenscheiden",
 "Metastase", "Metastase", "Mesenchymal", "Metastase", "Nervenscheiden",
 "Metastase", "Nervenscheiden", "Sonstiges", "Metastase", "Mesenchymal",
 "Neuroepithelial", "Nervenscheiden", "Mesenchymal", "Sonstiges",
 "Sonstiges", "Metastase", "Sonstiges", "Nervenscheiden", "Metastase",
 "Metastase", "Nervenscheiden", "Neuroepithelial", "Metastase",
 "Sonstiges", "Sonstiges", "Sonstiges", "Sonstiges", "Mesenchymal",
 "Mesenchymal", "Metastase", "Metastase", "Sonstiges", "Nervenscheiden",
 "Sonstiges", "Metastase", "Metastase", "Nervenscheiden", "Mesenchymal",
 "Metastase", "Neuroepithelial", "Nervenscheiden", "Neuroepithelial",
 "Neuroepithelial", "Nervenscheiden", "Metastase", "Metastase",
 "Metastase", "Nervenscheiden", "Sonstiges", "Sonstiges", "Metastase",
 "Metastase", "Nervenscheiden", "Metastase", "Metastase", "Neuroepithelial",
 "Sonstiges", "Mesenchymal", "Sonstiges", "Metastase", "Nervenscheiden",
 "Mesenchymal", "Metastase", "Sonstiges", "Nervenscheiden", "Mesenchymal",
 "Metastase", "Sonstiges", "Mesenchymal", "Nervenscheiden", "Nervenscheiden",
 "Sonstiges", "Nervenscheiden", "Neuroepithelial", "Mesenchymal",
 "Metastase", "Mesenchymal", "Mesenchymal", "Metastase", "Sonstiges",
 "Nervenscheiden", "Metastase", "Sonstiges", "Metastase", "Mesenchymal",
 "Metastase", "Nervenscheiden", "Mesenchymal", "Sonstiges", "Nervenscheiden",
 "Neuroepithelial", "Nervenscheiden", "Metastase", "Metastase",
 "Mesenchymal", "Metastase", "Neuroepithelial", "Neuroepithelial",
 "Metastase", "Sonstiges", "Nervenscheiden", "Nervenscheiden", "Metastase",
 "Mesenchymal", "Sonstiges", "Nervenscheiden", "Metastase", "Mesenchymal",
 "Mesenchymal", "Metastase", "Nervenscheiden", "Metastase", "Mesenchymal",
 "Metastase", "Metastase", "Nervenscheiden", "Nervenscheiden", "Mesenchymal",
 "Metastase", "Metastase", "Mesenchymal", "Sonstiges", "Metastase",
 "Metastase", "Mesenchymal", "Metastase", "Nervenscheiden", "Metastase",
 "Metastase", "Metastase", "Mesenchymal", "Metastase", "Nervenscheiden",
 "Nervenscheiden", "Sonstiges", "Neuroepithelial", "Sonstiges", "Metastase",
 "Mesenchymal")


# a) Umwandlung in (ungeordnete) Faktoren ----
#*********************************************
(BG <- factor(Blutgruppe)) # Levelordnung gemäß alphanumer. Sortierung

(BG <- factor(Blutgruppe, levels = c("A", "B", "AB", "0")))
                            # Levelordnung "selbstbestimmt"

head(TA <- factor(Tumoraetiologie), n = 20) # Levelordnung gemäß alpha-
                              # numer. Sortierung (und aus Platzgründen
                              # nur die ersten 20 Einträge gezeigt)

# b) Häufigkeitsverteilungen ----
#********************************
# Absolut:
# Eindimensional / univariat:
(absHK.BG <- table(BG));   (absHK.TA <- table(TA))

# Gemeinsam / zweidimensional / bivariat:
(absHK.TA.BG <- table(TA, BG))


# Relativ:
# Eindimensional / univariat:
(relHK.BG <- prop.table(absHK.BG)) # = proportions(absHK.BG)
(relHK.TA <- proportions(absHK.TA))

# Gemeinsam / zweidimensional / bivariat:
# Welche relativen Häufigkeiten sind das im Folgenden jeweils?
(relHK.TA.BG  <- proportions(absHK.TA.BG))
(relHK.TA.BG1 <- proportions(absHK.TA.BG, margin = 1))
(relHK.TA.BG2 <- proportions(absHK.TA.BG, margin = 2))


# c) Marginalien (= Randsummen) ----
#***********************************
# Absolut:
# Eindimensional / univariat:
addmargins(absHK.BG)
addmargins(absHK.TA)

# Gemeinsam / zweidimensional / bivariat:
# Welche Marginalien sind das im Folgenden jeweils?
addmargins(absHK.TA.BG)
addmargins(absHK.TA.BG, margin = 1)
addmargins(absHK.TA.BG, margin = 2)


# Relativ: 
# Eindimensional / univariat:
# Sind die folgenden Marginalien nützlich?
addmargins(relHK.BG)
addmargins(relHK.TA)

# Gemeinsam / zweidimensional / bivariat:
# Welche Marginalien sind das im Folgenden jeweils?
addmargins(relHK.TA.BG)
addmargins(relHK.TA.BG, margin = 1)
addmargins(relHK.TA.BG, margin = 2)

# Welche der folgenden Marginalien sind sinnvoll bzw. nützlich?
addmargins(relHK.TA.BG1, margin = 1)
addmargins(relHK.TA.BG1, margin = 2)

# Und hier?
addmargins(relHK.TA.BG2, margin = 1)
addmargins(relHK.TA.BG2, margin = 2)


# d) Zusammenfassung von Levels ----
#***********************************
BG2 <- BG
levels(BG2) <- c(rep("Non-0", 3), "0")
  # Zur Kontrolle:
table(BG2)

TA2 <- TA
levels(TA2) <- c("Mesenchymal", "Metastase", "Nervensystem",
                 "Nervensystem", "Sonstiges")
  # Zur Kontrolle:
table(TA2)


# Nochmal b) und c) auf der Basis von BG2 und TA2 ----
#*****************************************************
# Führen wir hier nicht aus, da es völlig analog geht.


# Aufräumen ----
#***************
rm(list = ls())
