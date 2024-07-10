### Blatt 8, Aufgabe 2: Wahrscheinlichkeiten in
### weiteren, speziellen Situationen.
### R 4.4.3.3, 4.7.2024
###**************************************************

# a) Münzwurf ----
#*****************
# Modellierung: X_i sei der Indikator für "Kopf"
# beim i-ten Münzwurf, d. h. X_i = 1, falls "Kopf"
# bei ihm kommt, X_i = 0 sonst. Dann sind (gemäß
# Annahmen) X_1, ..., X_20 unabhängig und identisch
# Bernoulli(2/3)-verteilt, sodass für die Anzahl
# der Kopf-Würfe S := X_1 + ... + X_20 gilt: S ist
# Binomial(20, 2/3)-verteilt.
#
# Gesucht ist also P(S = 10). Lösung:
dbinom(x = 10, size = 20, prob = 2/3)



# b) Sicherungen ----
#********************
# Modellierung: Der Indikator X_i zeige durch
# X_i = 1 zeige den Defekt von Sicherung i = 1,
# ..., 4 (= k) an, wobei **ohne Zurücklegen** aus
# der Grundgesamt von N = 250 Sicherungen mit
# N * p = 250 * 0.06 = 15 (= m) defekten und ent-
# sprechend N - N * p = 235 (= n) intakten gezogen
# wird. Dann ist die Anzahl S := X_1 + ... + X_k
# der gezogenen defekten Sicherungen hypergeome-
# trisch verteilt zu den Parametern m, n und k.
#
# Gesucht sind also P(S = i) für i = 0, 1, 2, 3, 4.
# Lösung:
dhyper(x = 0:4, m = 15, n = 235, k = 4)

  # Zum Vergleich: 4-faches Ziehen **mit Zurück-
  # legen** aus Grundgesamtheit mit 6 % defekten
  # Sicherungen:
  #*********************************************
  dbinom(x = 0:4, size = 4, prob = 0.06)



# c) Roulette ----
#*****************
# Modellierung: X_i zeige die Farbe "rot" im i-ten
# Roulette-Spiel an, d. h. X_i = 1, falls "rot" in
# ihm kommt, X_i = 0 sonst, wobei i = 1, 2, ...
# (unbegrenzt). Dabei werden X_1, X_2, ... unab-
# hängig und identisch Bernoulli(p)-verteilt ange-
# nommen mit p = 18/37. Es sei S die Anzahl der
# Spiele *vor* dem erstmaligen Auftreten von "rot"
# (also die Anzahl der Spiele, in denen "nicht rot"
# kommt, bevor erstmals "rot" auftritt). Dann ist
# S geometrisch verteilt zum Parameter p mit
# P(S = k) = P(X_1 = 0, ..., X_k = 0, X_{k+1} = 1)
# = P(X_1 = 0) * ... * P(X_k = 0) * P(X_{k+1} = 1)
# = (1-p)^k * p. (Glgtl. auch minimal anders defi-
# niert.)
#
# Gesucht ist hier
# P('Frühestens nach 5 Spielen "rot"')
# = P('Frühestens im 6. Spiel zum 1. Mal "rot"')
# = P('Im 6. oder im 7. oder im 8. oder ... Spiel
#       zum 1. Mal "rot"')
# = P(S >= 5) = P(S > 4) = 1 - P(S <= 4).
# Lösung:
1 - pgeom(q = 4, prob = 18/37)

 # Oder:
 pgeom(q = 4, prob = 18/37, lower.tail = FALSE)



# d) Notaufnahme ----
#********************
# Modellierung: X_i sei der Indikator für Person i
# in einer sehr bis unendlich großen Population
# zwischen 18 und 19 Uhr in die Notaufnahme als
# Patient zu kommen, d. h. X_i = 1, falls Person i
# kommt, X_i = 0 sonst, wobei die Wahrscheinlich-
# keit des genannten Ereignisses für jede einzelne
# Person sehr klein ist. Daher kommt für die Anzahl
# X an Personen, die als Patient *unabhängig von-
# einander* in die Notaufnahme kommen, die Poisson-
# Verteilung in Betracht.
# Hier speziell (gemäß Aufgabe) X ~ Poisson(6.9),
# da der Erwartungswert für X zu lambda = 6.9 er-
# mittelt wurde.
#
# Gesucht ist also P(X > 9) = 1 - P(X <= 9).
# Lösung:
1 - ppois(q = 9, lambda = 6.9)

 # Oder:
 ppois(q = 9, lambda = 6.9, lower.tail = FALSE)



# e) Diagnoseverfahren ----
#**************************  
# Modellierung: X_i sei der Indikator für die
# Unverträglichkeitsreaktion bei Patient i, d. h.
# X_i = 1, falls die U.-reaktion bei ihm auftritt
# und X_i = 0 sonst. Dann sind (gemäß Annahmen)
# X_1, ..., X_25 u. i. v. ~ Bernoulli(0.1), sodass
# für die Anzahl der U.-reaktionen S := X_1 + ...
# + X_25 gilt: S ~ Bin(25, 0.1).
#
# Da "mindestens so gut" hier dasselbe bedeutet
# wie "höchstens eine U.-reaktion", ist P(S <= 1)
# gesucht. Lösung:
pbinom(q = 1, size = 25, prob = 0.1)

# Erscheint es plausibel, dass das neue Verfahren
# besser ist als das etablierte? Fazit?
   


# f) Lebensdauern ----
#*********************
# Modellierung: X, Y, Z seien die Lebensdauern,
# für die X, Y, Z u. i. v. ~ Exp(1/2) angenommen
# wird. Gesucht ist P(max(X, Y, Z) < 1)
# = P(X < 1, Y < 1, Z < 1)
# = P(X < 1) * P(Y < 1) * P(Z < 1)  (aufgrund der
#                          Unabhängigkeitsannahme)
# = P(X < 1)^3   (da X, Y, Z identisch verteilt)
# = P(X <= 1)^3  (da X stetig verteilt).
# Lösung:
pexp(q = 1, rate = 1/2)^3



# Aufräumen ----
#***************
rm(list = ls())
