# Florian Adamczyk R Aufgabenblatt 8
#Aufgabe 1a
print(pnorm(112, mean = 105, sd = sqrt(25)))

# b)
# Berechnung der Wahrscheinlichkeit, dass der Betrag der t-verteilten Zufallsvariable höchstens 2.1 ist
freiheitsgrade <- 7
print(pt(2.1, df = freiheitsgrade) - pt(-2.1, df = freiheitsgrade))

#c) 
print(punif(-1.8, min = -2, max = 2))

#d)
print(1 - pf(6.3, df1 = 7, df2 = 5))

# Aufgabe 2
# a)
# Berechnung der Wahrscheinlichkeit für genau 10 "Kopf" in 20 Würfen einer unfairen Münze
anzahl_wuerfe <- 20
anzahl_erfolge <- 10
wahrscheinlichkeit_kopf <- 2/3
# Binomialverteilung verwenden, da es sich um unabhängige Wiederholungen handelt
wahrscheinlichkeit_genau_10_kopf <- dbinom(anzahl_erfolge, size = anzahl_wuerfe, prob = wahrscheinlichkeit_kopf)
print(wahrscheinlichkeit_genau_10_kopf)

#b) 
# Parameter definieren
gesamt_sicherungen <- 250
defekte_sicherungen <- gesamt_sicherungen * 0.06 # 6% Ausschussquote
gekaufte_sicherungen <- 4

# Wahrscheinlichkeiten berechnen
wahrscheinlichkeit_0_defekt <- dhyper(0, defekte_sicherungen, gesamt_sicherungen - defekte_sicherungen, gekaufte_sicherungen)
wahrscheinlichkeit_1_defekt <- dhyper(1, defekte_sicherungen, gesamt_sicherungen - defekte_sicherungen, gekaufte_sicherungen)
wahrscheinlichkeit_2_defekt <- dhyper(2, defekte_sicherungen, gesamt_sicherungen - defekte_sicherungen, gekaufte_sicherungen)
wahrscheinlichkeit_3_defekt <- dhyper(3, defekte_sicherungen, gesamt_sicherungen - defekte_sicherungen, gekaufte_sicherungen)
wahrscheinlichkeit_4_defekt <- dhyper(4, defekte_sicherungen, gesamt_sicherungen - defekte_sicherungen, gekaufte_sicherungen)

# Wahrscheinlichkeiten ausgeben
print(wahrscheinlichkeit_0_defekt)
print(wahrscheinlichkeit_1_defekt)
print(wahrscheinlichkeit_2_defekt)
print(wahrscheinlichkeit_3_defekt)
print(wahrscheinlichkeit_4_defekt)

sum_defekt <- wahrscheinlichkeit_0_defekt + wahrscheinlichkeit_1_defekt + wahrscheinlichkeit_2_defekt + wahrscheinlichkeit_3_defekt + wahrscheinlichkeit_4_defekt
print(sum_defekt) # sollte 1 sein, und ist es auch!

# c)
# Wahrscheinlichkeit, dass die ersten fünf Spiele nicht Rot sind
wahrscheinlichkeit_nicht_rot <- (1 - 18/37)^5

# Wahrscheinlichkeit, dass das sechste Spiel Rot ist
wahrscheinlichkeit_rot <- 18/37

# Gesuchte Wahrscheinlichkeit
gesuchte_wahrscheinlichkeit <- wahrscheinlichkeit_nicht_rot * wahrscheinlichkeit_rot
print(gesuchte_wahrscheinlichkeit)

#d)
# Durchschnittliche Anzahl an Patienten pro Stunde
lambda <- 6.9

# Berechnung der Wahrscheinlichkeit, dass mindestens 10 Patienten eintreffen
wahrscheinlichkeit_mindestens_10 <- 1 - ppois(9, lambda)
print(wahrscheinlichkeit_mindestens_10)

#e)
# Parameter definieren
n <- 25 # Anzahl der Patienten
p <- 0.1 # Wahrscheinlichkeit einer Unverträglichkeitsreaktion

