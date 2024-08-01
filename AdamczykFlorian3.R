# Adamczyk Florian 8105234

# Aufgabe 3
# Ein Produktionsverfahren f¨ur ein Werkst¨uck liefere angeblich h¨ochstens 3 % Ausschuss. Es werden 100 unabh¨angig voneinander damit hergestellte Werkst¨ucke der Qualit¨atskontrolle unterzogen. F¨unf der 100 St¨ucke ergeben sich zu Ausschuss.

# a) 
# 5% Ausschuss wären zu erwarten bei 5 von 100 in der Stichprobe.

# b)
# Spricht die Beobachtung von f¨unf St¨ucken Ausschuss gegen die angebliche Schwelle von 3 %? Begr¨unden Sie Ihre Antwort und ziehen Sie dazu die Wahrscheinlichkeit heran, mit der ein mindestens so schlechtes Ergebnis in dem Produktionsverfahren zu beobachten w¨are, wenn die Ausschussquote tats¨achlich 3 % betr¨uge!

# Wir können die Wahrscheinlichkeit berechnen, dass 5 oder mehr Ausschussstücke in einer Stichprobe von 100 Stücken vorkommen, wenn die Ausschussquote tatsächlich 3% beträgt.
# Das ist eine Binomialverteilung mit n=100 und p=0.03
# Wir berechnen die Wahrscheinlichkeit für 0 bis 4 Ausschussstücke und ziehen das von 1 ab, um die Wahrscheinlichkeit für 5 oder mehr Ausschussstücke zu erhalten.

1-pbinom(4, 100, 0.03, lower.tail = FALSE)

# es ist relativ wahrscheinlich, dass 5 oder mehr Ausschussstücke in einer Stichprobe von 100 Stücken vorkommen, wenn die Ausschussquote tatsächlich 3% beträgt.
# das liegt einfach an der Wahrscheinlichkeit, es sind nicht immer genau 3 und 5 ist jetzt nicht so viel mehr als 3, dass es unwahrscheinlich wäre.
# das liegt an der geringen Anzahl an Stücken in der Stichprobe, dass es so wahrscheinlich ist, dass 5 oder mehr Ausschussstücke vorkommen.
# wenn man die Stichprobe vergrößern würde, würde es unwahrscheinlicher werden, dass 5 oder mehr Ausschussstücke vorkommen.

1-pbinom(4, 500, 0.03, lower.tail = FALSE)
 # deutlich unwahrscheinlicher.