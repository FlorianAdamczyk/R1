### Blatt 10, Aufgabe 1: Plots der Wahrscheinlichkeits-
###  und Verteilungsfunktionen verschiedener Binomial-
###  verteilungen.
### R 4.3.3, 18.7.2024
###*****************************************************

# Plots der Wahrscheinlichkeitsfunktionen ----
#*********************************************

## Vorbereitung der Grafikdatei ----
#***********************************
# Öffnen der Postscript- oder PDF-Grafikdatei und
# Einstellung eines geeigneten Layouts:

#postscript("BinomialWFktn.eps")
pdf("BinomialWFktn.pdf")
    # Memo: paper= "a4r", width= 0, height= 0
par(mfrow = c(2, 2), oma = c(0, 0, 2, 0),
    mar = c(2, 2.5, 1.5, 0.5) + 0.1,
    mgp = c(1.5, 0.4, 0), tcl = -0.25)


## Parameterwerte ----
#*********************
# Vektoren der Parameterwerte, für deren Kombina-
# tionen die Wahrscheinlichkeits- bzw. Verteilungs-
# funktion der Binomialverteilung zu zeichnen sind:
N <- c(1, 3, 5, 25)
P <- c(0.1, 0.3, 0.5, 0.8)


## x-Gitter ----
#***************
# Das Gitter der x-Achse, auf dem die Wahrscheinlich-
# keitsfunktion ausgewertet wird, ist die Menge der
# ganzen Zahlen 0, 1, ..., N und der benötigte Aus-
# schnitt der y-Achse ist [0, 1].
k <- 0:max(N)


## Zeichnen der Wahrscheinlichkeitsfunktionen ----
#*************************************************
# Geschachtelte Schleifen, in denen außen die N- und
# innen die P-Werte durchlaufen und die Wahrschein-
# lichkeitsfunktionen geplottet werden:
for(n in N) {
  for(p in P) {

    # Plot des Koordinatensystems mit dem Graphen der
    # Wahrscheinlichkeitsfkt. mit den Parameterwerten
    # als Überschrift (bea.: type = "h"):
   plot(k, dbinom(k, size = n, prob = p), type = "h",
        ylim = c(0, 1), ylab = "", xlab = "",
        main = paste(c("n  =", "p  ="), c(n, p),
                     collapse = ", "))
   }

   # Überschrift im äußeren Rand des Mehrfach-
   # Plotrahmens:
  mtext(side = 3, outer = TRUE, line = 0.5, cex = 1.3, 
        paste("Wahrscheinlichkeitsfunktionen",
              "verschiedener Binomialverteilungen"))
#  Sys.sleep(time = 8)   # "Pause" von ca. time Se-
                         # kunden, falls man es sich
                         # am Bildschirm ansieht.
  } # for(n in N) {....}

dev.off()




# Plots der Verteilungsfunktionen ----
#*************************************

## Vorbereitung der Grafikdatei ----
#***********************************
# Öffnen der Postscript- oder PDF-Grafikdatei und
# Einstellung eines geeigneten Layouts:

#postscript("BinomialVFn.eps")
pdf("BinomialVFn.pdf")
    # Memo: paper = "a4r", width= 0, height= 0
par(mfrow = c(2, 2), oma = c(0, 0, 2, 0),
    mar = c(2, 2.5, 1.5, 0.5) + 0.1,
    mgp = c(1.5, 0.4, 0), tcl = -0.25)


# Es werden i. F. die Simulationsparameter
# und das x-Gitter von oben verwendet.


## Zeichnen der Verteilungsfunktionen ----
#*****************************************
# Völlig analog zu obigem:
for(n in N) {
  for(p in P) {

    # Plot des Koordinatensystems mit dem Graphen
    # der Verteilungsfkt. (einer Treppenfkt.!) und
    # den Parameterwerten als Überschrift:
   plot(stepfun(k, c(0, pbinom(k, size = n, prob = p))),
        ylim = c(0, 1), xlab = "", ylab = "",
        verticals = FALSE, do.points = FALSE,
        main = paste(c("n  =", "p  ="), c(n, p),
                     collapse = ", "))
   }

   # Überschrift im äußeren Rand des Mehrfach-
   # Plotrahmens:
  mtext(side = 3, outer = TRUE, line = 0.5, cex = 1.3, 
        paste("Verteilungsfunktionen verschiedener",
              "Binomialverteilungen"))
#  Sys.sleep(time = 8)   # "Pause" von ca. time Sek.
  } # for(n in N) {....}

dev.off()


# Aufräumen ----
#***************
rm(list = ls())
