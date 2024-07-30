### Blatt 11, Aufgabe 1: Ein-Stichproben-t- bzw. Gaußtests
### R 4.3.3, 18.7.2024
###************************************************************

# Datenimport ----
#*****************
# Einlesen der Schmelztemperaturen der Reagenzgläser
(Schmelztemperaturen <- scan("Schmelztemperaturen",
                             skip = 2, sep = ","))

# Hilfsfunktionen ----
#*********************
# Wollen i. F. eda und qqnorm.sim nutzen. Dazu kopiert man sich
# entweder den R-Code der Fkts.-definitionen hierher oder lädt
# ihn in die laufende R-Session mit Hilfe von source aus einer
# separaten R-Datei, in die er vorher "ausgelagert" wurde (hier
# namens "B11_Hilfsfunktionen.R"). Letzteres ist oft zu bevor-
# zugen, da es den hiesigen Code "schlanker" und modularer
# macht:
source("B11_Hilfsfunktionen.R", encoding = "UTF-8")

# Hinweis: `encoding = "UTF-8"` ist nötig, da die Datei von mir
# in RStudio angefertigt wurde, das für die mit ihm generierten
# Dateien das Encoding UTF-8 verwendet, aber die R-Session un-
# ter Windows i. d. R. mit dem Encoding Windows-1252 (cp-1252)
# läuft, was zur falschen Darstellung der deutschen Umlaute
# führt.

# Bemerkung: Die beiden Hilfsfunktionen wurden gegenüber ihren
# Versionen im Vorlesungsskript geringfügig modifiziert. De-
# tails finden sich in den Kommentaren in Ihrer Quelldatei.


# EDA ----
#*********
eda(Schmelztemperaturen)       # Ergeben sich Zweifel an der
qqnorm.sim(Schmelztemperaturen)# Normalverteilungsannahme oder
                               # der Unabhängigkeit der Daten?

library(car)                   # Und hier?
qqPlot(Schmelztemperaturen, id = FALSE,
       envelope = list(style = "lines"))

  # R-technischer Hinweis: Zugriff auf Objekte in 
  # installierten, aber aktuell nicht "attach"-ten
  # Paketen geht auch "direkt":
  detach(package:car)# Vorsorglich zu Demonstrationszwecken.
  search()           # Ist car noch "attached"?
  car::qqPlot(Schmelztemperaturen, id = FALSE,
              envelope = list(style = "lines"))


# Zur inferenzstatistischen Analyse ----
#***************************************

## a) ----
#*********
# H0: mu = 745 gg. H1: mu != 745 mit sigma^2 unbekannt
t.test(Schmelztemperaturen, mu = 745)


## b1) ----
#*********
# H0: mu >= 745 gg. H1: mu < 745 mit sigma^2 unbekannt
t.test(Schmelztemperaturen, mu = 745, alternative = "less")


## b2) ----
# H0: mu <= 745 gg. H1: mu > 745 mit sigma^2 unbekannt
t.test(Schmelztemperaturen, mu = 745, alternative = "greater")


## c) ----
# H0: mu = 745 gg. H1: mu != 745 mit sigma^2 BEKANNT
#
# Der Gaußtest ist in Rs base distribution nicht
# implementiert! Wir führen ihn "von Hand" durch:
# Berechnung der Teststatistik (siehe § 8.1.3 im Skript):
n <- length(Schmelztemperaturen)
teststat <- sqrt(n) * (mean(Schmelztemperaturen) - 745) /
                      sqrt(4979.47)

# Das Signifikanzniveau:
alpha <- 0.05

# i) Testentscheidung mittels kritischem Wert:
(krit.Wert <- qnorm(1 - alpha/2))  # s. Skript-§ 8.1.3
abs(teststat) >= krit.Wert

# ii) Testentscheidung mittels p-Wert:
(pWert <- 2 * (1 - pnorm(abs(teststat))))# s. Skript-§ 8.1.4
pWert <= alpha


