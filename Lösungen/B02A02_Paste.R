### Blatt 2, Aufgabe 2: Zur Verwendung von paste.
### R 4.3.3, 9.5.2024
###****************************************************

# Die Daten ----
#***************
# "Von Hand" erfasst:
x <- c(0.61, 0.79, 0.83, 0.66, 0.94, 0.78, 0.81,
       0.60, 0.88, 0.90, 0.75, 0.86, 0.74, 0.84)
y <- c(1.01, 0.13, 1.73, 0.67, 0.56, 0.99, 0.49,
       0.72, 0.13, 0.48, 0.98, 0.08, 1.23, 0.87)


# a) ----
# Der Vektor der x-Ordnungsstatistiken (kurz x-OSn)
(xOS <- sort(x))


# b) ----
# Der character-Vektor zur "Präsentation" der x-OSn
n <- length(x)
paste("x(", 1:n, ":", n, ") = ", xOS, sep = "")

 # Dasselbe:
paste0("x(", 1:n, ":", n, ") = ", xOS)


# c) ----
# Der Vektor der y-Konkomitanten zu den x-OSn
(yKonko <- y[order(x)])

  # Zur Überprüfung vergleiche:
  rbind(x, y)
  rbind(xOS, yKonko)


# d) ----
# Der character-Vektor zur "Präsentation"
# der x-OSn samt ihrer y-Konkomitanten
xpart <- paste0("x(", 1:n, ":", n, ")")
ypart <- paste0("y[", 1:n, ":", n, "]")
paste0("(", xpart, ", ", ypart,
       ") = (", xOS, ", ", yKonko, ")")


# e) ----
# Der character-Vektor von d) in "schöner" Forma-
# tierung (und als "Einzeiler" ohne Hilfsgrößen)
paste0("(x(", format(1:n), ":", n, "), y[",
       format(1:n), ":", n, "]) = (", 
       format(xOS), ", ", format(yKonko), ")")

  # "Verschönerung" durch führende Nullen mit formatC
  # (für Details siehe Hilfeseite zu formatC):
  paste0("(x(", formatC(1:n, width = 2, flag = 0),
                ":", n,
           "), y[", formatC(1:n, width = 2, flag = 0),
                    ":", n,
           "]) = (", format(xOS), ", ", format(yKonko),
                ")")

# Aufräumen ----
#***************
rm(list = ls())
