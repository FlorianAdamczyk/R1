# R als übergroßer "Taschenrechner":
#***********************************

x <- 119 + 2

x

(x <- 170 + 2)





# Einige Besonderheiten der Code-Eingabe:
#****************************************

(kehrwert <- 1/x);    (wurzel <- sqrt(x))   # Ignorierter Kommentar.



sqrt(pi * x^2

)



ke   # + Tabulatortaste





# Zur Lesbarkeit von R-Code:
#***************************

## Furchtbar:

ifelse(x<z,W$Sub[v],A/(tau*(exp((omega-x)/(2*tau))+exp(-(omega-x)/(2*tau)))^2))


## Besser:

ifelse(x < z, W$Sub[v],
       A / (tau * (exp((omega - x) / (2*tau)) + 
                   exp(-(omega - x) / (2*tau))  )^2
           ) # Ende des Nenners von A / (....)
      ) # Ende von ifelse(....) 





# Objekte und Objekte löschen:
#****************************

objects()  # = ls()


rm(a, x, Otto, Werte.neu)


rm(list = objects())     # Radikale Variante: Loescht (fast) alles!





# A 2.2: numeric-Vektoren: Erzeugung & element. Opn. ----
#********************************************************

hoehe <- c(160, 140, 155)

eine.weitere.hoehe <- 175

c(hoehe, eine.weitere.hoehe)

(hoehe <- c(hoehe, eine.weitere.hoehe))

length(hoehe)



## § 2.2.1: Regelmäßige Zahlenfolgen mit seq & rep ----

seq(from = -2, to = 8, by = 1)  # by = 0.8

seq(from = -2, to = 8)


seq(from = 7, to = -1)

seq(from = -5, length = 12, by = 0.2)

seq(from = -5.5, to = 3.5, length = 12)

seq(to = -5, length = 12, by = 0.2)



seq(-2, 8)

seq(-2, 8, 0.8)



2:11

-1:10

-(1:10)

2:-8




rep(x = 1:3, times = 4)

rep(x = c(-7, 9), times = c(3, 5))

rep(x = -1:1, length.out = 11)

rep(x = c(-1, 1), each = 3)

rep(x = c(-1, 0), times = 3, each = 2)

rep(x = c(-1, 0), length.out = 13, each = 5)





# A 2.3: Arithmetik für numeric-Vektoren ----
#********************************************

hoehe <- c(160, 140, 155, 175)

breite <- c(25, 17, 34, 6);   breite * hoehe

breite * hoehe * c(2, 3) + 12



## Weitere Beispielvektoren: ----

x <- c(-0.3691, 0.3537, -1.0119, -2.6563, NA, 11.3351)
y <- c(4, 1, 4, 8, 5, 3);    z <- c(2, 3)


## § 2.3.1: Elementw. Vektor-Opn. ----

y + z # etc.

pmax(x, y) # etc.

ceiling(x) # etc.



## § 2.3.2: Zus.-fassende & spez. Opn. ----

sum(y) # etc.

cumsum(y) # etc.

diff(y)



## § 2.3.3: "Summary statistics" ----

max(x) # etc.

quantile(x)

summary(x)

var(x) # etc.





# A 2.4: logical-Vektoren & log. Opn. ----
#*****************************************

x <- c(160, 145, 195, 173, 181);    x > 175

(a <- c(T, T, F, F));    (b <- c(T, FALSE, TRUE, F))


## § 2.4.1: Elementw. log Opn. ----

x < 190 # etc.


### Beachte:

a * 2

(x > 175) * 1

sum(x <= 190)


(0.2 - 0.1) == 0.1

(0.3 - 0.2) == 0.1


## § 2.4.2: Zus.-fassende log Opn. ----

min(x - 150) > 0 && max(log(x - 150)) < 1




y <- c(1, 5, 1, 9, 5)

duplicated(y)
  
  



# A 2.5: character-Vektoren & element. Opn. ----
#***********************************************

(namen <- c("Peter", "Paul", "Mary"))

weitere.namen <- c('Tic', 'Tac', 'Toe')

(alle.namen <- c(namen, weitere.namen))


c(1.3, namen, TRUE, F) 



## § 2.5.1: Zus.-setzen von Zeichenketten ----

paste("Peter", "ist", "doof!")

paste("Tic", "Tac", "Toe", sep = ",")

paste("Hoehe", hoehe, sep = "=")

paste("Data", 1:4, ".txt", sep = "")

paste(c("x", "y"), rep(1:5, each = 2), sep = "")


## § 2.5.2: Benennung von Vektorelementen ----

alter <- c(12, 14, 13, 21, 19, 23)

names(alter) <- alle.namen
alter


c(Volumen = 3.21, Masse = 15.8)



object.size(alter)

unname(alter)
object.size(unname(alter))





# A 2.6: Indizierung & Modifikation von Vektorelementen ----
#***********************************************************

## § 2.6.1: Indexvektoren ----

