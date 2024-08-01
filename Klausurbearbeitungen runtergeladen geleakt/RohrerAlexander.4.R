### Name: Alexander Rohrer
### Matrikelnummer: 8120463

### Aufgabe 4


#*******************************************************************************************
# 4 a)

a_i_j = 1/ (i+j-1)

#*******************************************************************************************
# 4 b)

bruch_nenner <- c(seq(1, 4),seq(2, 5), seq(3,6), seq(4,7))
matrix_mit_einsen <- matrix(1, nrow = 4, ncol = 4)
finale_matrix <- matrix_mit_einsen / bruch_nenner


#*******************************************************************************************
# 4 c)

n <- 4

matrix_allg <- 1 / (row(matrix(1, n, n)) + col(matrix(1, n, n)) - 1)
  
