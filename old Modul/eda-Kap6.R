### Funktion eda für die grafische explorative 
### Datenanalyse zur Darstellung einer Daten-
### verteilung (aus § 6.1 des R-Skripts).
###*******************************************

eda <- function(x) {
   par(mfrow = c(2, 2), cex = 1.2)
   
   hist(x)
   
   boxplot(x)
   
   qa <- diff(quantile(x, c(1/4, 3/4)))
   dest <- density(x, width = qa)
   plot(dest)
   
   qqnorm(x)
   qqline(x)
   
   summary(x)
   }
