### Funktion eda für die grafische explorative Datenanalyse
### zur Darstellung einer Datenverteilung (aus § 8.3 des
### R-Skripts).
###***********************************************************

eda <- function(x) {
 oldp <- par(mfrow = c(3, 2), mgp = c(1.7, 0.6, 0),
             mar = c(3.5, 3, 2.6, 0.5) + 0.1, cex = 0.8)

 hist(x, freq = FALSE, ylab = "Dichte", xlab = "",
      main = "Histogramm")
 boxplot(x, horizontal = TRUE, main = "Boxplot")
 set.seed(42)
 stripchart(x, add = TRUE, col = "blue", method = "jitter")

 qa <- diff(quantile(x, c(1/4, 3/4)))
 dest <- density(x, width = qa)
 plot(dest, ylab = "Dichte", main = "Dichteschätzer")

 qqnorm(x, datax = TRUE, ylab = "Stichprobenquantile",
         xlab = "Theoretische Quantile")
 qqline(x, datax = TRUE)
 ts.plot(x, ylab = "", xlab = "Zeit bzw. Index",
         main = "Zeitreihe")

 acf(x, main = "Autokorrelation")

 par(oldp)

 d <- max(3, getOption("digits") - 3)
 c(summary(x), "St.Dev." = signif(sd(x), digits = d))
 }
