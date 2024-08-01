# Adamczyk Florian 8105234

# Aufgabe 4
# 4x4 Matrix mit komischen Brüchen

# a)
# Ermitteln Sie – ohne R! – die (sehr einfache) Formel, mit der die Elemente Hi,j obiger Matrix in Abh¨angigkeit ihrer Zeilen- und Spaltenindices i bzw. j berechnet werden!

# H_{i,j} = \frac{1}{i+j-1}
# nehme an i und j beginnen beide bei 1 und zählen bis 4. Ich nummeriere die Zeilen und spalten also beginnend mit 1.

# b)
# Verwenden Sie lediglich die Funktionen matrix, seq (bzw. ”:“), rep, col und/oder row sowie elementare Arithmetik, um die obige (4 × 4)-Matrix mit R zu reproduzieren (ohne dass Sie diese Matrix ”einfach eintippen“)!

# erstelle eine 4x4 Matrix mit 0en
matrix <- matrix(0, nrow = 4, ncol = 4)
matrix # wollte nachschauen ob das so geklapt hat
# fülle die Matrix mit den Werten
matrix[1:4,1:4] <- 1/(row(matrix) + col(matrix) - 1)
matrix
1/7
1/3
1/6

# joa sollte so passen! ;)

# c)
# Verallgemeinern Sie nun Ihren Programmcode zu einer Funktion mit einem Argument n, die zu diesem n die entsprechende (n × n)-Matrix erzeugt!

createStrangeMatrix <- function(n) {
  # erstelle eine nxn Matrix mit 0en
  matrix <- matrix(0, nrow = n, ncol = n)
  # fülle die Matrix mit den Werten
  matrix[1:n,1:n] <- 1/(row(matrix) + col(matrix) - 1)
  return(matrix)
}

# teste die Funktion
createStrangeMatrix(4)
createStrangeMatrix(7)
1/13

# sollte auch passen!
