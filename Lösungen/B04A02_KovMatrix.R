### Blatt 4, Aufgabe 2: Empirische Kovarianz- und Korrela-
### tionsmatrix eines multivariaten Datensatzes.
### R 4.3.3, 23.5.2024
###*******************************************************

# Beispieldaten ----
#*******************
# Die Daten von Blatt 2 als Beispielvektoren:
x <- c(0.61, 0.79, 0.83, 0.66, 0.94, 0.78, 0.81,
       0.60, 0.88, 0.90, 0.75, 0.86, 0.74, 0.84)
y <- c(1.01, 0.13, 1.73, 0.67, 0.56, 0.99, 0.49,
       0.72, 0.13, 0.48, 0.98, 0.08, 1.23, 0.87)
(M <- cbind(x, y))


# Die empirische Kovarianzmatrix ----
#************************************
# In der (n x p)-Matrix M sind p Vektoren der Dimension
# n als ihre p Spalten "nebeneinander geschrieben". Dann
# ist, wie man zeigen kann,
#
## (1) Cov(M) = 1/(n-1) * M' * (I - 1/n * J) * M, ----
#
# wobei das Apostroph (') transponieren bedeutet, I die
# (n x n)-Einheitsmatrix und J die (n x n)-Matrix ist,
# die nur Einsen enthält. (Siehe Tipp auf Übungsblatt.)
#*******************************************************

# "Entnimm" n der Matrix M:
n <- nrow(M)


## Implementation von Gl. (1) ----
#*********************************
# Die empirische Kovarianzmatrix gemäß Gl. (1):
# Memo: Das Matrixprodukt A' * B wird in R durch
# crossprod(A, B) effizienter realisiert als
# durch t(A) %*% B.

(CovM <- crossprod(M, diag(n) - matrix(1/n, n, n)) %*%
         M / (n - 1))


# Die empirische Korrelationsmatrix ----
#***************************************

# Für die empirische Korrelationsmatrix gilt:
#
## (2) Cor(M) = Diag(Cov(M))^(-1/2) * Cov(M) * ----
#               Diag(Cov(M))^(-1/2),
#
# wobei Diag(A) zu einer quadratischen Matrix A die Dia-
# gonalmatrix sei, die dieselbe Diagonale wie A hat, und
# B^(-1/2) für die Matrix B hier _elementweise_ interpre-
# tiert wird. (Beachte, dass in Gl. (2) die Bedeutung von
# Diag(.) eine andere ist als die der R-Funktion diag!)
#
# Andere Lösung: V sei der Vektor der Wurzeln der Diago-
# nalelemente von Cov(M). Dann gilt mit _elementweiser_
# Interpretation der Division "/", aber 'üblicher' In-
# terpretation der Vektormultiplikation "*":
#
## (3) Cor(M) = Cov(M) / (V * V') ----
#
# Beachte, dass in V * V' der Spalten(!)vektor V mit dem
# Zeilen(!)vektor V' multipliziert wird, d. h., es wird
# das "äußere Produkt" von V mit sich selbst berechnet,
# was eine Matrix(!) liefert.
#********************************************************

## Implementation von Gl. (3) ----
#*********************************
# Die empirische Korrelationsmatrix gemäß Gl. (3):

V <- sqrt(diag(CovM))

(CorM <- CovM / (V %o% V))



# Beispiel ----
#**************
# Anhand der "Old Faithful Geyser"-Daten:

M <- cbind(faithful$waiting, faithful$eruptions)
n <- nrow(M)
(CovM <- crossprod(M, diag(n) - matrix(1/n, n, n)) %*%
         M / (n - 1))

V <- sqrt(diag(CovM))
(CorM <- CovM / (V %o% V))


## Zur "Kontrolle" ----
#*********************
# Die Ergebnisse der in R eingebauten Funktionen:
cov(M);     cor(M)


# Aufräumen ----
#***************
rm(list = ls())
