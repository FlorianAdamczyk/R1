### Blatt 10, Aufgabe 3: Simulationen für spezielle
### stetige Verteilungen.
### R 4.3.3, 18.7.2024
###*******************************************************

# Die Simulationsparameter ----
#******************************
# Analog zu A. 2 von Bl. 10: Erst Festlegung des Stich-
# probenumfangs n und der Parameter der zu betrachtenden
# Verteilungen (durch 2-elementige Vektoren mit informa-
# tiv benannten Elementen in den benannten Komponenten
# von Parameter):
n <- 100
Parameter <- list(Cauchy    = c(loc = 0, scl = 1),
                  Exp       = c(lambda = 1),
                  LogNormal = c(mulog = 0, siglog = 1),
                  Student   = c(FG = 3),
                   # FG = df = 1 liefert Cauchy; für
                   # FG = df = 2 ist Varianz unendlich.
                  Uniform   = c(min = -5, max = 5),
                  NMischung = c(mu1 = 0, sigma1 = 1,
                                mu2 = 5, sigma2 = 1,
                                p = 1/3))

# RNG-Startwert und Erzeugung der Zufallsstichproben ----
#********************************************************
# Dann Wahl des Zufallszahlengeneratorstartwertes und Er-
# zeugung der Zufallsstichproben für jede Komponente von
# Parameter sowie Speicherung dieser Stichroben in der
# Liste Stichproben (deren Komponenten nachträglich be-
# nannt werden):
set.seed(75)

Stichproben <- with(Parameter,# Damit auf die Komponenten
                              # von Parameter "direkt"
                              # zugegriffen werden kann.
  list(
    rcauchy(n, location = Cauchy["loc"],
            scale = Cauchy["scl"]),
    rexp(n, rate = Exp["lambda"]),
    rlnorm(n, meanlog = LogNormal["mulog"],
           sdlog = LogNormal["siglog"]),
    rt(n, df = Student["FG"]),
    runif(n, min = Uniform["min"], max = Uniform["max"]),
    {B <- rbinom(n, 1, NMischung["p"])
     B * rnorm(n, mean = NMischung["mu1"],
               sd = NMischung["sigma2"]) +
     (1 - B) * rnorm(n, mean = NMischung["mu2"],
                     sd = NMischung["sigma2"])
    }
   # ifelse(rbinom(n, 1, NMischung["p"]),    # Alternative
   #        rnorm(n, mean = NMischung["mu1"],# zu vorigem
   #              sd = NMischung["sigma2"]), # Block {....};
   #        rnorm(n, mean = NMischung["mu2"],# könnte jenen
   #              sd = NMischung["sigma2"])) # also ersetzen.
    )
  )

names(Stichproben) <- names(Parameter)


# Anfertigung der Grafiken ----
#******************************

## a) Die Histogramme ----
#*************************
# Wegen freq = FALSE flächennormierte Histogramme (in einem
# (3 x 2)-Mehrfachplotrahmen, ergänzt um (blaue) "rug"-Plots
# der Rohdaten):
par(mfrow = c(3, 2), mar = c(3, 3, 3, 0.5),
    mgp = c(1.8, 0.5, 0), tcl = -0.3)

with(Stichproben, {
 hist(Cauchy, freq = FALSE);     rug(Cauchy, col = "blue")
 hist(Exp, freq = FALSE);        rug(Exp, col = "blue")
 hist(LogNormal, freq = FALSE);  rug(LogNormal, col = "blue")
 hist(Student, freq = FALSE);    rug(Student, col = "blue")
 hist(Uniform, freq = FALSE);    rug(Uniform, col = "blue")
 hist(NMischung, freq = FALSE);  rug(NMischung, col = "blue")
})

### Frage ----
#*************
# Wie ginge es mit lapply o. Ä. und ohne with?
# Ausprobieren!


## b) Die Boxplots ----
#**********************
# Alle in einem Koordinatensystem eines "Einfach"-Plotrahmens:
X11()
boxplot(Stichproben)

X11()
boxplot(Stichproben[-1]) # Ohne Cauchy-Stichprobe, damit
                   # ein optischer Vergleich der anderen
                   # besser bzw. überhaupt möglich ist.


## c) Die Normal-QQ-Plots ----
#*****************************
# .... in einem (3 x 2)-Mehrfachplotrahmen:
par(mfrow = c(3, 2), mar = c(3, 3, 3, 0.5),
    mgp = c(1.8, 0.5, 0), tcl = -0.3)

with(Stichproben, {
 qqnorm(Cauchy, main = "Cauchy");        qqline(Cauchy)
 qqnorm(Exp, main = "Exp");              qqline(Exp)
 qqnorm(LogNormal, main = "LogNormal");  qqline(LogNormal)
 qqnorm(Student, main = "Student");      qqline(Student)
 qqnorm(Uniform, main = "Uniform");      qqline(Uniform)
 qqnorm(NMischung, main = "N-Mischung"); qqline(NMischung)
 })


# Schließen aller Grafikfenster & Aufräumen ----
#***********************************************
graphics.off()   #; rm(list = ls())
