### Blatt 1, Aufgaben 3 und 4: Verschiedene Elementaria.
### R 4.3.3, 2.5.2024
###********************************************************

# Aufgabe 3 ----
#***************
n <- 0:50
(zwei.hoch.n <- 2^n) # Die ersten (hier) 51 Potenzen von 2,
(n.quadrat <- n * n) # die ersten (hier) 51 Quadratzahlen.

# Logischer Vektor, der elementweise anzeigt, welche Werte
# gleich sind:
(gleich <- zwei.hoch.n == n.quadrat)
  # Beachte: Hier entsteht kein Rundungsproblem bei "==",
  # weil nur ganze Zahlen verglichen werden.

# Diejenigen n in {0, ..., 50}, für die die Gleichung
# erfüllt ist:
which(gleich) - 1
 # Die Subtraktion von 1 ist nötig bzw. leistet das Gewün-
 # schte, da hier - sozusagen ausnahmsweise - die Elemente
 # im Vektor n ihre um 1 reduzierten Positionsnummern sind.

# Die Werte der beiden Gleichungsseiten, für die die
# Gleichung erfüllt ist:
2^(which(gleich) - 1)

 # ODER mit Hilfe der logischen Indizierung
 # von Vektorelementen, also mit "[]":
n[gleich]
n.quadrat[gleich]




# Aufgabe 4 ----
#***************
(xx <- c(seq(0, 2*pi, by = 0.1), 2*pi))
 # Beachte, dass 2*pi "von Hand" hinzugefügt werden muss!

sinuswerte <- sin(xx)
cosinuswerte <- cos(xx)
tangenswerte <- tan(xx)

# Welche der "intern" berechneten Tangenswerte sind gleich
# der "von Hand" berechneten Quotienten gemäß Definition:
gleich <- tangenswerte == sinuswerte/cosinuswerte

# Wie viele sind gleich; wie viele ungleich?
sum(gleich)
sum(!gleich)   # = length(gleich) - sum(gleich)

# Wie stark "ungleich" sind sie?
max(abs(tangenswerte - sinuswerte/cosinuswerte)) 


# Evtl. recheneffizienter, wenn beteiligte Vekoren viel
# länger sind als hier und der Vektor "gleich" *sehr*
# viele TRUE-Einträge hat, denn für die Bestimmung der
# maxim. absol. Differenz wird nun nur auf die tatsächl.
# von 0 (Null) verschiedenen Differenzen zugegriffen:
ungl <- !gleich
max(abs(tangenswerte[ungl] -
        sinuswerte[ungl]/cosinuswerte[ungl]))



# Radikales Aufräumen ----
#*************************
rm(list = ls())
