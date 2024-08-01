# Adamczyk Florian 8105234

# Aufgabe 5
k <- 30


# a) 
# erzeuge k Zufallszahlen zwischen 1 und 100

n_i <- sample(1:100, k)
n_i

# erzeuge e_i als unabhängige und identisch normalverteilte Zufallsvariable mit Erwartungswert μ = 0 und Varianz σ^2 = 1/2

e_i <- rnorm(k, mean = 0, sd = sqrt(1/2))
e_i

# berechne A_i (Arbeitszeit) für jeden Versuchsablauf
A_i <- 10 + 2*log(n_i) + e_i
A_i

# b)

# erzeuge diagramm mit A_i auf der y-Achse und n_i auf der x-Achse 

plot(n_i, A_i, xlab = "n_i", ylab = "A_i", main = "Arbeitsaufwand in Abhängigkeit von der Stückzahl")

# füge die funktion A(n) = 10 + 2*log(n) für reelwertige n>=1 hinzu:

n <- seq(1, 100, length.out = 1000)
A <- 10 + 2*log(n)
lines(n, A, col = "red")


