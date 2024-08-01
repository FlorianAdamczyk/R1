# 30 äquidistante Stützstellen von 0 bis 2*pi als Beispieldaten und
# Formatieren eines Grafikfensters als (2 x 2)-Mehrfachplotrahmen:
#******************************************************************
x <- seq(0, 2*pi, length = 30)
par(mfrow = c(2, 2), oma = c(1, 1, 2, 1), mar = c(5, 4, 4, 2) + 0.1)

# Plot links oben:
#*****************
plot(x, sin(x));        abline(v = 0, lty = 2);     abline(h = 0, lty = "dashed")
arrows(2, -0.8, 1, 0);   text(2, -0.8, "Nulllinie", pos = 4, offset = 0.2)

# Plot rechts oben:
#******************
plot(x, sin(x), type = "l", main = "Plot-Titel", sub = "Plot-Untertitel",
     xlab = "x-Achse", ylab = "y-Achse")
lines(x, cos(x), lty = "dashed");     grid(lty = "solid")
legend(0, -0.5, legend = c("Sinus", "Cosinus"), lty = c("solid", "dashed"))

axis(4, line = 0.5, cex.axis = 0.75, col = "red", col.axis = "blue",
     mgp = c(3, 0.25, 0))
axis(3, at = c(0, 2.6, 5.1), labels = c("Links", "Mitte", "Rechts"),
     tick = FALSE, mgp = c(3, 0.1, 0), hadj = 0, col.axis = "darkgreen")

# Plot links unten:
#******************
par(mgp = c(2, 0.5, 0))
plot(x, sin(x), type = "b", pch = 20, las = 1, lab = c(10, 10, 7), tcl = -0.25,
     ylim = c(-1.1, 1.1), xlab = "x-Achse", ylab = "y-Achse")

text(1, -0.1, "Extreme", adj = 0.7, col = "red")
arrows(c(1, 1), c(0, -0.2), c(pi/2, 3*pi/2), c(1, -1), col = "red")
segments(c(pi/2, 3*pi/2) - 1, c(1, -1), 
         c(pi/2, 3*pi/2) + 1, c(1, -1), lty = "dotted")
legend(3.5, 1, legend = c("Ecken", "Kanten"), lty = c(-1, 1), pch = c(20, -1),
       bty = "n", title = "Legende mit Symbol und\nLinie (und ohne Rahmen)")

title(main = "Zweizeiliger\nPlot-Titel", cex = 0.75)
title(sub = "Linksbündiger Plot-Untertitel", adj = 0, cex = 0.6)

# Plot rechts unten:
#*******************
par(mgp = c(3, 1, 0))
plot(c(0, 5), c(-1, 1), type = "n", axes = FALSE, xlab = "", ylab = "");    box()
grid(lty = "solid")

abline(-1,   0.3, lty = 1, lwd = 2, col = "blue")
abline(0.9, -1/2, lty = 2, lwd = 2, col = "red")
abline(-0.3, 0.1, lty = 3, lwd = 2, col = "magenta")
abline(0,   -0.2, lty = 4, lwd = 2, col = "orange")

legend("top", legend = letters[ 1:4], lty = 1:4, lwd = 2,
       col = c("blue", "red", "magenta", "orange"), cex = 1.2, ncol = 2,
       bg = "lightgreen", title = "Legende mit Farben")

mtext("Plot-Außenrand 1", side = 1);   mtext("Plot-Außenrand 2", side = 2)
mtext("Plot-Außenrand 3", side = 3);   mtext("Plot-Außenrand 4", side = 4)

# Text im äußeren Rahmen der Seite:
#**********************************
mtext(paste("Seiten-Außenrand", 1:4), side = 1:4, outer = TRUE)   # mtext() mit
mtext(paste("Zeile", 1:-2, "im 3. Seiten-Außenrand"),             # vektoriellen
      outer = TRUE, line = 1:-2, adj = 0:3/100)                   # Argumenten.

# Schließen der Grafikausgabe:
#*****************************
dev.off()
