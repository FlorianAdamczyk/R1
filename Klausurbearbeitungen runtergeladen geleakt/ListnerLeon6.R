#Listner, Leon. 8108323
#Aufgabe 6

#a)
Gewichte <- scan("Wollknaeuelgewichte2024.txt")
str(Gewichte)
Gewichte
#Numeric Vektor mit 20 Einträgen

#b)
#qqnorm.sim als Hilfsfunktion von Blatt 10/11
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

qqnorm.sim(Gewichte)
#Die Ausreißer oben rechts sind selbst für den kleinen Stichprobenumfang zu 
#extrem, als dass die Normalverteilungsannahme gerechtfertigt erscheint.

#c)
#Hilfsfunktion eda von Blatt10/11
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

eda(Gewichte)
plot(ecdf(Gewichte))

#Da die Verteilung also (vermutlich) nicht normalverteilt ist, kann man den 
#Wilcoxon Vorzeichen Rangsummentest benutzen.
#Dessen Annahmen sind unabhängige Beobachtungen X1,_,Xn, eine stetige, symm.
#Verteilungsfunktion und einen eindeutig bestimmten Median.
#Die Unabhängigkeit scheint erfüllt zu sein, wenn davon ausgegangen wird, dass
#jedes Wollknäuel einzeln hergestellt wird.
#Auch die Stetigkeit der Verteilungsfunktino ist vermutlich gegeben, 
#der Dichteschätzer geht nie auf 0. Ebenso ist deswegen der Median eindeutig 
#bestimmt. Diese Voraussetzungen sind jedoch nicht beweisbar, sondern nur
#empirisch plausibel.
#Die Symmetrie erscheint bis auf Ausreißer am oberen Rand gerechtfertigt, ggf.
#ist dies dem kleinen Stichprobenumfang zuzuschreiben.

#d)
#Die Nullhypothese lautet, dass der tatsächliche Median theta gleich dem Soll-
#gewicht theta0=50g ist. (theta = theta0 = 50g)
#Die Alternativhypothse lautet dementsprechend, dass der tatsächliche Median
#theta ungleich theta0 ist. (theta != theta0 = 50g)
#Das Signifikanzniveau alpha wird auf 0.05 festgelegt.
#Die Entscheidungsregel lautet dann: Verwirf H0, wenn der p-Wert kleiner als alpha ist.

#e) 
wilcox.test(Gewichte, mu = 50)

#Die Nullhypothese kann verworfen werden, da der p-Wert kleiner als alpha ist.








