### Blatt 2, Aufgabe 3: Die "Old Faithful"-Daten.
### R 4.3.3, 9.5.2024
###***************************************************

# Um im Folgenden Tipparbeit zu sparen
wait <- faithful$waiting;   erup <- faithful$eruptions

# a) ----
min(wait);   max(wait);   mean(wait);   sd(wait)

# b) ----
which.min(wait);   which.max(wait)

# c) ----
quantile(wait, prob = 0.7)   # = kleinste Schwelle,
   # bis zu der 70 % aller Wartezeiten liegen (also
   # kleiner oder gleich dieser Schwelle sind) =
   # größte Schwelle, über der 30 % aller Warte-
   # zeiten liegen.

# d) ----
kurz <- wait <= 60;   kurze.wartezeiten <- wait[kurz]

# e) ----
length(wait)
length(kurze.wartezeiten)

 # oder
sum(kurz)

# f) ----
erup.nach.kurzer.wartezeit <- erup[kurz]

# g) ----
mean(wait);   mean(kurze.wartezeiten)
mean(erup);   mean(erup.nach.kurzer.wartezeit)

# h) ----
sum(erup[kurz] >= 2.5)

# i) ----
plot(faithful$waiting, faithful$eruptions)

 # Denkanstöße zur Strukturbeschreibung und Interpre-
 # tation dieser 2-dimens. Datenverteilung/Punkte-
 # wolke (ohne dass erwartet wird, dass Sie sie
 # bereits "fachlich perfekt" umsetzen/bearbeiten
 # können):
 #
 # - Ist sie symmetrisch (wie z. B. kugelförmig oder
 # ellipsoid) oder asymmetrisch (z. B. so, dass sich
 # ein Bereich hoher Datenkonzentration/-dichte an 
 # einem Rand oder in einer "Ecke" der Punktewolke
 # zeigt)?
 #
 # - Sind Cluster ("Klumpen") erkennbar?
 #
 # - Ist ein Trend (sprich ein tendenzieller Zusam-
 # menhang zw. x- und y-Variable) sichtbar oder
 # nicht? Wenn ja, ist er positiv oder negativ,
 # ist er linear oder "nur" monoton, ist er "stark"
 # oder "schwach"? (Was könnte hier mit "stark"
 # und "schwach" gemeint sein?)
 #
 # - Ist der Trend "durchgängig" oder ist er auf
 # evtl. vorliegende Cluster zurückzuführen?
 #
 # - Liegen einzelne "Ausreißer" vor? (Was könnte das
 # wohl sein?) 

 # Auf all die obigen Konzepte werden wir im Kurs
 # noch näher eingehen.

# Aufräumen ----
#***************
dev.off() # Schließt das durch plot geöffnete
          # Grafikfenster ordnungsgemäß.
rm(list = ls())
