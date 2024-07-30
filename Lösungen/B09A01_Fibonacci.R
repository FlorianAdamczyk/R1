### Blatt 9, Aufgabe 1: Implementationen einer Funk-
###  tion zur Berechnung von Fibonacci-Zahlen.
### R 4.3.4.3.3, 11.7.2024
###***************************************************

# Die Fibonacci-Zahlen ----
#**************************
# Eine mögliche Implementation einschließlich der
# Überprüfung der Eingabe des/der Benutzer/in und
# nötigenfalls Ausgabe einer Fehlermeldung oder
# Korrektur einer unzulässigen Eingabe (falls
# möglich):

fibonacci <- function(n) {
  # Zur Integer (also ganzen Zahl) n >= 0 wird die
  # Folge der ersten n + 1 Fibonacci-Zahlen f_0,
  # f_1, ..., f_n berechnet gemäß der Definition:
  #  f_0 := 0,
  #  f_1 := 1 und
  #  f_i := f_{i-1} + f_{i-2} fuer i = 2, 3, ...

  # Kontrolle, ob (im Rahmen der Maschinengenauig-
  # keit) eine Integer eingegeben wurde. Wenn nein,
  # Ausgabe einer Warnung und Rundung auf nächst-
  # gelegene Integer:
 if(abs(n - round(n)) > .Machine$double.eps^0.5) {
  warning("Argument ", n, " wurde zur ganzen Zahl ",
          round(n), " gerundet!")
  n <- round(n)
  }

  # Ab hier ist n eine Integer, also ganze Zahl.

  # Kontrolle, ob negative Zahl eingegeben wurde.
  # Wenn ja, Stop mit Fehlermeldung. Wenn nein,
  # Kontrolle, ob 0 oder 1 eingegeben wurde. Wenn
  # ja, Ende mit Rückgabe der ersten oder der ersten
  # beiden Fibonacci-Zahl(en):
 if(n < 0) {
   stop("Argument darf nicht negativ sein!")
  } else if(n <= 1) {
  return(c(0, 1)[0:n + 1])  # Trickreich in Indizie-
              # rung eingebaute "Fallunterscheidung".
  }

  # Ab hier ist n >= 2.

 fz <- integer(n + 1)  # Resultatvektor-Vorbereitung.
 fz[2] <- 1  # Damit ist fz = (0, 1, 0, ..., 0) mit
             # n + 1 >= 3 Elementen.

 for(j in 3:(n+1)) {  # f_i für i = 2, ... , n.
  fz[j] <- fz[j-1] + fz[j-2]
  }

 return(fz)
 }


# Funktionstests ----
#********************
# Deren Ergebnisse kann man noch "von Hand" überprüfen:
fibonacci(0)
fibonacci(1)
fibonacci(2)
fibonacci(3)
fibonacci(4)
fibonacci(5)

# Tests fehlerhafter Eingaben ----
#*********************************
# Tests des Abfangs fehlerhafter Eingaben:
fibonacci(-1)
fibonacci(-12.7)

# Tests der automatischen Korrektur fehlerhafter
# Eingaben:
fibonacci(2.2)
fibonacci(2.5)
fibonacci(3.5)


# Bis wohin kommen wir?
fibonacci(50)

# Warnung: Bis n = 106 ist *hier* ein exakter
# *Ausdruck* als ganze Zahl möglich, *ein exaktes
# ganzzahliges Rechnen ist schon bei viel kleineren
# Zahlen nicht mehr möglich*!
# Vergleichen Sie z. B.
# print(fibonacci(106), digits = 22) 
# mit dem Ergebnis von
# print(fibonacci(106) - 1, digits = 22)
# ab dem 80. Element des ausgegebenen Vektors.

# Und hier reißen wir die Obergrenze der überhaupt
# darstellbaren Zahlen:
tail(FZ <- fibonacci(1480))


# Fazit ----
#***********
# Die numerischen Eigenschaften eines Rechners sollte
# man selbst bei einfachsten Rechenoperationen (hier
# nur fortgesetzte Additionen) nicht aus dem Blick
# verlieren. Siehe hierzu nötigenfalls die Hilfeseite
# zum Objekt .Machine.


# Aufräumen ----
#***************
rm(list = ls())
