### Blatt 11: Hilfsfunktionen eda und qqnorm.sim
### R 4.3.3, 18.7.2024
###************************************************************

# Funktion eda aus § 8.3 des Skripts (mit geringfügiger
# Modifikation durch die Funktion on.exit):
#******************************************************
eda <- function(x) {
 oldp <- par(mfrow = c(3, 2), mgp = c(1.7, 0.6,0),
             mar = c(3.5, 3, 2.6, 0.5) + 0.1, cex = 0.8)
 on.exit(par(oldp))

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

 d <- max(3, getOption("digits") - 3)
 c(summary(x), "St.Dev." = signif(sd(x), digits = d))
 }



# Simulationsfunktion qqnorm.sim zur Beurteilung des Normal-
# QQ-Plots mit geringfügiger Modifikation durch die Funktion
# on.exit und mit optimiertem Layout: Weniger "white space"
# (mit Hilfe von par) und "ausgedünnte" Beschriftung (durch
# ann = FALSE und Text in den "outer margins" mithilfe von
# mtext):
#***********************************************************
qqnorm.sim <- function(x) {
 oldp <- par(mfrow = c(3, 4), oma = c(2, 2, 0, 0), tcl = -0.4,
             mar = c(2, 2, 2, 0.5), mgp = c(1, 0.7, 0))
 on.exit(par(oldp))
 
 qqnorm(x, datax = TRUE, ann = FALSE, col = "red")
 qqline(x, datax = TRUE)
 title("Originaldaten", col.main = "red")

 n <- length(x)
 replicate(11, {xx <- rnorm(n)
                qqnorm(xx, main = "Simulationsdaten",
                       datax = TRUE, ann = FALSE)
                qqline(xx, datax = TRUE)} )
 mtext(text = c("Stichprobenquantile",
                "Theoretische Quantile"),
       side = c(1, 2), outer = TRUE)
 }
