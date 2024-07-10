### Blatt 8, Aufgabe 3: Theoretische Quantile am Beispiel
### einer t-Verteilung und empirische Quantile.
### R 4.3.3, 4.7.2024
###****************************************************

# a) (Theoret.) t_4-Quantile ----
#********************************
# F sei die Verteilungsfunktion der t_4-Verteilung.
# Gesucht ist F^{-1}(p) für p in {0.001, 0.005, 0.01,
# 0.025, 0.05, 0.25, 0.5, 0.75, 0.95, 0.975, 0.99,
# 0.995, 0.999}. Lösung:
p <- c(0.001, 0.005, 0.01, 0.025, 0.05, 0.25)
p <- c(p, 0.5, rev(1 - p))

Quantile <- qt(p = p, df = 4)
names(Quantile) <- paste(as.character(p * 100), "%")



# b) (Empir.) Mieten-Quantile ----
#*********************************
# Entsprechende empirische Quantile der Mietdaten
# in "MietenFrankfurt":
x <- scan(file = "MietenFrankfurt")

quantile(x, prob = p)


# Aufräumen ----
#***************
rm(list = ls())
