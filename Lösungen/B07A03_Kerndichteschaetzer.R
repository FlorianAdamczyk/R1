### Blatt 7, Aufgabe 3: Punktweise Berechnung eines Kern-
### Dichteschätzers zu einem Datensatz.
### R 4.3.3, 13.6.2024
###*********************************************************

# Vorbereitungen ----
#********************

## Die Daten ----
# ... genauer die Mietdaten in "MietenFrankfurt", ihre
# Ordnungsstatistiken und der Stichprobenumfang:
x <- scan(file = "MietenFrankfurt")
xOS <- sort(x);   n <- length(x)

## Die Bandbreite ----
# ... des Kern-Dichteschätzers f_n:
bn <- 100


## Die Stützstellen ----
# ... an denen f_n ausgewertet werden soll:
k <- 11;   stuetzstellen <- seq(500, 4000, length = k)


# a) Die Matrix D ----
#*********************
# Wir berechnen (mit outer) zunächst die (n x k)-Matrix D
# aller paarweisen Differenzen x_{i:n} - t_j der OSn x_{i:n}
# (in xOS) und der Stützstellen t_j (in stuetzstellen).
# Diese wird dann elementweise durch die Bandbreite b_n
# (in bn) dividiert, sodass in der Ergebnismatrix in
# D.dividedby.bn eine Zeile pro OS und eine Spalte pro
# Stützstelle steht:
D.dividedby.bn <- outer(xOS, stuetzstellen, FUN = "-") / bn

  # Hinweis: Minimal effizienter, da weniger Divisionen:
  # D.dividedby.bn <- outer(xOS / bn, stuetzstellen / bn,
  #                         FUN = "-")


# b) Die Matrix Ind ----
#***********************
# Nun bilden wir die (n x k)-Matrix Ind aller Indikatoren
# 1_{-1 < D_{ij}/b_n <= 1} =
# 1_{D_{ij}/b_n > -1 und D_{ij}/b_n >= 1}, indem die
# Elemente von D.dividedby.bn mit -1 und 1 verglichen
# werden und die zwei logischen Ergebnismatrizen durch
# ein logisches "Und" (&) zur logischen Ergebnismatrix
# Ind verknüpft werden:
Ind <- (D.dividedby.bn > -1)  &  (D.dividedby.bn <= 1)

# Bemerkung: Die Klammern könnten hier sogar weggelassen
# werden. Siehe ?Syntax!


# c) f_n ----
#************
# Der Wert des Kern-Dichteschätzers f_n an einer Stützstelle
# t_j ist 1/(2nb_n) * \sum_{i=1}^n 1_{-1 < D_{ij}/b_n <= 1},
# also die Summe der Elemente der j-ten Spalte der Matrix
# Ind dividiert durch 2nb_n. Also müssen alle Spaltensummen
# von Ind berechnet und durch 2nb_n dividiert werden, um f_n
# an den Stützstellen t_1, ..., t_k zu erhalten:
fn <- rep(1, nrow(Ind)) %*% Ind / (2*n*bn)

  # Oder für ein "schöneres" Ergebnis:
# fn <- drop(rep(1, nrow(Ind)) %*% Ind) / (2*n*bn)
  # Hierbei sorgt drop dafür, dass für die nach der Vektor-
  # Matrix-Multiplikation erhaltene (1 x k)-Matrix die über-
  # flüssige Zeilendimension "fallen" gelassen wird und ein
  # Vektor resultiert.

  # Oder eine sehr effiziente Berechnung der Spaltensummen
  # erhielten wir durch die (hier in der Aufgabenstellung
  # "nicht erlaubte") Verwendung von colSums:
# fn <- colSums(Ind) / (2*n*bn)


# d) Grafik ----
#***************
# Der (approximative) Graph von f_n: Hier produzieren wir
# eine grafische Darstellung der Werte von f_n an den aus-
# gewählten Stützstellen als Polygonzug entlang jener
# Stützstellen. D. h., wir fertigen den Streckenzug durch
# die Punkte (t_j, f_n(t_j)) für j = 1, ..., k an:
plot(x = stuetzstellen, y = fn, type = "l")
rug(x, col = "blue")   # "rug plot" der Rohdaten


# e) Variationen von k und b_n ----
#**********************************
# Hier variieren wir k:
k <- 50  # 50, 250, 1000, 5000
stuetzstellen <- seq(500, 4000, length = k)
D.dividedby.bn <- outer(xOS / bn, stuetzstellen / bn,
                        FUN = "-")
Ind <- (D.dividedby.bn > -1)  &  (D.dividedby.bn <= 1)
fn <- colSums(Ind) / (2*n*bn)
plot(x = stuetzstellen, y = fn, type = "l")
rug(x, col = "blue")

# Frage: Was beobachten Sie als Wirkung einer Erhöhung von k?


# Und hier variieren wir b_n:
bn <- 50 # 50, 100, 200, 500, 2000

