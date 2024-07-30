### Blatt 9, Aufgabe 4: Plots der Dichte- und Vertei-
### lungsfunktionen verschiedener Weibullverteilungen.
### R 4.3.3, 11.7.2024
###******************************************************

# Plots der Dichten ----
#***********************

## Öffnen der Postscript- oder PDF-Grafikdatei ----
#**************************************************
#postscript("Weibulldichten.eps")
pdf("Weibulldichten.pdf")
    # Memo: paper = "a4r", width = 0, height = 0

## Layout ----
#**************
# Festlegen eines geeigneten Layouts ((2 x 2)-Mehrfach-
# plotrahmen mit 2.5 Zeilen äußerem Rand oben):
par(mfrow = c(2, 2), oma = c(0, 0, 2.5, 0), tcl = -0.25,
    mar = c(3, 2.5, 0, 0.5) + 0.1, mgp = c(1.5, 0.4, 0))


## Parameterwerte ----
#*********************
# Vektoren der Parameterwerte, für deren Kombinationen
# die Dichte (bzw. später die Verteilungsfunktion (VF))
# der Weibullverteilung zu zeichnen sind:
Shape <- c(0.5, 0.75, 1, 2)
Scale <- c(0.5, 1, 2, 3)

## Das x-Gitter ----
#*******************
# Das Gitter der x-Achse, auf dem die Dichte ausge-
# wertet wird, sowie der Maximalwert der y-Achse,
# der so zu wählen ist, dass alle Funktionswerte
# auch in dasselbe Koordinatensystem passen:
x <- seq(0, 5, by = 0.05)   # Ist der Startwert 0 ok?
yMax <- 2.25   # Durch Ausprobieren (!) gefunden.


  # Variante zur automat. Bestimmung des notwendigen
  # Maximalwerts der y-Achse, damit die Graphen in
  # dasselbe Koordinatensystem passen, durch Berech-
  # nung der Funktionswerte *aller* zu zeichnenden
  # Dichten und deren Maximum: 
  #*************************************************
  # ParKombis <- as.matrix(expand.grid(Scale = Scale,
  #                                    Shape = Shape))
  # yMaxima <- apply(ParKombis, 1,
  #                  function(Par, xx) {
  #                   max(dweibull(xx,
  #                                shape = Par["Shape"],
  #                                scale = Par["Scale"]))
  #                   }, xx = x)
  # yMax <- max(yMaxima)   # ACHTUNG: Welches Problem
  #                        # entsteht hier, wenn in x
  #                        # die 0 enthalten ist?


## Die Plot-Schleifen ----
#*************************
# Geschachtelte Schleifen, in deren äußerer die Shape-
# und deren innerer die Scale-Werte durchlaufen sowie
# die Dichtefunktionen geplottet werden:
#*****************************************************
for(shp in Shape) {
  
  # Plot des Koordinatensystems zusammen mit dem Graphen
  # der ersten Dichte:
  y <- dweibull(x, shape = shp, scale = Scale[1])
  plot(x, y, ylim = c(0, yMax), type = "l",
       ylab = "", xlab = "")
  # Beachte, dass hier und i. F. der Vektor x stets
  # aus dem "global environment" geholt wird!

  # Zeichnen der übrigen Dichten mit verschiedenen
  # Linientypen und -farben:
  for(i in 2:length(Scale)) {
   y <- dweibull(x, shape = shp, scale = Scale[i])
   lines(x, y, lty = i, col = i)
   }
 
  # Legende in der Ecke "oben rechts" für alle Dichten:
  legend("topright", bty = "n",
         title = "(Shape, Scale):",
         legend = paste0("(", shp, ", ", Scale, ")"),
         lty = 1:length(Scale),   # = seq(Scale)
         col = 1:length(Scale))   # = seq(Scale)
  }   # for(shp in Shape) {....}


## Titel ----
#************
# Überschrift im äußeren Rand des Mehrfachplotrahmens:
mtext(side = 3, outer = TRUE, line = 0.8, cex = 1.3, 
      "Dichten verschiedener Weibullverteilungen")

dev.off() # Ordnungsgemäßes Schließen der Grafikdatei.




## Variation A ----
#******************
# In der äußeren Schleife for(shp in Shape) {....}
# wird die Fkt. curve für das eigentliche Zeichnen
# (mit yMax von oben) verwendet:
#
# Beachte, dass i. F. der Vektor x stets aus dem
# "global environment" geholt wird!

for(shp in Shape) {
  curve(dweibull(x, shape = shp, scale = Scale[1]),
        from = 0, to = 5, ylim = c(0, yMax),
        ylab = "", xlab = "")
  
  for(i in 2:length(Scale))
    curve(dweibull(x, shape = shp, scale = Scale[i]),
          add = TRUE, lty = i, col = i)
  
    # Legende wird wie oben erzeugt und hier eingespart.
    }   # for(shp in Shape) {....}



## Variation B ----
#******************
# In der äußeren Schleife for(shp in Shape) {....}
# werden die Fktn. sapply und matplot verwendet, um
# die innere for-Schleife "einzusparen" (mit yMax
# von oben):
#
# Beachte, dass i. F. der Vektor x stets aus dem
# "global environment" geholt wird!

for(shp in Shape) {
  Y <- sapply(Scale,
              function(sc) # Memo: \(sc) als Abk.
                dweibull(x, shape = shp, scale = sc))
  matplot(x, Y, type = "l", ylim = c(0, yMax),
          ylab = "", xlab = "")
  
  # Legende wird wie oben erzeugt und hier eingespart.
  }   # for(shp in Shape) {....}



# Plots der Verteilungsfunktionen ----
#*************************************

## Das x-Gitter ----
#*******************
# Das Gitter der x-Achse, auf dem die Verteilungs-
# funktion ausgewertet wird (der Maximalwert der
# y-Achse ist natürlich 1):
x <- seq(0, 5, by = 0.05)

## Alles auf einmal ----
#***********************
# Öffnen der Postscript- oder PDF-Grafikdatei, fest-
# legen ihres Layouts und verwenden der Fktn. sapply
# und matplot fürs Zeichnen:

#postscript("WeibullVFn.eps")
pdf("WeibullVFn.pdf")
    # Memo: paper = "a4r", width = 0, height = 0
par(mfrow = c(2, 2), oma = c(0, 0, 2.5, 0), tcl = -0.25,
    mar = c(3, 2.5, 0, 0.5) + 0.1, mgp = c(1.5, 0.4, 0))

# Beachte, dass i. F. der Vektor x stets aus dem
# "global environment" geholt wird!

 for(shp in Shape) {
  Y <- sapply(Scale,
              function(sc) # Memo: \(sc) als Abk.
                pweibull(x, shape = shp, scale = sc))
  matplot(x, Y, type = "l", ylim = c(0, 1),
          ylab = "", xlab = "")
  
  legend("bottomright", title = "(Shape, Scale):",
         legend = paste0("(", shp, ", ", Scale, ")"),
         lty = seq(Scale), col = seq(Scale), bty = "n")
  }   # for(shp in Shape) {....}

 mtext(side = 3, outer = TRUE, line = 0.8, cex = 1.3, 
       paste("Verteilungsfunktionen verschiedener",
             "Weibullverteilungen"))
dev.off()


# Aufräumen ----
#***************
m(list = ls())
