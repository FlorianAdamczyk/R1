### Name: Alexander Rohrer
### Matrikelnummer: 8120463

### Aufgabe 3


#*******************************************************************************************
# 3 a)

# Bei 3 % Ausschussquote wäre normalerweise im Schnitt
# bei 100 Stücken, 3 Ausschusstücke erwartet worden
# Hier werden allerdungs 5 produziert

#*******************************************************************************************
# 3 b)

n <- 100
p <- 0.03
k <- 5

wahrsch_min_5 <- 1 - pbinom(k-1, n, p)

# Gibt die Wahrscheinlichkeit an, dass mindestens 5 Ausschussstücke 
# bei einer Wahrscheinlichkeit von 3 % auftreten

# Da die Wahrscheinlichkeit für 5 Ausschusteile bei 3 % Ausschussquote
# bei 0.1821452 liegt, spricht die Beobachtung gegen die Quote von 3 %
# Bei 3 Auschüttungsstücken wären es 0.5802249 gewesen