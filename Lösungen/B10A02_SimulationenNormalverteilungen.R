### Blatt 10, Aufgabe 2: Simulationen für Normalverteilungen
### R 4.3.3, 18.7.2024
###*******************************************************

# Die Simulationsparameter ----
#******************************
# Wahl des Stichprobenumfangs als SP.Umfang und der Kon-
# stellationen für die Normalverteilungsparameter durch
# zweielementige Vektoren mit benannten Elementen in den
# benannten Komponenten der Liste Parameter.
SP.Umfang <- 100
Parameter <- list(P1 = c(mu =  0, sigma = 1),
                  P2 = c(mu =  0, sigma = 2),
                  P3 = c(mu =  2, sigma = 0.5),
                  P4 = c(mu = -1, sigma = 3))


# Der Zufallszahlengeneratorstartwert ----
#*****************************************
# Festlegung des Startwertes (seed) des (Pseudo-)Zufalls-
# zahlengenerators (RNG = random numbers generator), um
# die Reproduzierbarkeit der Simulation zu gewährleisten.
# Dabei ist die 725 willkürlich gewählt.
set.seed(725)


# Erzeugen der Zufallsstichproben ----
#*************************************
# Sukzessive für jede Komponente der Liste Parameter (dem
# ersten Argument von lapply) wird die "inline-definierte",
# anonyme Funktion (lapplys zweites Argument) wiederholt
# aufgerufen. Diese erwartet zwei Argumente: x und n.
# An ihr erstes Argument x wird dabei jedes Mal eine an-
# dere Komponente der Liste Parameter übergeben und an
# ihr zweites (n) jedes Mal derselbe Wert SP.Umfang (be-
# wirkt durch das dritte Argument von lapply). Im Rumpf
# der inline-definierten Funktion wird durch rnorm ein
# Vektor von n normalverteilten Zufallszahlen (mit Erwar-
# tungswert aus x["mu"] und Standardabweichung aus
# x["sigma"]) generiert und als Resultat zurückgegeben
# (und zwar an lapply, die diese Resultatevektoren
# "sammelt" und zusammengefasst in einer Liste als Ge-
# samtergebnis zurückliefert).
Stichproben <- lapply(Parameter,
                      function(x, n) {
                        rnorm(n, mean = x["mu"],
                              sd = x["sigma"])
                        },
                      n = SP.Umfang)

  # In Stichproben steht nun eine Liste mit derselben
  # Länge und denselben Komponentennamen wie Parameter.


# Erzeugen der Grafiken ----
#***************************

## Die Histogramme ----
#**********************
# Automatisches Öffnen eines Grafikfensters durch
# par(....) und Formatieren als (2 x 2)- Mehrfachplot-
# rahmen. Dann temporäres "Einhängen" der Liste Stich-
# proben in den R-Suchpfad mit with, damit auf ihre
# Komponenten direkt durch deren Namen zugegriffen
# werden kann. Sodann Erstellen von vier Histogrammen
# durch hist: Für jede der Stichproben-Komponenten P1,
# P2, P3 und P4 eines.
par(mfrow = c(2, 2))

with(Stichproben, {
 hist(P1, freq = FALSE)
 hist(P2, freq = FALSE)
 hist(P3, freq = FALSE)
 hist(P4, freq = FALSE)
 })

# Beachte: Nur wegen freq = FALSE werden *flächennor-
# mierte* Histogramme gezeichnet.


### Variante ----
#***************
  # ... mit gleichen Achsenausschnitten zur besseren
  # optischen Vergleichbarkeit der Histogramme, wobei
  # der Ausschnitt der x-Achse automatisch und der-
  # jenige der y-Achse "von Hand" bestimmt bzw. fest-
  # gelegt wird:
  xrange <- range(Stichproben) # range funktioniert
                               # offenbar über Listen-
                               # komponenten hinweg!
  yrange <- c(0, 0.8)

  with(Stichproben, {
   hist(P1, freq = FALSE, xlim = xrange, ylim = yrange)
   hist(P2, freq = FALSE, xlim = xrange, ylim = yrange)
   hist(P3, freq = FALSE, xlim = xrange, ylim = yrange)
   hist(P4, freq = FALSE, xlim = xrange, ylim = yrange)
   })

### Frage ----
#************
# Wie ginge es mit lapply o. Ä. (also ohne with)?
# Ausprobieren!


## Die Boxplots ----
#*******************

# In einem *weiteren* Grafikfenster wird für jede der
# Stichproben-Komponenten ein Boxplot angefertigt, wobei
# diese Boxplots in *einem* Koordinatensystem nebenein-
# ander geplottet werden, um besser verglichen werden zu
# können.
X11()
boxplot(Stichproben)


### Variante ----
#****************
  # ... mit einigermaßen informativer Überschrift
  # und deren vollautomatisch stets richtiger Plat-
  # zierung mit Hilfe der Funktion axis:
  Uebertxt <- paste0("(", sapply(Parameter, paste,
                                 collapse = ", "),
                     ")")  # Wie oben in Variante 1.
  boxplot(Stichproben,
          main = paste("Erwartungswerte und",
                       "Standardabweichungen:"))
  axis(side = 3, at = 1:4, labels = Uebertxt,
       line = -0.7, tick = FALSE, font = 2)


# Die Normal-QQ-Plots ----
#*************************
# In einem (3 x 2)-Mehrfachplotrahmen (ebenfalls
# in einem weiteren Grafikfenster) werden die
# Normal-QQ-Plots gezeichnet:
X11()
par(mfrow = c(2, 2))
   
with(Stichproben, {
 qqnorm(P1, main = "P1");  qqline(P1)
 qqnorm(P2, main = "P2");  qqline(P2)
 qqnorm(P3, main = "P3");  qqline(P3)
 qqnorm(P4, main = "P4");  qqline(P4)
 })
   


# Schließen aller Grafikfenster & Aufräumen ----
#***********************************************
graphics.off();   rm(list = ls())
