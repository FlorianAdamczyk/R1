### ~/VorlesungenUndPraktika/RZyklen/SkriptenEtc/Z_2024So_bis_2024Wi_R1bisR2/
###  Uebungen/Loesungen/B08A04_Signum.R
### Blatt 8, Aufgabe 4: Diverse Implementationen der 
### Signumsfunktion
### R 4.3.3, 4.7.2024 (28.1.2005 / 3.2.2006 / 29.1.2007 /
###  27.6.2008 / 14.7.2009 / 15.7.2010 / 21.6.201 /
###  27.6.2012 / 16.7.2013 / 6.11.2014 / 6.7.2015 /
###  7.7.2016 / 5.10.2017 / 29.6.2018 / 27./28.6.2019 /
###  23.6.2020 / 22.6.2021 7 23.6.2022 / 22.6.2023)
###****************************************************

# Variante 1: for mit if-else ----
#*********************************
sgn1 <- function(x) {
  # NICHT empfehlenswert, da unnötig langer Code und
  # zeitlich ineffizient (wie sich zeigen wird):
  # Verwendung einer Schleife, in der nacheinander je-
  # des Element von x in einer geschachtelten if-else-
  # Anweisung auf Überschreiten von bzw. Gleichheit mit
  # 0 geprüft wird und abhängig davon eine entsprechen-
  # de Zuweisung (+1, 0 oder -1) an das korrespondie-
  # rende Element eines Resultatvektors z stattfindet:
  
  n <- length (x)
  z <- integer(n) # Vorbereitung des Resultatvektors z.
  
  for(i in seq_along(x)) {
    # Tipp: seq_along(x) ist sicherer als 1:n
    # oder 1:length(x), denn beachte, was pas-
    # siert, wenn x = numeric(0) (also leer)
    # ist und somit length(x) = 0.

    if(x[i] > 0) {
      z[i] <- 1
      } 
    else if(x[i] == 0) {
      z[i] <- 0
      }
    else {
      z[i] <- -1
      }
    }
  
  return(z)
  }


# Variante 2: for mit if-else reduziert ----
#*******************************************
sgn2 <- function(x) {
  # Auch NICHT empfehlenswert, da immer noch unnötig
  # langer Code und zeitlich ineffizient (wie sich
  # zeigen wird, obwohl etwas sparsamer als sgn1):
  # Verwendung einer Schleife, in der nacheinander
  # jedes Element von x in einer geschachtelten if-
  # else-Anweisung auf Über- bzw. Unterschreiten der
  # 0 geprüft wird und abhängig vom Ergebnis ent-
  # sprechend mit +1 oder -1 überschrieben wird;
  # jede 0 wird unverändert gelassen:
  
  for(i in seq_along(x)) {
    if(x[i] > 0) {
      x[i] <- 1
      }
    else if(x[i] < 0) {
      x[i] <- -1
      }
    }
  
  return(x)
  }


# Variante 3: sapply mit if-else ----
#************************************
sgn3 <- function(x) {
  # Hier ÜBERHAUPT NICHT empfehlenswert, da zeitlich
  # fürchterlich ineffizient (wie sich zeigen wird):
  # Verwendung von sapply, das nacheinander jedes Ele-
  # ment von x in eine anonyme Fkt. steckt, in der es
  # in geschachtelter if-else-Anweisung auf Über- bzw.
  # Unterschreiten der 0 geprüft wird und abhängig vom
  # Ergebnis entsprechend eine +1, -1 oder 0 zurückge-
  # geben wird:
  
  sapply(x, function(x) {
    if(x > 0) {
      return(1)
      }
    else if(x < 0) {
      return(-1)
      } else {
      return(0)
      }
    })
  }


# Variante 4: Doppeltes ifelse ----
#**********************************
sgn4 <- function(x) {
  # Nur **bedingt** empfehlenswert, da zwar kompakt
  # programmiert, aber nicht zeit-effizient (wie sich
  # zeigen wird):
  # Erst vektorielle (!) Prüfung aller x-Elemente auf
  # Unterschreiten der 0 und Erzeugung eines Vektors
  # x.negativ derselben Länge wie x, der in jeder Po-
  # sition i, für die x[i] < 0 ist, das Element -1
  # und sonst 0 hat. Dann vektorielle(!) Prüfung aller
  # x-Elemente auf Überschreiten der 0 und Erzeugung
  # eines Vektors derselben Länge wie x, der in jeder
  # Position i, für die x[i] > 0 ist, das Element +1
  # und sonst das korrespondierende Element von
  # x.negativ, also x.negativ[i] hat.
  
  x.negativ <- ifelse(x < 0, -1, 0)
  ifelse(x > 0, 1, x.negativ)
  }


# Variante 5: Vektorielles Ersetzen ----
#***************************************
sgn5 <- function(x) {
  # Empfehlenswert, da sehr kompakt und zeit-effizient
  # (wie sich zeigen wird):
  # Erst vektorielle (!) Indizierung der Elemente von
  # x, für die x[i] > 0 ist, und Überschreiben der
  # Inhalte dieser positiven x-Elemente mit +1. Dann
  # analog die vektorielle (!) Indizierung aller nega-
  # tiven x-Elemente und Überschreiben ihrer Inhalte
  # mit -1. (x-Elemente mit Wert 0 werden korrekter-
  # weise unverändert gelassen.) Schließlich Rückgabe
  # des (eventuell nur teilweise) überschriebenen
  # Vektors x.

 x[x > 0] <- +1
 x[x < 0] <- -1
 x
 }