### Indexvektor aus positiven Integers

alter[5]

alter[c(4:2, 13)]

c("Sie liebt mich.", "Sie liebt mich nicht.")[c(1,1,2,1,1,2)]



### Indexvektor aus negativen Integers

alle.namen[-(1:3)]

alter[-length(alter)]



### Logischer Indexvektor

alter[c(TRUE, TRUE, FALSE, FALSE, TRUE)]

x[x > 180]

alle.namen[alter >= 21]

alle.namen[alter >= 14 & alter < 18]

letters[c(FALSE, FALSE, TRUE)]



### Indexvektor aus Zeichenketten

alter["Tic"]

alter[c("Peter", "Paul", "Mary", "Heini")]

alter[weitere.namen]



## § 2.6.2: Spez Indizierungsfktn. ----

head(alter, n = 2)

tail(alter, n = 1)


head(alter, n = -2)

tail(alter, n = -1)



## § 2.6.3: Indizierte Zuweisungen ----

x;    x[3] <- 188;   x

x[x > 180] <- c(-1, -2, -3)

x


(Farben <- c("rot", "gruen", "blau")[c(1, 1, 2, 1, 3, 3, 1, 2, 2)])

Farben[Farben == "rot"] <- "rosa";    Farben


### Beachte:

x[ ] <- 99;   x

x <- 2;   x


### Frage:

x[x < 0] <- -x[x < 0]





# A 2.7: Faktoren und geordnete Faktoren ----
#***********************************************************

###  Beispielvektoren:

alter <- c(35, 39, 53, 14, 26, 68, 40, 56, 68, 52, 19, 23, 27, 67, 43)
geschlecht <- c("m", "m", "w", "w", "m", "w", "w", "m", "m", "w", "m",
                "m", "w", "w", "w")
blutgruppe <- c("A", "B", "B", "0", "A", "AB", "0", "AB", "B", "AB",
                "A", "A", "AB", "0", "B")
gewicht <- c(82, 78, 57, 43, 65, 66, 55, 58, 91, 72, 82, 83, 56, 51, 61)
groesse <- c(181, 179, 153, 132, 166, 155, 168, 158, 188, 176, 189,
             179, 167, 158, 174)
rauchend <- c("L", "G", "X", "S", "G", "G", "X", "L", "S", "X", "X",
              "L", "X", "X", "S")


## § 2.7.1: Erzeugung von Faktoren & Levelabfrage ----

(ge <- factor(geschlecht))

(blut <- factor(blutgruppe))

levels(ge)

levels(blut)


blut2 <- factor(blutgruppe, levels= c("A", "B", "AB", "0"))

(ge2 <- factor(geschlecht,
               levels= c("m", "w"),
               labels= c("Mann", "Frau")))



## § 2.7.2: Levels: Ändern der Sortierung, zus.-fassen, löschen  ----

(blut <- factor(blut, levels = c("A", "B", "AB", "0")))

relevel(blut, ref = "0")

# reorder(....) # S. Hilfeseite!


levels(blut2) <- c("non0", "non0", "non0", "0")
blut2


blut[1:5]  # = head(blut, 5)

droplevels(blut[1:5])

blut[1:5, drop = TRUE]   # Zu droplevels ähnlicher Effekt.



## § 2.7.3: Erzeugung von geordneten Faktoren ----

(rauch <- ordered(rauchend, levels = c("X", "G", "L", "S")))

(rauch <- ordered(rauchend))


(rauch2 <- ordered(rauchend,
                   levels = c("X", "G", "L", "S"),
                   labels= c("NR", "gel.", "leicht", "stark")))



## § 2.7.4: Levels: Ändern der Sortierung, zus.-fassen, löschen  ----

(rauch <- ordered(rauch, levels = c("S", "L", "G", "X")))

levels(rauch2) <- c("NR", "R", "R", "R")
rauch2


tail(rauch, 7)
droplevels(tail(rauch, 7))



### Technisches:

mode(blut)
class(blut)
attributes(blut)

mode(rauch)
class(rauch)
attributes(rauch)



## § 2.7.5: Klassierung numerischer Werte und Erzeugung geordneter ----

(AKlasse <- cut(alter, breaks = c(0, 25, 45, 60, Inf)))
                # labels = c("Young", "Mid", "Best", "Silver")

(AKlasse <- ordered(AKlasse))



## § 2.7.6: Tabellierung von Faktoren und Faktorkombinationen ----

table(AKlasse)

table(ge, AKlasse)

table(AKlasse, ge, rauch)



## § 2.7.7: Faktorengruppiertes Aufteilen & Funktionen Anwenden ---

split(gewicht, AKlasse)

split(gewicht, list(ge, AKlasse))


tapply(gewicht, AKlasse, mean)

tapply(gewicht, AKlasse, sd)

tapply(gewicht, list(ge, AKlasse),  mean)