## d) ----
# H0: mu >= 745 gg. H1: mu < 745 mit sigma^2 BEKANNT
# Siehe Bemerkung bei (c).
# Berechnung der Teststatistik in (c) schon erledigt.

# i) Testentscheidung mittels kritischem Wert:
(krit.Wert <- qnorm(alpha))  # = -qnorm(1 - alpha)
teststat <= krit.Wert

# ii) Testentscheidung mittels p-Wert:
(pWert <- pnorm(teststat))
pWert <= alpha




# Erweiterung ----
#*****************
# Hier folgt eine eigene Implementation des Gaußtests
# als Funktion. Sie ist eine geeignete Anpassung einer
# stark "abgespeckten" Version der R-Funktion t.test,
# deren R-Code man im Original durch die Eingabe von
# stats:::t.test.default am R-Prompt erhält.

gauss.test <- function(x, sigmax, y = NULL, sigmay = NULL,
                       alternative = c("two.sided", "less",
                                       "greater"),
                       mu = 0, conf.level = 0.95) {

# Ein- oder Zweistichproben-Gaußtest für normalverteilte
# Stichproben mit bekannter(!) Populationsstandardabweichung.

# Notwendige Funktionsargumente:
# x            Datenvektor der Stichprobe (SP).
# sigmax       Wert der Standardabweichung der Population,
#              aus der die x-SP gezogen wurde.

# Optionale Funktionsargumente:
# y            Datenvektor der zweiten SP;
#              Voreinstellung: NULL.
# sigmay       Wert der Standardabweichung der Population,
#              aus der die y-SP gezogen wurde;
#              Voreinstellung: NULL.
# alternative  Typ der Alternative: "two.sided", "greater"
#              oder "less"; Voreinstellung: "two.sided".
# mu           Hypothetisierter Erwartungswert im Ein-SPn-Test
#              bzw. hypothetisierte Erwartungswertedifferenz
#              im Zwei-SPn-Test; Voreinstellung: 0.
# conf.level   Niveau des Konfidenzintervalls für den in der
#              Hypothese betrachteten Parameter;
#              Voreinstellung: 95 %.

# Rückgabe der Funktion: Eine Liste mit einigen (Zwischen-)
# Ergebnissen des Tests, mit den folgenden Komponenten:
#
# statistic    Wert der verwendeten Teststatistik.
# estimate     Schätzwert des Parameters, auf den sich die
#              Hypothese bezieht.
# null.value   Hypothetisierter Parameterwert.
# alternative  Art der Alternativ-Hypothese (zweiseitig, ein-
#              seitig kleiner oder einseitig groesser).
# method       Verwendete Test-Methode (Ein- oder Zwei-SPn-
#              Gaußtest).
# p.value      p-Wert des Tests.
# conf.int     Konfidenzintervall des Parameters, auf den sich
#              die Hypothese bezieht.
# conf.level   Niveau des Konfidenzintervalls.
# data.name    Name/n des/der übergebenen Datenvektors/en.
#*************************************************************

 alternative <- match.arg(alternative)  # Kontrolle und evtl.
              # Vervollständigung der Eingabe für alternative.

 nx <- length(x);   mx <- mean(x)   # Hilfsgrößen auf Vorrat.

 if(is.null(y)) {    ### Einstichproben-Gaußtest###
   stderr <- sigmax / sqrt(nx)  # Berechnen von Hilfsgrößen
   tstat <- (mx - mu) / stderr  # und Teststatistik.

   estimate <- c("mean of x" = mx)    # Sammeln und Vorbe-
   method <- "One Sample Gauss-test"  # reiten von Ausgabe-
   dname <- deparse(substitute(x))    # Informationen.

  } else {             ### Zweistichproben-Gaußtest###
   if(is.null(sigmay)) stop("sigmay is missing!")

   ny <- length(y);    my <- mean(y)          # Berechnen von
   stderr <- sqrt(sigmax^2/nx + sigmay^2/ny)  # Hilfsgrößen
   tstat <- (mx - my - mu) / stderr           # und Teststa-
                                              # tistik.

   estimate <- c("mean of x" = mx,         # Sammeln und 
                 "mean of y" = my)         # Vorbereiten
   method <- "Two Sample Gauss-test"       # von Ausgabe-
   dname <- paste(deparse(substitute(x)),  # Informationen.
                  "and", deparse(substitute(y)))
   }

 if(alternative == "less") {  ### Einseitige "untere"###
                              ### Alternative        ###
   pval <- pnorm(tstat)  # Berechnen des p-Werts.
   cint <- c(-Inf,                      # Vorbereitung des
             tstat + qnorm(conf.level)) # Konf.-intervalls.

  } else
   if(alternative == "greater") {  ### Einseitige "obere"###
                                   ### Alternative       ###
     pval <- pnorm(tstat, lower = FALSE)   # p-Wert.
     cint <- c(tstat - qnorm(conf.level),  # Konf.-intervall-
               Inf)                        # vorbereitung.

    } else {                   ### Zweiseitige Alternative###
     pval <- 2 * pnorm(-abs(tstat))  # p-Wert.
     alpha <- 1 - conf.level         # Konfidenz-
     cint <- qnorm(1 - alpha/2)      # intervall-
     cint <- tstat + c(-cint, cint)  # vorbereitung.
    }

  cint <- mu + cint * stderr  # Eigentliches Konf.-intervall
  attr(cint, "conf.level") <- conf.level  # mit Niveau-Info.

  names(tstat) <- "z"                      # Weitere
  names(mu) <- if(is.null(y)) "mean" else  # Ausgabe-
                 "difference in means"     # Infos.

  rval <- list(statistic = tstat, p.value = pval,   # Sammeln
               conf.int = cint, estimate = estimate,# aller
               null.value = mu,                     # Ergeb-
               alternative = alternative,           # nisse.
               method = method, data.name = dname)
  class(rval) <- "htest"  # Klasseneigenschaft "htest" sorgt
                          # für die automatische, "übliche"
                          # Formatierung der Ergebnisausgabe.
  return(rval)
  }


