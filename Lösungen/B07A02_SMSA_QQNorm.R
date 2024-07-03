### Blatt 7, Aufgabe 2: QQ-Plots für drei SMSA-Variablen
### und ihre transformierten Varianten.
### R 4.3.3, 13.6.2024
###*********************************************************

# Import & Vorbereitung ----
#***************************
# Erneutes Einlesen und Formatieren der SMSA-Daten
# wie in A. 1 auf Bl. 6 i. V. m. A. 3 auf Bl. 5.
SMSA.df <- read.table("SMSA", skip = 3, header = TRUE,
                      row.names = "ID")
names(SMSA.df) <- c("Area", "Pop", "CityPop", "PopOver65",
                    "Physicians", "HospBeds", "Graduates",
                    "LaborForce", "Income", "Crimes",
                    "Region")
tmp <- scan(file = "SMSAID", skip = 3, sep = "\t",
            what = list(ID1 = 0, City1 = "",
                        ID2 = 0, City2 = "",
                        ID3 = 0, City3 = ""))
smsaid <- with(tmp, list(ID = c(ID1, ID2, ID3),
                         City = c(City1, City2, City3)) )
rownames(SMSA.df) <- smsaid$City
#SMSA.df$Region <- factor(SMSA.df$Region, levels = 1:4,
#                         labels = c("NE","NC","S","W"))


# Um i. F. Tipparbeit zu sparen, wird der Data Frame
# SMSA.df AUSNAHMSWEISE mit attach in den Suchpfad
# "eingehängt":
#***************************************************
attach(SMSA.df)


# Histogramme und Normal-QQ-Plots für die Rohdaten ----
#******************************************************
# Vorgriff auf Kap. 7: Zunächst wird ein (2 x 3)-Mehr-
# fachplotrahmen vorbereitet, der "column wise" gefüllt
# werden soll, was dann mit den Histogrammen und Normal-
# QQ-Plots der drei Variablen auch geschieht:
par(plist <- list(mfcol = c(2, 3), oma = c(2, 2, 2, 0),
                  tcl = -0.4, mar = c(1, 2, 2, 0.5),
                  mgp = c(3, 0.6, 0)))
   # Hier werden die Grafik-Einstellungen "nebenher"
   # auch in der Liste plist gespeichert, da sie unten
   # nochmal verwendet werden.

# Vorab einheitliche Festlegung der Anzahl der "break
# points", die die x-Achsen der Histogramme äquidistant
# einteilen werden:
brks <- 20

hist(Physicians, freq = FALSE, breaks = brks,
     main = "Active Physicians", xlab = "", ylab = "")
qqnorm(Physicians, datax = TRUE, main = "")
qqline(Physicians, datax = TRUE)

hist(Graduates, freq = FALSE, breaks = brks,
     main = "% Graduates", xlab = "", ylab = "")
qqnorm(Graduates, datax = TRUE, main = "")
qqline(Graduates, datax = TRUE)

hist(Income, freq = FALSE, breaks = brks,
     main = "Total Personal Income", xlab = "", ylab = "")
qqnorm(Income, datax = TRUE, main = "")
qqline(Income, datax = TRUE)

# Ebenfalls ein Vorgriff auf Kap. 7: Text in den "margins":
mtext("Ordnungsstatistiken (= empirische Quantile)",
      side = 1, outer = TRUE, cex = 0.7, line = 1)
mtext("Theoretische Quantile der\nStandardnormalverteilung",
      side = 2, adj = 0.125, outer = TRUE, cex = 0.7)
mtext("Histogramme und Normal-QQ-Plots",
      side = 3, outer = TRUE, line = 0.5)

# Fazit: Eine Normalverteilungsannahme ist offenbar weder
# für die "Active Physicians" noch für das "Total Personal
# Income" gerechtfertigt, wohl aber für die "% Graduates".


# Dito für die logarithmierten Variablen ----
#********************************************
par(plist)

hist(log(Physicians), freq = FALSE, breaks = brks,
     main = "log(Active Physicians)", xlab = "", ylab = "")
qqnorm(log(Physicians), datax = TRUE, main = "")
qqline(log(Physicians), datax = TRUE)

hist(log(Graduates), freq = FALSE, breaks = brks,
     main = "log(% Graduates)", xlab = "", ylab = "")
qqnorm(log(Graduates), datax = TRUE, main = "")
qqline(log(Graduates), datax = TRUE)

hist(log(Income), freq = FALSE, breaks = brks,
     main = "Total Personal Income", xlab = "", ylab = "")
qqnorm(log(Income), datax = TRUE, main = "")
qqline(log(Income), datax = TRUE)

mtext("Ordnungsstatistiken (= empirische Quantile)",
      side = 1, outer = TRUE, cex = 0.7, line = 1)
mtext("Theoretische Quantile der\nStandardnormalverteilung",
      side = 2, adj = 0.125, outer = TRUE, cex = 0.7)
mtext("Histogramme und Normal-QQ-Plots",
      side = 3, outer = TRUE, line = 0.5)

# Fazit: Die log-Trafo linearisiert die Punkteketten in
# den QQ-Plots der "Active Physicians" und des "Total
# Personal Income" zwar etwas (geht also quasi "in die
# richtige Richtung"), aber eine Normalverteilungsannah-
# me erscheint auch für die log-transformierten Daten
# zweifelhaft. Für die "log(% Graduates)" sieht es nun
# etwas "schlechter" aus; die log-Trafo war unnötig bis
# sogar kontraproduktiv.
# (Mathemat. Zusatzfrage zum Knobeln: Warum wirkt sich
# die log-Trafo so aus, wie sie es tut, und wieso bei
# den "% Graduates" hier im Vergleich mit den beiden
# anderen Variablen so wenig?)



