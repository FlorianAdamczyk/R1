# Günther, Martin---
# Matrikelnr.8119146
#******************************************************
# Aufgabe 3
#******************************************************

#a

# Rechnerischer Ausschuss
ausschuss_rechn <- (100*0.03)
# Es wären 3 zu erwarten


#b
1-pbinom(5, 100, 0.03)




# Ergebnis 0.08083713
# mithin haben wir rund 8% Wahrscheinlichkeit, bei 3% Ausschuss, 5 Stück zu 
# beobachten. Da dies nicht besonders viel ist,

#vergleich mit 3
1-pbinom(3, 100, 0.03)

# Da nur in rund 35& der Fälle tatsächlich 3 beobachtet werden können,
# scheint es durchaus möglich, dass der reale Ausschuss bei 3 dliegt


# Aufräumen ----
#***************
rm(list = ls())