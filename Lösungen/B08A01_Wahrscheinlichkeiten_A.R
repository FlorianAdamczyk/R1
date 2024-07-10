### Blatt 8, Aufgabe 1: Wahrscheinlichkeiten in
### speziellen Verteilungen.
### R 4.3.3, 4.7.2024
###********************************************

# a) P(X <= 112) ----
#********************
# Dabei sei X ~ N(\mu = 105, \sigma^2 = 25).
pnorm(q = 112, mean = 105, sd = sqrt(25))


# b) P(|X| <= 2.1) ----
#**********************
# Dabei sei X ~ t_7.
# Memo: Für jede Zufallsvariable gilt
# (für a > 0):
# P(|X| \le a) = P(-a \le X \le a)
# = P(X \le a) - P(X < -a)
# = P(X \le a) - P(X \le -a) wg. der Stetigkeit
#                         der Verteilung von X.
# Also:
pt(q = 2.1, df = 7) - pt(q = -2.1, df = 7)

# Des Weiteren ist:  P(X \le a) - P(X \le -a)
# = P(X \le a) - (1 - P(X \le a)) wg. der Sym-
#          metrie der Verteilung von $X$ um 0.
# = 2 * P(X \le a) - 1.
# Also geht auch:
2 * pt(q = 2.1, df = 7) - 1


# c) P(U < -1.8) ----
#********************
# Dabei sei U ~ U(-2, 2).
#
# Memo: Aufgrund der Stetigkeit der Verteilung
# von U ist P(U < x) = P(U \le x).
# Also geht:
punif(q = -1.8, min = -2, max = 2)


# d) P(X > 6.3) ----
#*******************
# Dabei sei X ~ F_{7, 5}.
pf(q = 6.3, df1 = 7, df2 = 5, lower.tail = FALSE)

# Memo: Für jede Zufallsvariable gilt
# P(X > x) = 1 - P(X \le x).
# Also geht auch:
1 - pf(q = 6.3, df1 = 7, df2 = 5)


# Aufräumen ----
#***************
rm(list = ls())
