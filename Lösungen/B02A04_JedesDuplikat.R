### Blatt 2, Aufgabe 4: duplicated "extended".
### R 4.3.3, 9.5.2024
###***************************************************

# Bsp.-vektoren ----
#*******************
y <- c(1, 5, 1, 9, 5)
y2 <- c(y, rev(y), y)


# "Normale" Duplikate ----
#*************************
# (Qua definitionem von links beginnend):
y[duplicated(y)]

y2[duplicated(y2)]


# "Alle" mehrfach vorhandenen Elemente ----
#******************************************

## Version 1 ----

# Es wird zum einen von links (wie üblich) gesucht:
dup.von.links <- duplicated(y)

# Zum anderen wird von rechts gesucht, indem im durch
# rev "umgedrehten" Vektor wie üblich nach Duplikaten
# gesucht und dann das Resultat wieder "zurückgedreht"
# wird:
dup.von.rechts <- rev(duplicated(rev(y)))

# Schließlich wird der Vektor mit den zwei "ge-oder-
# ten" Suchergebnissen indiziert:
y[dup.von.links | dup.von.rechts]


# Oder "alles auf einmal":
y[duplicated(y) | rev(duplicated(rev(y)))]


y2[duplicated(y2) | rev(duplicated(rev(y2)))]


## Version 2 ----

# duplicated hat ein Argument, mit dem sich die Suche
# "umdrehen" lässt (siehe Hilfeseite!), sodass die 
# (ineffiziente) doppelte Verwendung von rev (von 
# Version 1) eingespart werden kann:
y[duplicated(y) | duplicated(y, fromLast = TRUE)]


# y2 sparen wir uns jetzt.


# Aufräumen ----
#***************
rm(list = ls())
