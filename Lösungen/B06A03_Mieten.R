### Blatt 6, Aufgabe 3: Einlesen und EDA der Mieten-Daten.
### R 4.3.3, 6.6.2024
###*******************************************************

# Import ----
#************
# ANGENOMMEN, die Datei "MietenFrankfurt" befindet sich
# in demselben Verzeichnis, in dem R gerade läuft.
(Mieten <- scan(file = "MietenFrankfurt"))


# a) "Stem-and-leaf"-Diagramme ----
#**********************************
stem(Mieten)

stem(Mieten, scale = 1/2)
stem(Mieten, scale = 2)
stem(Mieten, scale = 3)


# b) Flächennormierte Histogramme ----
#*************************************
hist(Mieten) # Beachte, was die Voreinstellung (!)
    # freq = TRUE für eine y-Achseneinteilung liefert!
hist(Mieten, freq = FALSE) # Zum Vergleich!

## Angabe der ungefähren Anzahl der "breaks" ----
hist(Mieten, freq = FALSE, breaks =  4, main = "'breaks = 4'")
hist(Mieten, freq = FALSE, breaks = 10, main = "'breaks = 10'")
hist(Mieten, freq = FALSE, breaks = 15, main = "'breaks = 15'")
hist(Mieten, freq = FALSE, breaks = 20, main = "'breaks = 20'")
hist(Mieten, freq = FALSE, breaks = 25, main = "'breaks = 25'")
hist(Mieten, freq = FALSE, breaks = 40, main = "'breaks = 40'")

 # Beachte, wie sich bei Veränderung der angegebenen
 # Anzahl für "breaks" die tatsächl. Anzahl glgtl.
 # *nicht* ändert.


## Explizite Angabe äquidistanter "breaks" ----
hist(Mieten, freq = FALSE,# Liefert freq = TRUE anderes?
     breaks = seq(500, 4000, by = 250))

hist(Mieten, freq = FALSE, main = "a",
     breaks = seq(500, 4000, by = 200))
hist(Mieten, freq = FALSE, main = "b",
     breaks = seq(500, 4000, by = 100))

    # oder
hist(Mieten, freq = FALSE, main = "c",
     breaks = seq(800, 3800, by = 250))
hist(Mieten, freq = FALSE, main = "d",
     breaks = seq(800, 3800, by = 200))
hist(Mieten, freq = FALSE, main = "e",
     breaks = seq(800, 3800, by = 100))
hist(Mieten, freq = FALSE, main = "f",
     breaks = seq(800, 3800, by = 50))

## Explizite Angabe NICHT äquidistanter "breaks" ----
hist(Mieten, freq = FALSE,# Was passiert bei freq = TRUE?
     breaks = c(seq(500, 2500, by = 200), 4000), main = "")

 # Vergleiche nochmal äquidistante mit NICHT äquidis-
 # tanten "breaks" und beachte die automatische Änderung
 # der y-Achseneinteilung!
hist(Mieten, breaks = seq(500, 4000, by = 200),
     main = "äquidistant")
hist(Mieten, breaks = c(seq(500, 2500, by = 200), 4000),
     main = "nicht äquidistant")


# c) Kerndichteschätzer ----
#***************************
plot(density(Mieten))# Beachte, was im Untertitel der 
       # Grafik zur Bandbreite (= "bandwidth") steht.

## Experimente mit verschiedenen Bandbreiten ----
plot(density(Mieten, bw = 100), main = "a")

plot(density(Mieten, bw = 200), # Größere Bandbreiten 
     main = "b")                # machen die Schätzer-
plot(density(Mieten, bw = 400), # Kurve glatter, ...
     main = "c")                 
plot(density(Mieten, bw = 50), # ... kleinere machen
     main = "d")               # sie "unglatter".
plot(density(Mieten, bw = 25), main = "e")

## Fazit ----
# Größere Bandbreiten machen die Schätzer-Kurve
# glatter, kleinere machen sie "unglatter".


# Aufräumen ----
#***************
dev.off();    rm(Mieten)