# Variante 6: Mathemat. Formel ----
#**********************************
sgn6 <- function(x) {
  # Sehr empfehlenswert, da extrem kompakt (dafür evtl.
  # etwas schwerer verständlich) und effizient (wie
  # sich gleich zeigen wird):
  # Vektorielle (!) Püfung aller x-Elemente auf Über-
  # schreiten der 0 und Erzeugung eines logischen Vek-
  # tors derselben Länge wie x, der in jeder Position
  # i, für die x[i] > 0 ist, das Element TRUE und
  # sonst FALSE hat. Analog vektorielle (!) Prüfung
  # aller x-Elemente auf Unterschreiten der 0 und Er-
  # zeugung eines logischen Vektors derselben Länge
  # wie x, der in jeder Position i, für die x[i] < 0
  # ist, das Element TRUE und sonst FALSE hat. Dann
  # Subtraktion der beiden logischen Vektoren vonein-
  # ander, wobei intern vor der Subtraktion TRUE in 1
  # und FALSE in 0 konvertiert wird. (Insbesondere
  # liefert die Subtraktion demnach genau dann 0, wenn
  # beide Vergleiche FALSE sind, denn der Fall, in dem
  # beide TRUE liefern, existiert nicht.)

 (x > 0) - (x < 0)
 }


# Laufzeitanalysen ----
#**********************
# Überprüfung der Laufzeiten der Signums-Implemen-
# tationen
#***************************************************
# ACHTUNG: Laufzeiten hängen i. d. R. von der Hard-
# und Software ab, d. h., vom Rechner, vom Betriebs-
# system und von der R-Version (sowie oft vom Sys-
# temzustand des Rechners zum Zeitpunkt des Beginns
# der Messung)!
#***************************************************

# Für einen (langen!) reproduzierbaren (!) Testvektor
# ermitteln wir die Laufzeiten der Signumsfunktionen:
# (Achtung, es dauert!)
set.seed(17);          x <- rnorm(1e05)

system.time(sgn1(x))
 # Liefert die zur Abarbeitung des Arguments von
 # system.time durch den aktuellen R-Prozess benö-
 # tigten fünf Zeiten in ms (in dieser Reihenfolge):
 # User-Zeit, System-Zeit, insgesamt verstrichene
 # Zeit, kumulative User-Zeit und kumulative System-
 # Zeit von (eventuellen) Subprozessen. Allerdings
 # werden nur die ersten drei Zeiten ausgegeben.
system.time(sgn2(x))
system.time(sgn3(x))
system.time(sgn4(x))
system.time(sgn5(x))
system.time(sgn6(x))

 # Fazit: Es zeigen sich zwar klare Tendenzen, aber
 # wiederholte Ausführungen zeigen auch: Die Lauf-
 # zeiten sind zu kurz und stark abhängig vom an-
 # fänglichen Systemzustand, um sie verlässlich ver-
 # gleichen zu können.


# Besserer Ansatz: Bilde Mittelwerte mehrerer Wie-
# derholungen, um einen möglichen Einfluss des an-
# fängl. Systemzustands zu reduzieren (nicht aus-
# geführt, um Zeit zu sparen):
#*************************************************
# nr <- 100
# rowMeans(replicate(nr, system.time(sgn1(x))))
# rowMeans(replicate(nr, system.time(sgn2(x))))
# rowMeans(replicate(nr, system.time(sgn3(x))))
# rowMeans(replicate(nr, system.time(sgn4(x))))
# rowMeans(replicate(nr, system.time(sgn5(x))))
# rowMeans(replicate(nr, system.time(sgn6(x))))

# Noch besserer Ansatz: Zusätzlich "Automatisierung"
# des Vorstehenden für alle obigen sgn-Implementa-
# tionen
#***************************************************
FList <- list(sgn1, sgn2, sgn3, sgn4, sgn5, sgn6)
              # Liste (!) von Funktionen.

names(FList) <- paste0("sgn", seq(FList)) # Benen-
                     # nung der Listenkomponenten.

sapply(FList,
       function(fun, x0) {
         rowMeans(replicate(100, system.time(fun(x0))))
         },
       x0 = x
       ) # Beachte, wie in obigem die Variable(!)
         # fun auf x0 angewendet" wird; korrekter:
         # wie das Objekt mit dem Namen fun auf das
         # Objekt mit dem Namen x0 angewendet wird.


## Ergänzung 1 ----
#******************
# Alternative, aber inhaltlich identische Version
# unter Verwendung der Abkürzung "\" für das
# Schlüsselwort "function" und des Pipe-Operators:
sapply(FList, \(fun, x0) {
       replicate(100, system.time(fun(x0))) |>
         rowMeans()
       },
       x0 = x
       )

## Ergänzung 2 ----
#******************
# Genauere und leistungsfähigere Laufzeit-
# messungen mit `microbenchmark`:
library(microbenchmark)
(tm <- microbenchmark(sgn1(x), sgn2(x), sgn3(x),
                      sgn4(x), sgn5(x), sgn6(x),
                      times = 100))

plot(tm, horizontal = TRUE, las = 1,
     xlab = "Time [nanoseconds]", ylab = "")

ggplot2::autoplot(tm, log = FALSE)  # Alternativdar-
                    # stellung mithilfe von ggplot2.

 # Die log-Skala hilft die stark linkssteilen/rechts-
 # schiefen Werteverteilungen am unteren Skalenende
 # feiner "aufzulösen":
plot(tm, horizontal = TRUE, log = "x", las = 1,
     xlab = "Time [nanoseconds]", ylab = "")

ggplot2::autoplot(tm)  # log-Skala ist hier vorein-
                       # gestellt.


# Aufräumen ----
#***************
rm(list = ls())