ave(gewicht, AKlasse)
ave(gewicht, ge, AKlasse)



### Warnung:

as.vector(faktorvektor)
as.numeric(faktorvektor)
as.numeric(levels(faktorvektor)[faktorvektor])


u <- c(1, -7, 4, NA)
(uf <- factor(u))
c(uf)
as.vector(uf)
as.numeric(uf)
as.numeric(levels(uf))[uf]


v <- c(1.3, -7.5, 4.8, NA)
(vf <- factor(v))
c(vf)
as.vector(vf)
as.numeric(vf)
as.numeric(levels(vf))[vf]


w <- c("1.3", "-7", "a", NA)
(wf <- factor(w))
c(wf)
as.vector(wf)
as.numeric(wf)
as.numeric(levels(wf))[wf]





# A 2.8: Matrizen  ----
#**********************

## § 2.8.1: Erzeugung von Matrizen ----

###  Beispielobjekte:

z <- c(130, 26, 110, 24, 118, 25, 112, 25)
(Werte <- matrix(z, nrow = 4))


matrix(z, nrow = 3)


matrix(z, ncol = 4)

matrix(z, nrow = 4, ncol = 5)

(Werte <- matrix(z, ncol = 2, byrow = TRUE))



## § 2.8.2: Erzeugung von Matrizen ----

dimnames(Werte) <- list(c("Alice", "Bob", "Carol", "Deborah"),
                        c("Gewicht", "Alter"))
Werte


(Werte <- matrix(z, ncol = 2, byrow = TRUE,
                 dimnames = list(c("Alice", "Bob", "Carol", "Deborah"),
                                 c("Gewicht", "Alter"))))


dimnames(Werte)

dimnames(Werte) <- list(NULL, c("Gewicht", "Alter"))
Werte


colnames(Werte)

rownames(Werte) <- c("A", "B", "C", "D")


unname(Werte)


## § 2.8.3: Erweiterung um Spalten oder Zeilen ----

groesse <- c(140, 155, 142, 175)

(Werte <- cbind(Werte, groesse))


(Werte <- rbind(Werte, E = c(128, 26, 170)))



## § 2.8.4: Matrixdimensionen & Elementeindizierung ----

dim(Werte)
nrow(Werte)
ncol(Werte)


Werte[3,2]
Werte[2,]
Werte[,1]


Werte[c(1,2), 2]
Werte[, c(1,3)]
Werte[-2, -3]


Werte[c(F,F,T,F,F),]
Werte[c(T,T,F,F,F), c(T,F,T)]
Werte[c(F,T), c(T,F,T)]


Werte[1, "Gewicht"]
Werte[, c("Gewicht", "Alter")]
Werte[Werte[, "groesse"] > 160, "Gewicht"]


head(Werte, n= 2)
tail(Werte, n= 2)



## § 2.8.6: Indizierte Element-, Spalten-, Zeilenzuweisung ----

# Werte[i,j] <- v1
# Werte[,j] <- v2
# Werte[i,] <- v3



## § 2.8.7: Spezielle Matrizen ----

(y <- diag(1:3))
diag(y)


col(y)
row(y)


lower.tri(y)
upper.tri(y, diag = TRUE)



## § 2.8.8: Einige Operationen der Matrixalgebra ----

(A <- matrix(1:12, ncol = 4))
(B <- matrix(-(12:1), ncol = 4))

A + B
A - B
A * B
A / B
A^B
A %/% B
A %% B

t(A)
A %*% B
crossprod(A, B) # = t(A) %*% B  # = A' B (mathematisch)

# crossprod(A, A) = crossprod(A)
# tcrossprod(A, B) = A %*% t(B)  # = A B' (mathematisch)


outer(A, B) # = A %o% B

solve(A, B)  # = A^(-1) B (mathematisch)
solve(A)     # = A^(-1) (mathematisch)


# chol(A)
# eigen(A)
# kappa(A)
# qr(A)
# svd(A)



## § 2.8.8: Effiziente Zeilen-/Spaltensummen oder -mittelwerte ----

colSums(A)
rowSums(A)
colMeans(A)
rowMeans(A)


# rowsum(x, g)



## § 2.8.9: Zeilen-/Spaltenweise Operationsanwendung ----

apply(Werte, 2, mean)
apply(Werte, 2, sd)

apply(Werte, 2, sort)

t(apply(Werte, 1, sort))


sweep(Werte, 2, c(10, 20, 30))



## § 2.8.10: Kovarianz/Korrelation zwischen Spalten ----

cov(Werte)   # = var(Werte)

cor(Werte)
  


## § 2.8.11: Spezielle Matrizen mit outer ----

outer(1:3, 1:5)

outer(1:3, 1:5, FUN = "+")

outer(1:3, 1:5, paste, sep = ":")


x <- c(-1, 0, -2)     # , 1)
y <- c(-1, 2, 3, -2, 0)
1 * (outer(x, y, FUN = "<="))
