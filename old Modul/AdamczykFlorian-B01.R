## R1 FLorian Adamczyk Blatt 1 ##

rm(list = objects())
# zu löschen aller elemente, falls benötigt.

# 1 a)
plusminus <- rep(x = c(1, -1), length.out = 13)
# = 1 -1 1 -1 und das 13x

zahlanzahl <- rep(x = (2:12), times = (2:12))
# = 2 2 3 3 3 4 4 4 4 5 5 5 5 5 ... 12

zahlanzahlueberspringen <- rep(x = seq(1, 11, by = 2), times = seq(2, 12, by = 2))
# einfach wie vorher nur mit jeweils ne zahl ueberspringen

bouncyNumbers <- rep(x = -4:4, times = c(4:1, 1, 1:4))
# es hat ziemlich lange gedauert, bis ich auf das argument von times gekommen bin, am anc´fang hatte ich vergessen, dass es c() gibt.

# 1 b)
# Die rede war von OHNE JEGLICHE Schleifenkonzepte also komplett stupide runterschreiben...
H0 <- 1189
B0 <- 841

H1 <- B0
B1 <- H0 / 2

H2 <- H0 / 2
B2 <- B0 / 2

H3 <- B0 / 2
B3 <- H0 / 4

H4 <- H0 / 4
B4 <- B0 / 4

H5 <- B0 / 5
B5 <- H0 / 8

H6 <- H0 / 8
B6 <- B0 / 8

H7 <- B0 / 8
B7 <- H0 / 16

H8 <- H0 / 16
B8 <- B0 / 16

# ------------- #
### Flächen ###
# ------------- #

A0 <- H0 * B0
A1 <- H1 * B1
A2 <- H2 * B2
A3 <- H3 * B3
A4 <- H4 * B4
A5 <- H5 * B5
A6 <- H6 * B6
A7 <- H7 * B7
A8 <- H8 * B8

A8 # schauen ob ich alles überall verwendet hab (dann müsste hier eine Zahl Rauskommen - klappt!)

#### ----------------------------####
### okay ich habe nach fertigstellung der Aufgaben gemerkt, dass es doch leichter geht:
Höhe <- 1189
Breite <- 841

Höhe <- append(Höhe, c(841, 1189) / c(1, 2, 2, 4, 4, 8, 8, 16))
Breite <- append(Breite, c(1189, 841) / c(2, 2, 4, 4, 8, 8, 16, 16))

Fläche <- Höhe * Breite
Fläche # kommt dasselbe raus und ist schonmal detlich kürzer. Bin mir nicht sicher, ob es weniger denkarbeit war.


####### Aufgabe 2  #######

### Teil a) ###

T_data_Fahrenheit <- c(17, 32, 0, 104, -12)
T_data_Celsius <- (T_data_Fahrenheit - 32) * 5 / 9

T_data_Celsius # ich möchte sie anschauen --- hat geklappt!

### Teil b) ###

wanna_know <- c(-2:0, 1 / 7, 1, seq(2, 20, by = 2))
wanna_know
Matheausdruck <- sqrt((3 * wanna_know^4 + 2 * wanna_know) / (7 * wanna_know - 1))
Matheausdruck ## reicht das so als "Ausdrucken" als Tabelle???
print(Matheausdruck, digits = 2)
## Klar, weil da minuszahlen dabei sind, und wir die wurzel bilder, werden NaNs erzeugt.

##### Aufgabe 3 #####
# a)
pots <- 2^c(0:50)

# b)
quads <- (c(0:50))^2

# c)
which(pots == quads) # diese sind gleich
2^(which(pots == quads)) # das sind die gleichen Ergebnisse

## Aufgabe 4 ##
# a)
x <- seq(0, 2 * pi, by = 0.1)
sinuswerte <- sin(x)
cosinuswerte <- cos(x)
tangenswerte <- tan(x)

tangenswerte_alternativ <- sin(x) / cos(x)

# b)
length(which(tangenswerte_alternativ == tangenswerte))
### 41 sind "gleich" soweit das R sehen kann.

# c)
max(tangenswerte_alternativ - tangenswerte) # ist das wirklich so simpel oder habe
# ich hier ein "falsches" Maximum also nur ein lokales, wobei woanders das globale ist??
