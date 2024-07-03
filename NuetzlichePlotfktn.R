### R-Code (mit kleineren Ergänzungen) des Abschnittes 7.5 Einige (auch
### mathematisch) nützliche Plotfunktionen
### R 3.6.3, 9.6.2020
###***********************************************************************

curve(sin(x)/ x, from = -20, to = 20, n = 500, main = "curve(....)")
curve(abs(1/x), add = TRUE, col = "red", lty = 2)


x <- c(1:7, 6:1)                               # Koordinaten der Ecken.
y <- c(1, 10, 8, 5, 1, -1, 3:9)
plot(x, y, type = "n", main = "polygon(....)") # Erzeugt das (leere) KoSy.
polygon(x, y, col = "orange", border = "red")  # Der Polygonzug.
text(x, y)                               # Nur zur Beschriftung der Ecken.


x <- c(0, 1, 3, 9);     y <- c(1, -1, 2, 4, 3)
plot(stepfun(x, y), verticals = FALSE, main = "plot(stepfun(....), ....)")


set.seed(13)                                 # Für die Reproduzierbarkeit.
plot(ecdf(rnorm(12)), main = "plot(ecdf(....))") # Empirische Verteilungs-
         # funktion zu 12 standardnormalverteilten Pseudozufallsvariablen.


X <- 1:5;   Y <- c(3, -2, -1, -5, -5);   delta <- c(3.2, 2, 2.8, 1, 2.2)
library(Hmisc)
errbar(x = X, y = Y, yplus = Y + delta, yminus = Y - delta,
       main = "errbar(....)")
detach(package:Hmisc)


x <- seq(1, 10, length = 20)
B <- poly(x, 5)            # Gewisse Orthonormalpolynome bis zum Grad 5.
matplot(x, B, type = "l", main  = "matplot(....)", lwd  = 2) #, col = 1)
