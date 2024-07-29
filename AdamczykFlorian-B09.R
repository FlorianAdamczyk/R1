# Florian Adamczyk R Aufgabenblatt 9
# Aufgabe 1

fibonacci <- function(n) {
  fib <- c(0, 1)  # Initialisiere die Fibonacci-Sequenz mit den ersten zwei Zahlen
  if (n <= 2) {
    return(fib[1:n])  # Gib die ersten n Fibonacci-Zahlen zurück
  } else {
    for (i in 3:n) {
      fib[i] <- fib[i-1] + fib[i-2]  # Berechne die nächste Fibonacci-Zahl
    }
    return(fib)  # Gib die gesamte Fibonacci-Sequenz zurück
  }
}

print(fibonacci((16)))

recursive_fibonacci <- function(n) {
  if (n <= 0) {
    return(NULL)  # Basisfall: Gib NULL für ungültige Eingabe zurück
  } else if (n == 1) {
    return(0)  # Basisfall: Gib 0 für n = 1 zurück
  } else if (n == 2) {
    return(1)  # Basisfall: Gib 1 für n = 2 zurück
  } else {
    return(recursive_fibonacci(n-1) + recursive_fibonacci(n-2))  # Rekursiver Fall: Summe der zwei vorherigen Fibonacci-Zahlen
  }
}

fib_list <- c()

for (i in 1:16) {
  result <- recursive_fibonacci(i)
  fib_list <- c(fib_list, result)
}
print(fib_list)

# die ausgaben sind gleich.

# Aufgabe 2

qqnorm.sim <- function(x) {
  par(mfrow = c(3, 4))  # Setze den Plotrahmen auf 3x4
  
  # Erster Plotrahmen: Normal-Q-Q-Plot für x
  qqnorm(x, main = "Normal-Q-Q-Plot für x")
  qqline(x, col = "red")  # Soll-Linie
  
  # Restliche Plotrahmen: Normal-Q-Q-Plots für simulierte Daten
  for (i in 2:12) {
    simulated_data <- rnorm(length(x))  # Erzeuge simulierte Daten
    qqnorm(simulated_data, main = paste("Simulierter Plot", i-1))
    qqline(simulated_data, col = "red")  # Soll-Linie
  }
  
  par(mfrow = c(1, 1))  # Setze den Plotrahmen zurück auf Standard
}

# Test der Funktion mit einem Beispielvektor
x <- rnorm(100)  # Erzeuge normalverteilte Daten
qqnorm.sim(x)  # Erzeuge die Q-Q-Plots

# Mietdaten:
MietenFrankfurt <- scan("MietenFrankfurt")
MietenFrankfurt

qqnorm.sim(MietenFrankfurt)
# nicht ganz normalverteilt aber ziemlich gut.

# Aufgabe 3:

# PDF-Datei öffnen
pdf("EuStockMarkets.pdf")

# Kursverläufe plotten
matplot(EuStockMarkets, type = "l", col = c("blue", "green", "red", "purple"), lty = 1, lwd = 2,
        main = "Kursverläufe der Europäischen Börsenindizes", xlab = "Zeit", ylab = "Indexwert")
legend("topright", legend = c("DAX", "SMI", "CAC", "FTSE"), col = c("blue", "green", "red", "purple"), lty = 1, lwd = 2)

# PDF-Datei schließen
dev.off()

# ========= Aufgabe 4: ==========
# PDF-Datei für Dichtefunktionen öffnen
pdf("Weibull_Dichte.pdf")

# Wertebereich für die Plots
x <- seq(0, 3, length.out = 100)

# Dichtefunktionen plotten
plot(x, dweibull(x, shape = 1, scale = 1), type = "l", col = "blue", lwd = 2, 
     main = "Dichtefunktionen der Weibull-Verteilung", xlab = "x", ylab = "Dichte")
lines(x, dweibull(x, shape = 2, scale = 1), col = "red", lwd = 2, lty = 2)
lines(x, dweibull(x, shape = 3, scale = 1), col = "green", lwd = 2, lty = 3)

# Legende hinzufügen
legend("topright", legend = c("shape=1, scale=1", "shape=2, scale=1", "shape=3, scale=1"), 
       col = c("blue", "red", "green"), lty = 1:3, lwd = 2)

# PDF-Datei schließen
dev.off()


# PDF-Datei für Verteilungsfunktionen öffnen
pdf("Weibull_Verteilungsfunktion.pdf")

# Verteilungsfunktionen plotten
plot(x, pweibull(x, shape = 1, scale = 1), type = "l", col = "blue", lwd = 2, 
     main = "Verteilungsfunktionen der Weibull-Verteilung", xlab = "x", ylab = "Wahrscheinlichkeit")
lines(x, pweibull(x, shape = 2, scale = 1), col = "red", lwd = 2, lty = 2)
lines(x, pweibull(x, shape = 3, scale = 1), col = "green", lwd = 2, lty = 3)

# Legende hinzufügen
legend("bottomright", legend = c("shape=1, scale=1", "shape=2, scale=1", "shape=3, scale=1"), 
       col = c("blue", "red", "green"), lty = 1:3, lwd = 2)

# PDF-Datei schließen
dev.off()