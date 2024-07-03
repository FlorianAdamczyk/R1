### Blatt 7, Aufgabe 1: Weitere EDA der SMSA-Daten.
### R 4.3.3, 13.6.2024
###****************************************************

# Import & Vorbereitung ----
#***************************
# Erneutes Einlesen und Formatieren der SMSA-Daten
# wie in A. 1 auf Bl. 6 i. V. m. A. 3 auf B. 5.
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
SMSA.df$Region <- factor(SMSA.df$Region, levels = 1:4,
                         labels = c("NE", "NC", "S", "W"))


# a) Häufigkeitsverteilung der Region ----
#*****************************************
(Regionen.HKTabelle <- table(SMSA.df$Region))

pie(Regionen.HKTabelle,
    main = "Verteilung der SMSAs auf die Regionen",
    labels = c("North-East", "North-Central", "South",
               "West"))

dotchart(Regionen.HKTabelle,
         xlim = c(0, max(Regionen.HKTabelle)),
                    # Warum nötig?
         xlab = "Absolute Anzahl",
         main = "Anzahl der SMSAs pro Region",
         labels = c("North-East", "North-Central",
                    "South", "West"))
  # Die ausgegebene Warnung ist schon im Skript
  # erwähnt.


# b) Boxplots für alle metrischen Variablen ----
#***********************************************
# Identifiziere zunächst automatisch ALLE metrischen
# (= numeric-)Komponenten, die SMSA.df enthält ...
(metrisch <- sapply(SMSA.df, is.numeric))

# ... und wende dann die Fkt. boxplot auf diejenigen
# Komponenten in SMSA.df an, für die sich im korres-
# pondierenden Element des logischen Vektors metrisch
# der Wert TRUE befindet:
#****************************************************
boxplot(SMSA.df[metrisch])
  # Fazit: Offenbar weder grafisch noch inhaltlich
  # sinnvoll, da die betrachteten Variablen extrem
  # unterschiedliche Wertebereiche belegen und
  # außerdem "inkommensurabel" im physikalischen
  # Sinne sind (also verschiedene Einheiten/Dimen-
  # sionen besitzen).

## Hinweis ---- 
#**************
# Für ungruppierte Daten funktioniert die Formel-
# variante von Boxplot nicht (so ohne Weiteres).


# Sinnvoller als obige Darstellung ist hier die eines
# jeden Boxplots in einem eigenen Koordinatensystem:
par(mfrow = c(2, 5)) # Vorgriff auf Kap. 7: Dies hier
  # öffnet einen sogenannten (2 x 5)-Mehrfachplotrah-
  # men mit zwei Zeilen und fünf Spalten, in dessen
  # Rahmen die Grafiken zeilenweise (= "row wise")
  # eingezeichnet werden.

lapply(SMSA.df[metrisch], boxplot) # Sukzessive und
  # separate Anwendung von boxplot auf die Kompo-
  # nenten von SMSA.df[metrisch].

  # Nachteil: So werden keine Komponentennamen in den
  # Grafiken platziert. Auch lässt die unnötig große
  # Menge an ungenutzter, weißer Fläche im Mehrfach-
  # plotrahmen noch etwas zu wünschen übrig. Dazu
  # werden in Kap. 7 Lösungen geliefert.


# c) Pairs-Plot für alle metrischen Variablen ----
#*************************************************
# (Etwas im Vorgriff auf Paragraph 4.3.2!)
# Wende -- analog zu b) -- nun die Fkt. pairs
# auf die Komponenten von SMSA.df[metrisch] an:
pairs(SMSA.df[metrisch])
  # Beachte, dass SMSA.df[metrisch] offenbar
  # automatisch wie eine Matrix behandelt wird.

  # Beachte die Wirkung für Faktoren:
 pairs(SMSA.df) # Offenbar wird der Faktor "Region"
   # automatisch als eine numeric-Variable (!) inter-
   # pretiert und so der ganze Data Frame SMSA.df als
   # numeric-Matrix auffassbar. Ist das im Fall der
   # "Region" sinnvoll?

# Variante: Verwendung der Formelvariante von pairs
# gemäß der Informationen aus ihrer Hilfeseite zu
# ihrem Argument formula:
#**************************************************
pairs(~ Area + Pop + CityPop + PopOver65 + Physicians +
        HospBeds + Graduates + LaborForce + Income +
        Crimes, data = SMSA.df)

  # Die explizite Auswahl und gewählte Reihenfolge
  # der Variablen hat Entsprechendes zur Folge:
  #***********************************************
pairs(~ Crimes + CityPop + PopOver65 + Physicians +
        Income + Area, data = SMSA.df)

# d) c mit ausgewählten Transformationen ----
#********************************************
  # Transformationen einzelner Variablen können direkt
  # in der Formel eingesetzt werden. Natürlich sind
  # dabei nur streng monotone Transformationen sinn-
  # voll, damit garantiert ist, dass die Ordnung in
  # den Daten erhalten bleibt. Geeignete nichtlineare
  # Transformationen führen im Idealfall zu einer
  # Symmetrisierung sowohl der univariaten als auch
  # der bivariaten Verteilungen sowie evtl. zur
  # Abschwächung der Ausreißereigenschaft. Hier am
  # Bsp. einzelner log-Transformationen:
  #***************************************************
pairs(~ log(Crimes) + CityPop + PopOver65 + 
        log(Physicians) + log(Income) + log(Area),
      data = SMSA.df)

dev.off()



## Zusatzinformation ----
#************************
# Es steht ein umfangreiches R-Paket extrem leistungs-
# fähiger Grafikfunktionen namens "lattice" zur Verfü-
# gung, welches ein spezielles Grafik-Device namens
# "trellis" verwendet (s. in der Skriptliteratur z. B.
# Sarkar (2008)).
 library(lattice) # Stellt das lattice-Paket zur Ver-
                  # fügung, falls es installiert ist.
 search()         # Nur zur Kontrolle des Suchpfades.

 splom(~ SMSA.df[metrisch]) # = "scatterplot matrix"
 splom(~ SMSA.df[metrisch] | SMSA.df$Region)
       # Beachte den Unterschied!

 # Bemerkung: Natürlich sind die Schriftgrößen von
 # Tickmarkbeschriftung und Variablennamen variierbar.


# Aufräumen ----
#***************
dev.off();   rm(Regionen.HKTabelle, metrisch)
