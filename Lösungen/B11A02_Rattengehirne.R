### Blatt 11, Aufgabe 2: Einstichprobentest (para- oder
### nichtparametrisch?)
### R 4.3.3, 18.7.2024
###******************************************************

# Datenimport ----
#*****************
# Einlesen der beobachteten Differenzen in
# der Zunahme der Gewichte der Rattengehirne
(Differenz <- scan("Rattengehirne", skip = 1))


# Hilfsfunktionen ----
#*********************
# Wollen i. F. eda und qqnorm.sim nutzen. Dazu kopiert
# man sich entweder den R-Code der Fkts.-definitionen
# hierher oder lädt ihn in die laufende R-Session mit
# Hilfe von source aus einer separaten R-Datei, in die
# er vorher "ausgelagert" wurde (hier namens
# "B11_Hilfsfunktionen.R"). Letzteres ist oft zu bevor-
# zugen, da es den hiesigen Code "schlanker" und modula-
# rer macht:
source("B11_Hilfsfunktionen.R", encoding = "UTF-8")

# Hinweis: `encoding = "UTF-8"` ist nötig, da die Datei
# von mir in RStudio angefertigt wurde, das für die mit
# ihm generierten Dateien das Encoding UTF-8 verwendet,
# aber die R-Session unter Windows i. d. R. mit dem En-
# coding Windows-1252 (= cp-1252) läuft, was zur fal-
# schen Darstellung der deutschen Umlaute führt.

# Bemerkung: Die beiden Hilfsfunktionen wurden gegenüber
# ihren Versionen im Vorlesungsskript geringfügig modi-
# fiziert. Details finden sich in den Kommentaren in
# Ihrer Quell-Datei.


# EDA ----
#*********
# Nun ihr Einsatz:
eda(Differenz);   x11()   # Zweifel an der Normalvertei-
qqnorm.sim(Differenz)     # lungsannahme oder an der Un-
                          # abhängigkeit der Daten?
car:::qqPlot(Differenz,   # Nein; daher wird nun ein
             id = FALSE,  # t-Test durchgeführt.
             envelope = list(style = "lines"))

# Inferenz ----
#**************
# (Parametrischer) t-Test für H_0: \mu_D <= 0 gg.
# H_1: \mu_D > 0, wobei \mu_D der Erwartungswert
# (d. h. Populationsmittelwert) der Differenzen
# in der Zunahme der Gewichte der Rattengehirne sei:
t.test(Differenz, alternative = "greater")


## Lediglich der Vollständigkeit halber ----
#*******************************************
# Wilcoxons (nichtparametrischer) Vorzeichen-Rangsummen-
# test für H_0: \theta_D <= 0 gg. H_1: \theta_D > 0,
# wobei \theta_D der Shift (hier der Populationsmedian)
# der Verteilung der Differenzen in der Zunahme der
# Gewichte der Rattengehirne "weg von der 0 (Null)" sei:
wilcox.test(Differenz, alternative = "greater")


## Problem ----
#**************
## p-Wert aufgrund von Bindungen (wo?) in den Daten
## nicht exakt.
## Frage: Wie zuverlässig ist der p-Wert und damit das
## Testergebnis?
## Zur Beurteilung der Robustheit der Ergebnisses: Auf-
## brechen der Bindungen mit Hilfe von jitter.
## Technische Frage: Warum ist das Testergebnis für un-
## terschiedlich ge-jitter-te Versionen dieser Daten
## stets dasselbe?
## Inhaltliche Frage: Wie interpretiert bzw. "kommuni-
## ziert" man überhaupt das erzielte Testergebnis
## \theta_D > 0 (anschaulich)?


# Aufräumen ----
#***************
#rm(eda, qqnorm.sim)# Werden im Folgenden noch benötigt.
rm(Differenz);   graphics.off()
