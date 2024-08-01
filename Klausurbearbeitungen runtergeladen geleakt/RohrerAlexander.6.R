### Name: Alexander Rohrer
### Matrikelnummer: 8120463

### Aufgabe 6


#*******************************************************************************************
# 6 a)

knaeul <- scan("Wollknaeuelgewichte2024.txt")
sum(is.na(knaeul))
str(knaeul)

# Auch hier keine fehlenden Werte
# Alle Werte liegen nah beieinander
#*******************************************************************************************
# 6 b)

# Ich importiere eine Funktion aus meinem Hilfsfunktionen sheet
# DAmit lasse ich mir mehrere Normalverteilungen als Q-Q-Plot angeben
# und vergleiche die Verteilungen mit der der Wollknäuel

source("Hilfsfunktionen.R", encoding = "UTF-8")

qqnorm.sim(knaeul)

# Ein Großteil der Daten liegt präzise Auf einer Geraden,
# aber die größeren Werte um 51 herum, sind Extremwerte und können
# als Ausreißer gesehen werden, die Normalverteilung kaputt machen
# keine andere Normalverteilungen besitzt Ausreißer mit einer
# solche starken Abweichung
# Wichtig zu erwähnen ist aber acuh, dass es nur 20 Datenpunkte sind
# und damit keine Aussage über die tatsächliche Normalverteilung
# über Wickelgewichte im Allgemeinen treffen kann.
# Nur in dieser Verteilung wäre die Normalverteilungshypothese anzweifelbar

#*******************************************************************************************
# 6 c)

# Hier würde ich einen 2-seitigen T-Test anwenden, da der Mittelwert (in dem Fall Median)
# bestimmbar ist und es um das Abweichen in beide Richtungen vom Mittelwert geht
# Für den T-test braucht es allerdings eine Normalverteilung als 
# Voraussetzung und die ist in diesem Fall anzweifelbar, aber nicht
# vollends überprüfbar, da es nur 20 Datenpunkte gibt und daraus
# keine Ablehnung der Herrstellerangabe folgen sollte
# Evtl sind die Ausreißer aus der Stichprobe gar keine Ausreißer 
# in der Grundgesamtheit
# Außerdem sollten Beobachtungen unabhängig voneinander sein.


#*******************************************************************************************
# 6 d)

# Da ich überprüfen möchte, ob eine Abweichung vom Mittelwert stattfindet wähle
# ich für die Nullhypthese H0 = Sollgewicht) und für die
# Alternativhypthese h1 != Sollgewicht
# Eine entscheidende Größe ist das Signifikanz niveau, das
# vorher festlegt wie viel Fehlertoleranz legitim ist und wie sicher
# das Ergebnis sein soll
# Überblicherweise liegt das Signifikanzniveau bei etwa 0.05
# Liegt der p Wert (bestimmt durch den t-test) unter dem Signifikanzniveau
# wird die Nullhypothese abgelehnt. Liegt er drüber, kann sie nicht
# abgelehnt werden
# Die Nullhypothese wird damit NICHT bestätigt, sondern nur nicht abgelehnt


#*******************************************************************************************
# 6 e)

# Auch wenn die Normalverteilung anzweifelbar ist, führe ich den t-test durch

mu <- 50
t.test(knaeul, mu=mu, alternative = "two.sided")

# der p-value liegt bei 0.02 (< 0.05) daher kann die Nullhypothese,
# dass der Mittelwert dem Median enstspricht, abgelehent werden
# Ich würde den Herrsteller aber nicht anzeigen, da es nur 20 Samples sind
# Dafür würde man mich auslachen