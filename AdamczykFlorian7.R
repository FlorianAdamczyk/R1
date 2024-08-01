# Adamczyk Florian 8105234

# Aufgabe 7

# a)
# Lesen Sie die Daten in Lungenlappendichte.csv mithilfe von read.csv2 in einen Data Frame ein und kontrollieren Sie dessen Struktur und Inhalt!

df <- read.csv2("Lungenlappendichte.csv")
str(df)
str(df$HUDichte)
max(df$HUDichte)

head(df)
tail(df)

# b)
# Leiten Sie eine neue Spalte Gesamt ab, die f¨ur jeden HU-Wert seine ¨uber die f¨unf Lungenlappen hinweg kumulierte Gesamth¨aufigkeit enth¨alt!

df$Gesamt <- rowSums(df[, -1])
head(df)
# sieht gut aus, ich habe es geschafft, dass die erste Zeile weggelassen wurde.

# c)
# Die Aufl¨osung der HU-Skala soll vergr¨obert werden, damit die H¨aufigkeitsverteilung der in Spalte Gesamt stehenden Daten ¨uberhaupt einigermaßen ¨ubersichtlich wird. Leiten Sie zu diesem Zweck mithilfe der Funktion cut zun¨achst einen Faktorvektor aus der Spalte HUDichte ab, wobei Sie ihren Wertebereich von -1100 bis 3100 in Intervalle der Breite 100 einteilen! Sorgen Sie daf¨ur, dass der Faktorvektor den ad¨aquaten Modus einer ordinalskalierten Variablen hat! 

df$HUDichteFaktor <- factor(cut(df$HUDichte, breaks = seq(-1100, 3100, 100), labels = seq(-1100, 3000, 100), include.lowest = TRUE), ordered = TRUE)
str(df$HUDichteFaktor)
head(df$HUDichteFaktor)
head(df)

# Nutzen Sie dann jenen Faktorvektor, um die Elemente der Spalte Gesamt entsprechend gruppiert zu summieren! (Tipp: tapply in Verbindung mit sum.)

Gesamt_summiert <- tapply(df$Gesamt, df$HUDichteFaktor, sum)
head(Gesamt_summiert)

# d)
# Fertigen Sie schließlich f¨ur die ”gruppierte“ H¨aufigkeitsverteilung von eben ein S¨aulendiagramm mit horizontalen S¨aulen an (also ein Balkendiagramm)! Sorgen Sie mit den Argumenten las und mar der Funktion par daf¨ur, dass die Beschriftung beider Achsen horizontal ist und dass insbesondere f¨ur die Beschriftung der vertikalen Achse gen¨ugend Platz ist! Charakterisieren Sie kurz die dargestellte Verteilung! 

# Setze die Ränder der Grafik, um genügend Platz für die horizontale Beschriftung der y-Achse zu schaffen
par(mar = c(5, 10, 5, 5), las = 0)

# Erstelle das Balkendiagramm mit horizontalen Achsenbeschriftungen
barplot(Gesamt_summiert, horiz = TRUE, main = "Gruppierte Häufigkeitsverteilung", xlab = "Häufigkeit", ylab = "HU-Dichte")

# Die Verteilung ist eine Binomialverteilung, die sich circa ganz grob um den Wert -800 herum konzentriert. Die Verteilung ist asymmetrisch. 

# e)
# Rekonstruieren Sie aus den vorliegenden H¨aufigkeiten in Gesamt und den dazugeh¨origen Werten in HUDichte die urspr¨unglichen Rohdaten! (Es sollte ein Vektor mit mehr als 3,6 Mio. Elementen sein.) 

# Erstelle einen leeren Vektor für die rekonstruierten Rohdaten
rekonstruierte_Rohdaten <- c()

# Iterieren Sie über die Werte in df$Gesamt und df$HUDichte
for (i in 1:nrow(df)) {
  # Fügen Sie den Wert in df$HUDichte so oft in den Vektor ein, wie der Wert in df$Gesamt angibt
  rekonstruierte_Rohdaten <- c(rekonstruierte_Rohdaten, rep(df$HUDichte[i], df$Gesamt[i]))
}
# das ist zwar nicht so effizient aber es fuinktioniert.
# das dauert ein bisschen, weil es so viele Elemente sind.
# auf meinem PC dauert es circa 40s.

# Überprüfen Sie die Länge des resultierenden Vektors
length(rekonstruierte_Rohdaten)
# es sind wirklich 3621028 Daten!, hat also geklappt.

# f)
# Einen Normal-QQ-Plot f¨ur eine derart große Stichprobe wie die in Teil e rekonstruierte anzufertigen, ist aufgrund der Rechenzeit sinnlos. Alternativ kann man eine (oder mehrere) hinreichend große, zuf¨allige Teilstichprobe(n) aus der Stichprobe ziehen und f¨ur diese die Zul¨assigkeit der Normalverteilungsannahme pr¨ufen. Ziehen Sie mithilfe der Funktion sample (siehe ihre Hilfeseite!) reproduzierbar (!) etwa 0,5 % der Stichprobe von Teil e als zuf¨allige Teilstichprobe und beurteilen Sie daf¨ur, ob die Normalverteilungsannahme haltbar ist!

# Setze den Seed für die Reproduzierbarkeit
set.seed(123)

# Ziehe eine zufällige Teilstichprobe von 0,5% der Stichprobe
teilstichprobe <- sample(rekonstruierte_Rohdaten, length(rekonstruierte_Rohdaten) * 0.005)

# Überprüfen Sie die Länge der Teilstichprobe
length(teilstichprobe)
head(teilstichprobe)

# Erstellen Sie einen QQ-Plot für die Teilstichprobe
qqnorm(teilstichprobe)
qqline(teilstichprobe, col = "red")

# Die Normalverteilungsannahme ist für die Teilstichprobe nicht so wirklich haltbar. Bei den niedligen Quantilen liegen die Punkte noch sehr nahe exakt an der Linie, aber bei den höheren Quantilen liegen die Punkte nicht mehr so nah an der Linie und sind auch nicht mehr symmetrisch verteilt, sondern weichen stark nach oben von der Linie ab.


# just for fun: bzw. ich bin neugierig: nochmal eine Stichprobe nehmen:
# Setze den Seed für die Reproduzierbarkeit
set.seed(4242)

# Ziehe eine zufällige Teilstichprobe von 0,5% der Stichprobe
teilstichprobe <- sample(rekonstruierte_Rohdaten, length(rekonstruierte_Rohdaten) * 0.005)

# Überprüfen Sie die Länge der Teilstichprobe
length(teilstichprobe)
head(teilstichprobe)

# Erstellen Sie einen QQ-Plot für die Teilstichprobe
qqnorm(teilstichprobe)
qqline(teilstichprobe, col = "red")

# hmm sieht sehr ähnlich aus, ich nehme an die stichprobe ist so groß, dass es immer so aussieht.

# ich hoffe die Klausur war so in Ordnung. Ich habe mir Mühe gegeben :)
# ich hoffe auch die Kommentare sind so in Ordnung, ich habe versucht so viel wie möglich zu kommentieren.

# viel Erfolg bei der Korrektur und dann noch einen schönen Sommer! :)