### Blatt 4, Aufgabe 4: "Bereinigen" des Data Frames cu.summary
### R 4.3.3, 23.5.2024
###*******************************************************

# Zur-Verfügung-Stellen von cu.summary ----
#******************************************
# Wie in A. 2 dieses Blattes:
data(cu.summary, package = "rpart")


# a) Extraktion NA-freier Zeilen ----
#************************************
# Extrahiere die Zeilen von cu.summary, die kein NA
# enthalten:

# Dazu wird erst eine logische Matrix desselben Formats
# wie cu.summary erzeugt, die genau dort ein TRUE ent-
# hält, wo sich in cu.summary ein NA befindet:
#******************************************************
NA.Matrix <- is.na(cu.summary)

# Dann folgt die Abfrage einer jeden Zeile von NA.Matrix,
# ob sich jeweils mindestens ein NA in ihr befindet, und
# die Rückgabe eines logischen Vektors, der in seinem i-
# ten Element genau dann TRUE enthält, wenn dies in der
# i-ten Zeile zutrifft (gezeigt werden nur seine ersten
# 30 Elemente):
#********************************************************
head(NA.Zeile <- apply(NA.Matrix, 1, any), 30)

# Schließlich wird der NA-bereinigte Teil-Data Frame ex-
# trahiert, indem die Negation von NA.Zeile als Zeilen-
# Indexvektor verwendet wird:
#*******************************************************
cu2 <- cu.summary[!NA.Zeile, ]

## Resultatkontrolle ----
#************************
str(cu2);    # summary(cu2)


## Kürzere Varianten: na.omit, na.exclude ----
#*********************************************
# na.omit entfernt alle unvollständigen 'cases' eines
# Data Frames, d. h., alle Zeilen, die mindestens ein
# NA enthalten. Zusätzlich wird ein Attribut "na.action"
# hinzugefügt, in dem die Nummern und Namen der elimi-
# nierten 'cases' gespeichert werden.
cu2 <- na.omit(cu.summary);     str(cu2)


# na.exclude macht faktisch dasselbe wie na.omit;
# lediglich das Attribut "na.action" hat eine
# andere Klasse, was für uns irrelevant ist.
#************************************************
str(na.exclude(cu.summary))



# b) Extraktion NA-freier Spalten ----
#*************************************
# Extrahiere die Spalten von cu.summary, die mindestens
# ein NA enthalten:

# NA.Matrix wird erneut verwendet, und zwar nun für die
# Abfrage einer jeden Spalte von NA.Matrix, ob sich je-
# weils mindestens ein NA in ihr befindet, und Rückgabe
# eines logischen Vektors, der in seinem j-ten Element
# genau dann TRUE enthält, wenn dies in der j-ten Spalte
# zutrifft:
#*******************************************************
(NA.Spalte <- apply(NA.Matrix, 2, any))

# Sodann wird der NA-bereinigte Teil-Data Frame extra-
# hiert, indem die Negation von NA.Spalte als Spalten-
# Indexvektor verwendet wird:
#*****************************************************
cu3 <- cu.summary[, !NA.Spalte]

## Resultatkontrolle ----
#************************
str(cu3);    # summary(cu3)



# Extraktion NA-freier Zeilen UND Spalten ----
#*********************************************
# Extrahiere die Zeilen UND Spalten von cu.summary, die
# mindestens ein NA enthalten!
# Ergebnis: NA-bereinigter Data Frame, indem die Negation
# von NA.Zeile als Zeilen- und die Negation von NA.Spalte
# als Spalten-Indexvektor verwendet wird:
cu4 <- cu.summary[!NA.Zeile, !NA.Spalte]


## Resultatkontrolle ----
#************************
str(cu4);    # summary(cu4)


# "Denkanstoß" 1 ----
#********************
# Ist die Reihenfolge der Elimination der Zeilen und
# Spalten relevant?
# M. a. W.: Was ist das Ergebnis, wenn man erst die NA-
# Zeilen eliminiert, dann die NA-Spalten im Vergleich
# zur umgekehrten Reihenfolge?
#
# Und was machen wir eigentlich bei der obigen Erzeugung
# von cu4?

# "Denkanstoß" 2 ----
#********************
# Ist es eigentlich sinnvoll, aus einem Data Frame NA-
# Spalten (und damit Variablen) zu löschen, wenn seine
# Zeilen doch als "cases" interpretiert werden?

# Aufräumen ----
#***************
rm(list = ls())
