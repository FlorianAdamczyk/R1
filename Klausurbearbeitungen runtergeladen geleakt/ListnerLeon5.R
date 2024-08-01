#Listner, Leon. 8108323
#Aufgabe 5

#a)
set.seed(50)
n <- rbinom(100, 100, 0.5)
#Festsetzung eines seeds, damit Zufallszahlen reproduzierbar sind.
#Erzeugung von 100 ni mithilfe der Binomialverteilung

set.seed(60)
A <- 10 + 2*log(n) + rnorm(100, 0, 0.25)
#Formel für A + Verwackelung durch normalverteilte Störung mithilfe von
#aus der Normalverteilung generierter Zufallszahlen

#b)
plot(n, 10+2*log(n), ylab = "a")

curve(10+2*log(x), from = 1, to = 100, ylab = "a", xlab = "n", add = TRUE)
plot(n, A, xlim = c(30, 70))
#Der Erwartungswert spiegelt als Kurve die faktischen Arbeitszeiten als 
#Glättungskurve gut wider.

