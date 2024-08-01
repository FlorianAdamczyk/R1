### Name: Alexander Rohrer
### Matrikelnummer: 8120463

### Aufgabe 5


#*******************************************************************************************
# 5 a)
set.seed(42)

k <- 30

# Samples
ni <- sample(1:100, k, replace = TRUE)

# Arbeitszeit ohne Störungen
wahre_arb <- 10 + 2 * log(ni)

# Bestimme die Störungen 
epsilon <- rnorm(k, mean = 0, sd = sqrt(1/2))

# Berechne die beobachteten Arbeitszeiten 
beobachtete_arb <- wahre_arb + epsilon

# Ausgabe der Werte als dataframe um einen Überblick zu haben
arb_data <- data.frame(wahre_arb, beobachtete_arb)

#*******************************************************************************************
# 5 b)

# Sequenz von n-Werten für die Kurve (für reelle n ≥ 1)
n_seq <- seq(1, 100, length.out = 500)
a_n <- 10 + 2 * log(n_seq)

# Erstelle einen Dataframe für die Kurve
kurvendaten <- data.frame(n = n_seq, a_n)

# Plotten der Beziehung
ggplot() +
  geom_line(data = kurvendaten, aes(x = n, y = a_n), color = "blue") +
  geom_point(data = arb_data, aes(x = ni, y = beobachtete_arb), color = "red") +
  labs(title = "Beziehung zwischen Arbeitszeit a(n) und beobachteten Arbeitszeiten A_i",
       x = "n_i",
       y = "Arbeitszeit")










