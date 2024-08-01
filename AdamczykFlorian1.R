# Adamczyk Florian 8105234

# Aufgabe 1
Buchbestand <- 1554
# a)
# Lesen Sie mit read.csv die Daten in R ein und kontrollieren Sie Struktur und Inhalt der eingelesenen Daten!
# Lesen Sie die CSV-Datei ein
daten <- read.csv("Buecherwerte.csv")

# Überprüfen Sie die Struktur der eingelesenen Daten
str(daten)

# Überprüfen Sie den Inhalt der eingelesenen Daten
head(daten)

# b)
# Rechnen Sie allein aus den Buchpreisen der Stichprobe die Wiederbeschaffungskosten für den Gesamtbestand hoch!

mean(daten$Preis)*Buchbestand
# in britischen Pence

#c) 
# Bestimmen Sie nun den durchschnittlichen Wiederbeschaffungspreis pro Millimeter f¨ur die Stichprobe und rechnen Sie damit die Wiederbeschaffungskosten f¨ur den Gesamtbestand, dessen Gesamtdicke 25182 Millimeter betrug, hoch!

Gesamtdicke <- 25182

# erstmal eine neue Spalte mit Preis pro mm für jedes Buch
daten$PreisProMM <- daten$Preis/daten$Dicke
head(daten)
mean(daten$PreisProMM)
mean(daten$PreisProMM)*Gesamtdicke
# das ist deutlich teurer als die Wiederbeschaffungskosten aus a). Anscheinend sind mehr dickere dabei oder so.

# d)
# Fertigen Sie ein Streudiagramm der Buchpreise gegen die Buchdicken an!

plot(daten$Dicke, daten$Preis, xlab = "Dicke in mm", ylab = "Preis in Pence (britisch)", main = "Preis gegen Dicke")

# e)
# Die Erhebung der Buchdicke war in der Hoffnung geschehen, die Schätzung der Buchpreise mithilfe dieser ”Ersatzvariablen“ vereinfachen zu k¨onnen. In Anbetracht des eben erzeugten Streudiagrammes: Ließe sich aus der Dicke (in mm) eines Buches – wenigstens tendenziell – sein Wiederbeschaffungspreis sch¨atzen? Wenn ja, hielten Sie diesen Sch¨atzwert für zuverlässig, und wenn nein, warum nicht?

# erstelle korrelation zwischen Preis und Dicke
cor(daten$Preis, daten$Dicke)
cor(daten$Dicke, daten$Preis)

# Die Korrelation ist sehr gering. 
# Die Korrelation ist zumindest positiv, also bei steigender Dicke steigt auch der Preis.
# Allerdings ist es so, dass dünnere Bücher deutlich mehr pro mm kosten als dickere und darum kann man nicht wirklich sagen, dass die Dicke ein guter Schätzer für den Preis ist.
# Ich halte den Schätzwert für den Preis anhand der Dicke für nicht sehr zuverlässig, denn die Preise folgen keiner klaren Linie sondern gehen deutlich auseinander, ein dünnes buch kann manchmal teurer sein als ein dickes.


