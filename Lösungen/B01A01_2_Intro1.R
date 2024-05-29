### Blatt 1, Aufgaben 1 und 2: Verschiedene Elementaria.
### R 4.3.3, 2.5.2024
###*****************************************************

# Aufgabe 1 ----
#***************
## a) "Gemusterte" Folgen ----
### Folge 1 ----
# (1, -1, 1, -1, ...., 1, -1, 1) mit Länge 13

rep(c(1, -1), length.out = 13)

# oder:
c(rep(c(1, -1), times = 6), 1)

# oder:
rep(c(-1, 1), times = 7)[-1]


### Folge 2 ----
# (2, 2, 4, 4, 4, 4, 6, 6, 6, 6, 6, 6, ..., 12, ..., 12)
#                                           ^^^^^^^^^^^
#                                             12 Stück

n <- 6;     gerade.zahlen <- 2 * 1:n
rep(gerade.zahlen, times = gerade.zahlen)


### Folge 3 ----
# (1, 1, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, ..., 11, ..., 11)
#                                           ^^^^^^^^^^^
#                                            12 Stück

rep(gerade.zahlen, times = gerade.zahlen) - 1

# oder (für großes n wie z. B. n > 100 minimal rechen-
# effizienter, da weniger Substraktionen nötig):
rep(gerade.zahlen - 1, times = gerade.zahlen)

 # Exkurs: Laufzeitvergleiche mit Hilfe der Funktion
 # microbenchmark des microbenchmark-Pakets. (Sollte
 # mehrmals gelaufen lassen werden, um auch einen
 # Eindruck vom Einfluss des aktuellen Zustands (!)
 # des Computers zu gewinnen.)
 n <- 101;     gerade.zahlen <- 2 * 1:n
 (res <- microbenchmark::microbenchmark(
   rep(gerade.zahlen, times = gerade.zahlen) - 1,
   rep(gerade.zahlen - 1, times = gerade.zahlen),
   times = 1000L))

 # Automatische grafische Darstellung der Verteilung der
 # beobachteten Laufzeiten:
 ggplot2::autoplot(res)
 # Exkurs Ende



### Folge 4 ----
# (-4,-4,-4,-4,-3,-3,-3,-2,-2,-1,0,1,2,2,3,3,3,4,4,4,4)

n <- 4;     rep(-n:n, times = c(n:1, 1, 1:n))



## b) Papierformate  ----
# "Startwerte" und Elementenamen auf Vorrat:
H0 <- 1189;     B0 <- 841;     Ax <- paste0("A", 0:8)

## Variante 1 ----
# Die Faktoren (1, 1, 1/2, 1/2, 1/4, 1/4, 1/8, 1/8, 1/16),
# die für das Paar (H0, B0) für die Höhen benötigt werden:
(Hoehenfaktoren <- 1/2^rep(0:4, each = 2, length.out = 9))
 
 # Memo: Die äußeren () dienen hier nur der Kontrolle.

# Die Faktoren (1, 1/2, 1/2, 1/4, 1/4, 1/8, 1/8, 1/16, 1/16),
# die für das Paar (B0, H0) für die Breiten benötigt werden,
# werden durch "Zurechtschneiden und -kleben" aus dem Vektor
# Hoehenfaktoren abgeleitet:
(Breitenfaktoren <- c(Hoehenfaktoren[-1],
                      tail(Hoehenfaktoren, 1)))

 #  # oder:
 # (Exponenten <- rep(0:4, each = 2))
 # (Hoehenfaktoren <- 1/2^head(Exponenten, -1))
 # (Breitenfaktoren <- 1/2^Exponenten[-1])

# Der Schönheit halber mit Elementenamen:
(Hoehenfaktoren <- setNames(Hoehenfaktoren, Ax))
(Breitenfaktoren <- setNames(Breitenfaktoren, Ax))

# Jetzt die eigentlichen Zielgrößen, die aus Multiplikation
# des "Startpaares" (H0, B0) bzw. (B0, H0) mit "seinen"
# Faktoren per unvollständiger zyklischer Replikation ent-
# stehen (wobei wir hier die Warnungen dreist ignorieren,
# was i. A. sehr gefährlich ist und wir nie tun sollten):
(Hoehen <- c(H0, B0) * Hoehenfaktoren)
(Breiten <- c(B0, H0) * Breitenfaktoren)
(Flaechen <- Hoehen * Breiten)



## Variante 2 ----
# Eine minimal zu lange "Vorrat"-Folge der Paare aus
# Starthöhe H0 und und -breite B0:
(H0B0 <- rep(c(H0, B0), times = 5))

# Die Exponenten für 2 für die etwas "zu vielen" Divi-
# soren (1, 1, 2, 2, 4, 4, 8, 8, 16, 16), die für das
# Paar (H0, B0) verwendet werden:
(Exponenten <- rep(0:4, each = 2))

# Die "vorläufigen" Höhen und Breiten, die durch Division
# der "Vorrat"-Folge durch die passenden 2er-Potenzen,
# alle Endergebnisse vorbereiten:
HB <- H0B0 / 2^Exponenten

# Jetzt die eigentlichen Zielgrößen (nun *ohne* Warnungen)
# durch "Zurechtschneiden" der "vorläufigen" Werte von
# eben, einschließlich der Vergabe von Elementenamen:
(Hoehen <- setNames(head(HB, -1), Ax))
(Breiten <- setNames(HB[-1], Ax))
(Flaechen <- Hoehen * Breiten)




# Aufgabe 2 ----
#***************

## a) F -> °C ----
Fahrenheit <- c(17, 32, 0, 104, -12)
(Celsius <- (Fahrenheit - 32) * 5/9)



## b) Wertetabelle ----

(x <- c(-2:0, 1/7, 1, seq(2, 20, by = 2)))

# oder:
(x <- c(-2:0, 1/7, 1, 2 * 1:10))

(Funktionswerte <- sqrt((3 * x^4 + 2 * x) /
                        (7 * x - 1)))

# oder (mit deutlicher Recheneffizienzsteigerung):
(Funktionswerte <- sqrt((3 * x * x * x * x + 2 * x) /
                        (7 * x - 1)))

 # Exkurs: Laufzeitvergleiche (ähnlich zum Exkurs zur
 # Folge 3 in A. 1a))
 x <- seq(-10, 10, length = 20)
 (res <- microbenchmark::microbenchmark(
   x^4, x*x*x*x, times = 1000L))
 ggplot2::autoplot(res)
 # Exkurs Ende




# "Aufräumen" ----
#************
rm(Ax, B0, Breiten, Breitenfaktoren, Celsius, Exponenten,
   Fahrenheit, Flaechen, Funktionswerte, gerade.zahlen,
   H0, H0B0, HB, Hoehen, Hoehenfaktoren, n, res, x)

# oder radikal:
rm(list = ls())