## Anwendungsbeispiele ----
# set.seed(111)
# xx <- rnorm(20);     yy <- rnorm(35, mean = 4)
# gauss.test(xx, sigmax = 1, mu = 3, alternative = "less")
# gauss.test(x = xx, sigmax = 1, y = yy, sigmay = 1, mu = -5)
# gauss.test(x = xx, sigmax = 1, y = yy, sigmay = 1, mu = -10,
#            alternative = "g")
# rm(xx, yy)


## Anwendung auf die Aufgaben c) und d) ----
#*******************************************
gauss.test(x = Schmelztemperaturen, sigmax = sqrt(4979.47),
           mu = 745)

gauss.test(x = Schmelztemperaturen, sigmax = sqrt(4979.47),
           mu = 745, alternative = "less")



# Aufräumen ----
#**********
#rm(eda, qqnorm.sim)  # Werden in weiteren Aufgaben benötigt.
rm(Schmelztemperaturen, alpha, gauss.test, krit.Wert, n)
rm(pWert, teststat)

# R-technischer Hinweis: Ab einer gewissen Objekteanzahl ist
# es weniger tippaufwändig als in den vorherigen drei Zeilen,
# wenn sie wie folgt vorgehen: Die Namen der *nicht* zu
# löschenden Objekte zusammenstellen, mit match ihre Posi-
# tionsnummern im workspace suchen lassen, die *anderen*
# Elemente aus der Rückgabe von ls auswählen und an rm
# "füttern":
# behalten <- c("eda", "qqnorm.sim")
# rm(list = ls()[-match(behalten, ls())])

graphics.off()