# Dito für die quadratwurzel-transformierten Variablen ----
#**********************************************************
# Beachte: Für die Technik zur Erzeugung von mathemat.
# Notation in Grafiken (hier das Wurzelzeichen) mithilfe
# von "expressions" (expression) siehe die Hilfeseite
# ?plotmath.

par(plist)

hist(sqrt(Physicians), freq = FALSE, breaks = brks,
     main = expression(sqrt("Active Physicians")),
     xlab = "", ylab = "")
qqnorm(sqrt(Physicians), datax = TRUE, main = "")
qqline(sqrt(Physicians), datax = TRUE)

hist(sqrt(Graduates), freq = FALSE, breaks = brks,
     main = expression(sqrt("% Graduates")),
     xlab = "", ylab = "")
qqnorm(sqrt(Graduates), datax = TRUE, main = "")
qqline(sqrt(Graduates), datax = TRUE)

hist(sqrt(Income), freq = FALSE, breaks = brks,
     main = expression(sqrt("Total Personal Income")),
     xlab = "", ylab = "")
qqnorm(sqrt(Income), datax = TRUE, main = "")
qqline(sqrt(Income), datax = TRUE)

mtext("Ordnungsstatistiken (= empirische Quantile)",
      side = 1, outer = TRUE, cex = 0.7, line = 1)
mtext("Theoretische Quantile der\nStandardnormalverteilung",
      side = 2, adj = 0.125, outer = TRUE, cex = 0.7)
mtext("Histogramme und Normal-QQ-Plots",
      side = 3, outer = TRUE, line = 0.5)

# Fazit: Die Quadratwurzeltrafo ist hinsichtlich einer
# mgln. Linearisierung der Punkteketten in den QQ-Plots
# offenbar "schwächer" als die log-Trafo, sodass von
# einer Normalverteilungsannahme für die derart trans-
# formierten "Active Physicians" bzw. "Total Personal
# Income" nicht die Rede sein kann. Die "sqrt(%
# Graduates)" sehen fast genauso verteilt aus wie die
# untransformierten Werte; diese Trafo war erst recht
# unnötig bis kontraproduktiv.
# (Mathemat. Zusatzfrage zum Knobeln: Warum wirkt sich
# die Quadratwurzeltrafo so aus, wie sie es tut, und
# wieso bei den "% Graduates" hier im Vergleich mit
# den beiden anderen Variablen so wenig?)


# NICHT VERGESSEN, SMSA.df aus dem Suchpfad wieder
# "auszuhängen":
#*************************************************
detach(SMSA.df)


dev.off() # Vorsorglich wird das Grafikfenster einfach
# geschlossen, damit sich seine via par vorgenommenen
# Einstellungen nicht auf die nun noch folgenden Gra-
# fiken auswirken. 


# Ergänzung: Punktweise Konfidenzintervalle um Referenzlinie ----
#****************************************************************
# Zur Unterstützung der Einschätzung, ob die "Punkte
# kette" in einem Normal-QQ-Plot hinreichend linear
# ist, um die Normalverteilungsannahme zuzulassen,
# können punktweise 95 %-Konfidenzintervalle um die
# Referenzlinie hinzugezogen werden. qqPlot aus dem
# Paket car liefert sie.
# Einhängen von car in den Suchpfad (= "öffnen" von
# car; siehe hierzu auch den Hinweis im Skript am
# Ende von §4.2.2):
library(car)

# Um Tipparbeit zu sparen, wird auch hier der Data
# Frame SMSA.df AUSNAHMSWEISE mit attach in den
# Suchpfad "eingehängt":
#*************************************************
attach(SMSA.df)

# Und nun die Normal-QQ-Plots samt Referenzlinien
# und punktweisen 95 %-Konfidenzintervallen:
#************************************************
par(cex = 1.2)  # Um 20 % vergrößerte Schrift und
                # Zeichensymbole in Grafiken.

qqPlot(Physicians, main = "Physicians",
       envelope = list(style = "lines"))
qqPlot(Graduates, main = "% Graduates",
       envelope = list(style = "lines"))
qqPlot(Income, main = "Income",
       envelope = list(style = "lines"))
qqPlot(log(Physicians), main = "log(Physicians)",
       envelope = list(style = "lines"))
qqPlot(log(Graduates), main = "log(% Graduates)",
       envelope = list(style = "lines"))
qqPlot(log(Income), main = "log(Income)",
       envelope = list(style = "lines"))
qqPlot(sqrt(Physicians),
       main = expression(sqrt("Physicians")),
       envelope = list(style = "lines"))
qqPlot(sqrt(Graduates),
       main = expression(sqrt("% Graduates")),
       envelope = list(style = "lines"))
qqPlot(sqrt(Income), main = expression(sqrt("Income")),
       envelope = list(style = "lines"))

# NICHT VERGESSEN, SMSA.df aus dem Suchpfad wieder
# "auszuhängen", wobei ein "leerer" Aufruf von detach
# stets den zuletzt in den Suchpfad eingehängten
# Eintrag entfernt:
detach()

# Memo: with erlaubt, das Paar aus attach und detach
# zu umgehen und sollte i. d. R. bevorzugt werden!
# Hier hätten allerdings entweder sehr viele Befehle
# in einem with-Aufruf gesteckt oder es wären entspr.
# viele with-Befehle nötig gewesen ...


# Aufräumen ----
#***************
dev.off();   rm(list = ls())
