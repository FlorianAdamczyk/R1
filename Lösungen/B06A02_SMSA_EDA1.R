### Blatt 6, Aufgabe 2: Univariate grafische EDA diverser
### SMSA-Daten.
### R 4.3.3, 6.6.2024
###******************************************************

# a), b), c) ----
#****************
# Wir werden die Daten einer jeden der drei Variablen
# nach Regionen getrennt durch "parallele" Boxplots
# veranschaulichen.

# Annahme: Import der SMSA- und SMSAID-Daten erfolgte
# bereits z. B. wie in Aufgabe 1 dieses Blattes i. V. m.
# Aufgabe 3 auf Blatt 5.

## Boxplots mit Formelvariante ----
#**********************************
# Beachte: Die Formelvariante der Funktion boxplot be-
# nötigt weder split noch with, geschweige denn attach!
#******************************************************
boxplot(Physicians ~ Region, data = SMSA.df,
        xlab = "Geografische Region",
        ylab = "Anzahl praktizierender Ärzte/innen")

boxplot(Graduates ~ Region, data = SMSA.df,
        ylim = c(0, 100), # Wie oben.
        xlab = "Geografische Region",
        ylab = "Prozent an High-School-AbsolventInnen")

boxplot(Income ~ Region, data = SMSA.df,
        xlab = "Geografische Region",
        ylab = "Privates Gesamteinkommen")


## Boxplots ohne Formelvariante ----
#***********************************
# Beachte: boxplot-Aufrufe mit Hilfe der Fkt. split:
# Dazu untersuchen wir zunächst, was split liefert.
#***************************************************
with(SMSA.df,
     split(Physicians, Region))
# Ergebnis: Eine Liste mit einer Komponente pro Level
# des Faktors Region; hier also vier Komponenten namens
# "NE", "NC", "S" und "W". In diese Komponenten sind
# die Werte aus Physicians gemäß der Levels von Region
# aufgeteilt ("gesplittet") worden.

# Nun die boxplot-Aufrufe mit Hilfe von split:
with(SMSA.df,
     boxplot(split(Physicians, Region),
             xlab = "Geografische Region",
             ylab = "Anzahl praktizierender Ärzte/innen")
                                           # \304rzte
     )

with(SMSA.df,
     boxplot(split(Graduates, Region),
             ylim = c(0, 100),# Um gesamte %-Skala zu zeigen
             xlab = "Geografische Region",
             ylab = "Prozent an High-School-AbsolventInnen")
     )

with(SMSA.df,
     boxplot(split(Income, Region),
             xlab = "Geografische Region",
             ylab = "Privates Gesamteinkommen")
     )


# Ordnungsgemäßes Schließen des Grafikfensters
#*********************************************
dev.off()


# Beachte: Es wird NICHTS gelöscht,
# da es später noch gebraucht wird.