# Wahrscheinlichkeit für 0 Reaktionen
p_0 <- dbinom(0, n, p)

# Wahrscheinlichkeit für 1 Reaktion
p_1 <- dbinom(1, n, p)

# Gesamtwahrscheinlichkeit für höchstens eine Reaktion
p_hoechstens_1 <- p_0 + p_1
print(p_hoechstens_1)

#f)
# Parameter definieren
lambda <- 1/2
# Wahrscheinlichkeit, dass ein Bauteil weniger als 1 Jahr hält
p_ein_bauteil_kleiner_1 <- pexp(1, lambda)
# Wahrscheinlichkeit, dass alle drei Bauteile weniger als 1 Jahr halten
p_alle_drei_kleiner_1 <- p_ein_bauteil_kleiner_1^3
print(p_alle_drei_kleiner_1)

# Aufgabe 3: Quantile:
# Quantile der t-Verteilung mit 4 Freiheitsgraden berechnen
quantile_oberes_5 <- qt(0.95, 4)
quantile_unteres_5 <- qt(0.05, 4)
quantile_oberes_2.5 <- qt(0.975, 4)
quantile_unteres_2.5 <- qt(0.025, 4)
quantile_oberes_1 <- qt(0.99, 4)
quantile_unteres_1 <- qt(0.01, 4)
quantile_oberes_0.5 <- qt(0.995, 4)
quantile_unteres_0.5 <- qt(0.005, 4)
quantile_oberes_0.1 <- qt(0.999, 4)
quantile_unteres_0.1 <- qt(0.001, 4)

# Ausgabe der Quantile
cat("Oberes 5%-Quantil:", quantile_oberes_5, "\nUnteres 5%-Quantil:", quantile_unteres_5, "\n")
cat("Oberes 2.5%-Quantil:", quantile_oberes_2.5, "\nUnteres 2.5%-Quantil:", quantile_unteres_2.5, "\n")
cat("Oberes 1%-Quantil:", quantile_oberes_1, "\nUnteres 1%-Quantil:", quantile_unteres_1, "\n")
cat("Oberes 0.5%-Quantil:", quantile_oberes_0.5, "\nUnteres 0.5%-Quantil:", quantile_unteres_0.5, "\n")
cat("Oberes 0.1%-Quantil:", quantile_oberes_0.1, "\nUnteres 0.1%-Quantil:", quantile_unteres_0.1, "\n")

#(2)
# Erstes Quartil, Median und drittes Quartil der t-Verteilung mit 4 Freiheitsgraden berechnen
erstes_quartil <- qt(0.25, 4)
median <- qt(0.5, 4)
drittes_quartil <- qt(0.75, 4)

# Ausgabe der Werte
cat("Erstes Quartil:", erstes_quartil, "\nMedian:", median, "\nDrittes Quartil:", drittes_quartil, "\n")


# Aufgabe 4:
sgn <- function(x) {
  # Anwenden der Signumsfunktion auf jeden Wert im Vektor x
  sapply(x, function(v) {
    if (v > 0) {
      return(1)
    } else if (v < 0) {
      return(-1)
    } else {
      return(0)
    }
  })
}

sgn2 <- function(x) {
  # Initialisieren eines Vektors für die Ergebnisse
  result <- numeric(length(x))
  
  # Durchlaufen des Vektors x
  for (i in seq_along(x)) {
    if (x[i] > 0) {
      result[i] <- 1
    } else if (x[i] < 0) {
      result[i] <- -1
    } else {
      result[i] <- 0
    }
  }
  
  return(result)
}

sgn3 <- function(x) {
  sapply(x, function(v) sign(v))
}

# Test für sgn
sgn(c(-2, 0, 3, -5))
# Erwartete Ausgabe: -1  0  1 -1

# Test für sgn2
sgn2(c(-2, 0, 3, -5))
# Erwartete Ausgabe: -1  0  1 -1

# Test für sgn3
sgn3(c(-2, 0, 3, -5))
# Erwartete Ausgabe: -1  0  1 -1

# passt glaub soweit.