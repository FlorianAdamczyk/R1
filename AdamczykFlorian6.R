# Adamczyk Florian 8105234

# Aufgabe 6
# In einer Spinnerei werden maschinell Wollkn¨auel mit einem Sollgewicht von 50 g gewickelt. Es wurden 20 zuf¨allig ausgew¨ahlte Kn¨auel gewogen. Die ermittelten Gewichte in g finden Sie in der Datei Wollknaeuelgewichte2024.txt


# a)
# Lesen Sie mit scan Gewichtsdaten in R ein und kontrollieren Sie Struktur der eingelesenen Daten!

data <- scan("Wollknaeuelgewichte2024.txt")
str(data)
#weiter für mich:
head(data)
print(data)

# b)
# der Hersteller der Wickelmaschine hat angegeben, dass die Wickelgewichte normalverteilt seien. ¨Uberpr¨ufen Sie diese Aussage mit einem geeigneten explorativen Werkzeug! Was halten Sie von der Aussage?

# Histogramm
hist(data, main = "Histogramm der Wollknäuelgewichte", xlab = "Gewicht in g", ylab = "Häufigkeit", col = "lightblue")
hist(data, breaks = 15, main = "Histogramm der Wollknäuelgewichte", xlab = "Gewicht in g", ylab = "Häufigkeit", col = "lightblue")
hist(data, breaks = 8, main = "Histogramm der Wollknäuelgewichte", xlab = "Gewicht in g", ylab = "Häufigkeit", col = "lightblue")
# das sieht nicht wirklich normalverteilt aus, eher bimodal oder so.


# ( Boxplot
# boxplot(data, breaks = 18, main = "Boxplot der Gewichte", ylab = "Gewicht (g)") )


# QQ-Plot
qqnorm(data)
qqline(data, col="red")
# hier erkennen wir auch, dass die Daten nicht normalverteilt sind. Die Punkte liegen nicht auf der Linie, sondern eher in Stufen und sind nicht symmetrisch verteilt.


( # Shapiro-Wilk-Test
shapiro.test(data)
# Der p-Wert ist ziemlich klein.
# Ich halte die Aussage des Herstellers für nicht zutreffend.
)


# c)
# Es besteht der Verdacht, dass das mediane Wickelgewicht des Produktionsprozesses vom gew¨unschten Sollgewicht abweicht. Es ist Ihre Aufgabe, datenanalytisch zu untersuchen, ob dieser Verdacht gerechtfertigt ist. W¨ahlen und nennen Sie ein dazu geeignetes statistisches Verfahren und seine Voraussetzungen! Sind die Voraussetzungen f¨ur die vorliegenden Daten erf¨ullt bzw. ¨uberhaupt ¨uberpr¨ufbar?

#nur mal kurz was schauen, ist nicht so wichtig:
mean(data)
median(data)

# Wir könnten einen Wilcoxon-Test durchführen, um zu überprüfen, ob das mediane Wickelgewicht des Produktionsprozesses vom gewünschten Sollgewicht abweicht.

# Voraussetzungen:
# Paired Samples: Die Daten müssen gepaarte Beobachtungen sein. In diesem Fall vergleichen wir die Gewichte der Wollknäuel gegen das Sollgewicht von 50 g.
# Ordinal Scale: Die Daten sollten auf einer ordinalen oder metrischen Skala vorliegen.
# Symmetric Differences: Die Differenzen zwischen den gepaarten Beobachtungen sollten symmetrisch um den Median verteilt sein.

# Die Voraussetzungen sind erfüllt, da wir gepaarte Beobachtungen haben und die Daten auf einer metrischen Skala vorliegen.
# jedoch haben wir nur einen Stichprobenumfang von 20, was nicht sehr groß ist, um die Symmetrie der Differenzen zu überprüfen.
# Wir können jedoch davon ausgehen, dass die Differenzen symmetrisch verteilt sind, da die Daten nicht normalverteilt sind und die Differenzen daher nicht stark asymmetrisch sein sollten.



# d)
# Formalisieren Sie die beiden Aussagen, zwischen denen in dem von Ihnen in Teil c gewählten Verfahren zu entscheiden ist, und benennen Sie sie unter Verwendung der üblichen Fachausdrücke! Legen Sie sodann den Wert einer entscheidenden Größe fest und benennen Sie auch sie mit dem üblichen Fachausdruck! Wie lautet die zugehörige Entscheidungsregel?

# Nullhypothese: Das mediane Wickelgewicht des Produktionsprozesses ist gleich dem gewünschten Sollgewicht von 50 g.
# Alternativhypothese: Das mediane Wickelgewicht des Produktionsprozesses weicht vom gewünschten Sollgewicht von 50 g ab.

# Die entscheidende Größe im Wilcoxon-Vorzeichen-Rang-Test ist die Teststatistik W, die auf den Rangdifferenzen basiert.
# Entscheidungsregel: Wenn der p-Wert kleiner als das Signifikanzniveau alpha (z. B. hier soll er 0,05 sein) ist, verwerfen wir die Nullhypothese. Andernfalls können wir die Nullhypothese nicht verwerfen.

# e)
# Führen Sie schließlich die Datenanalyse durch und teilen Sie Ihre Entscheidung mit!

# Wilcoxon-Test
wilcox.test(data, mu = 50, alternative = "two.sided")

# da der p-Wert mit p=0.02958 kleiner als das Signifikanzniveau von 0,05 ist, können wir die Nullhypothese, dass das mediane Wickelgewicht des Produktionsprozesses gleich dem gewünschten Sollgewicht ist, verwerfen.
# Der Verdacht, dass das mediane Wickelgewicht des Produktionsprozesses vom gewünschten Sollgewicht abweicht, ist gerechtfertigt. 