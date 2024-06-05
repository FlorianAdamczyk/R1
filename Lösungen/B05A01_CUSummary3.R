### Blatt 5, Aufgabe 1: Weiteres Experimentieren mit dem
### Data Frame cu.summary
### R 4.3.3, 29.5.2024
###*******************************************************

# Zur-Verfügung-Stellen von cu.summary ----
#******************************************
# Ergänzung von Aufgabe 3 auf Blatt 4: Erneutes
# Zur-Verfügung-Stellen des Objektes "cu.summary" aus
# dem Paket "rpart" wie in A. 2 von Bl. 3:
data(cu.summary, package = "rpart");    ls()


# a) Unterschiede zw. apply und lapply bzw. sapply ----
#******************************************************
apply(cu.summary, 2, class)

lapply(cu.summary, class)
# Beachte den Unterschied zum Resultat von obigem
# apply: Offenbar hat apply *vor* der eigentlichen 
# Anwendung von class auf die Variablen von
# cu.summary eine (temporäre!) Änderung der
# Variablen-Modi in "character" vorgenommen.

sapply(cu.summary, class)
# Ist inhaltlich dasselbe wie bei lapply, und auch
# strukturell, da eine _S_implifizierung der Resultat-
# liste zu einem Vektor nicht möglich ist (und zwar
# wegen der Komponente Reliability, in der ein zwei-
# elementiger Vektor steht, im Gegensatz zu den übri-
# gen, einelementigen Vektoren).
# Bsp. für length und summary aus Platzgründen
# weggelassen.


# b) Umwandlung in eine Matrix ----
#**********************************
as(cu.summary, "matrix")
# Die Einträge von cu.summary (mit den vormals unter-
# schiedlichen Modi numeric, factor und ordered) wer-
# den bei der erzwungenen, temporären Umwandlung des
# Data Frames in eine Matrix offenbar alle in den
# einheitlichen Modus character konvertiert.

# Alternative "Kurzform":
as.matrix(cu.summary)


# c) with ----
#*************
?with # und/oder Paragraph 2.10.9 im V-Skript.


# d) unique vs. levels ----
#**************************
with(cu.summary, unique(Type))
# Ohne with wäre unique(cu.summary$Type) zu verwenden.

with(cu.summary, levels(Type))
# Ohne with wäre levels(cu.summary$Type) zu verwenden.

# Bis auf die Reihenfolge in der Ausgabe des Resultats
# und die Verwendung bzw. Nicht-Verwendung von Anfüh-
# rungszeichen scheinen unique und levels bei der An-
# wendung auf einen Faktor dasselbe zu liefern. Beach-
# jedoch den folgenden Unterschied:
#
# with(cu.summary, class(unique(Type)))
# [1] "factor"
#
## Fazit: unique übernimmt den Modus seines Arguments
## - hier factor - fürs Resultat, während levels den
## character-Vektor der Levels liefert:
#
# with(cu.summary, class(levels(Type))
# [1] "character"


# Entsprechend (aber für Country beides zusammen in
# einem with; beachte, dass dabei für den Ausdruck der
# Resultate der nicht-letzten Befehle print nötig ist):
with(cu.summary, {
  print(unique(Country))
  levels(Country)
  })


# e) Kontigenztafel zu Country und Type ----
#*******************************************
with(cu.summary, table(Country, Type))


# f) Berechnungen pro Type: tapply ----
#**************************************
# Mittlere Preise der Fahrzeugtypen:
with(cu.summary, tapply(Price, Type, mean))

# Standardweichungen der Preise der Fahrzeugtypen:
with(cu.summary, tapply(Price, Type, sd))

# Variationskoeffizienten der Preise der Fahrzeugtypen:
with(cu.summary,
     tapply(Price, Type, sd) / tapply(Price, Type, mean))

# Oder unter Verwendung einer selbstdefinierten (hier
# "anonymen") Funktion, deren Konzept im V-Skriptkapitel
# 6 vorgestellt wird:
with(cu.summary,
     tapply(Price, Type, function(x) sd(x) / mean(x)))


# Aufräumen ----
#***************
rm(list = ls())