D.dividedby.bn <- outer(xOS / bn, stuetzstellen / bn,
                        FUN = "-")
Ind <- (D.dividedby.bn > -1)  &  (D.dividedby.bn <= 1)
fn <- colSums(Ind) / (2*n*bn)
plot(x = stuetzstellen, y = fn, type = "l")
rug(x, col = "blue")

# Frage: Was beobachten Sie als Wirkung einer Vergrößerung
# von b_n und was als Wirkung einer Verkleinerung?


# Weitere Frage: Wie sieht f_n außerhalb des betrachteten
# Wertebereichs aus?
  


# Ergänzungen ----
#*****************
# Um die Funktionsweise eines Kern-Dichteschätzers zu veran-
# schaulichen, zeichnen wir zusätzlich zum (approximativen)
# Graph von f_n für jedes Datum x_{i:n} "seinen" Summanden,
# der zu f_n beiträgt, als Funktion von t ein, also
#       t -> K((x_{i:n} - t)/b_n) / (n*b_n),
# wobei K hier der Rechteckskern der Aufgabenstellung ist.
# Allerdings verwenden wir weniger Daten als eingangs, damit
# die Effekte besser erkennbar sind (~ 1/5 der Daten):

# Zunächst die Auswahl eines Teils der Daten:
xOS <- sort(x)[c(T, rep(F, 4))] # 1., 6., 11., 16., ... Datum.
n <- length(xOS)

# Sodann Berechnung des Dichteschätzers für viele und
# somit dicht beieinander liegende Stützstellen
#****************************************************
k <- 5000
bn <- 50
stuetzstellen <- seq(500, 4000, length = k)
D.dividedby.bn <- outer(xOS / bn, stuetzstellen / bn,
                        FUN = "-")   # (n x k)-Matrix
Ind <- (D.dividedby.bn > -1)  &  (D.dividedby.bn <= 1)
fn <- colSums(Ind) / (2*n*bn)  # k Funktionswerte

# Hier der (approximative) Graph von f_n:
plot(x = stuetzstellen, y = fn, type = "l")
rug(xOS, col = "blue")

# Nun wird zusätzlich für jedes Datum x_i "sein" Summand
# t -> K((x_i - t)/bn) / (n*bn) eingezeichnet, der zu f_n
# beiträgt, wobei K hier der Rechteckskern der Aufgaben-
# stellung ist. (Im Vorgriff auf §7.5.6 wird hierzu die
# nützliche Fkt. matlines verwendet.)
#********************************************************
matlines(x = stuetzstellen, y = t(Ind)/(2*n*bn), lty = 1)
  # Beachte 1: Transponieren durch t ist nötig, weil die
  # Spalten(!) von Ind zu den Stützstellen "gehören".

  # Beachte 2: Für jeden der ca. 40 Datenwerte wird ein
  # Rechteck gezeichnet, die sich doch recht stark über-
  # lagern und daher nicht gut zu erkennen sind.


# Weitere Variation: Hier verwenden wir den Gaußkern (= Dich-
# tefunktion der Standardnormalverteilung; in R zur Verfügung
# durch dnorm) für K anstelle des Rechteckskerns. Zwei ent-
# scheidende Unterschiede:
# 1. Der Gaußkern ist keine Sprungfunktion wie der Rechtecks-
#    kern, sondern "glatt", genauer gesagt sogar beliebig oft
#    differenzierbar;
# 2. Der Gaußkern hat einen unendlichen Träger, wird also
#    nirgends 0 (Null). (Hingegen ist der Träger des obigen
#    Rechteckskerns auf [-1, 1] beschränkt und somit ist der
#    Rechteckskern außerhalb von [-1, 1] 0 (Null).)
# 
# Konsequenzen:
# 1. Der resultierende Kern-Dichteschätzer ist eine glatte
#    Funktion;
# 2. Der Einfluss eines Datums x_i auf den Funktionswert des
#    Kern-Dichteschätzers an der Stelle x, also auf f_n(x),
#    wird nie Null, nimmt aber mit wachsendem Abstand zwi-
#    schen x und x_i stetig ab.
#************************************************************
Ind <- apply(D.dividedby.bn, 1, dnorm)
  # Beachte: Nach apply stehen in Ind (anders als oben) nun
  # die OSn in den Spalten(!) und die Stützstellen in den
  # Zeilen(!).
fn <- rowSums(Ind) / (2*n*bn)   # Beachte rowSums!
plot(x = stuetzstellen, y = fn, type = "l")
rug(xOS, col = "blue") 
matlines(x = stuetzstellen, y = Ind/(2*n*bn), lty = 1)
  # Beachte: Transponieren durch t ist nicht mehr nötig, weil
  # jetzt die Zeilen(!) von Ind zu den Stützstellen "gehören".

# Frage: Welche Effekte hätte hier Variationen k und b_n?


# Aufräumen ----
#***************
dev.off();   rm(list = ls())
