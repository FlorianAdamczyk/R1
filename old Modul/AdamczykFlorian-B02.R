# Florian Adamczyk Aufgabenblatt 2

# Aufgabe 1 a)
grosN <- 42

kleini <- c(0:grosN)
kleinn <- c(0:grosN)

1 / 2^kleini # erster Teil
cumsum(1 / 2^kleini) # zweiter Teil (summe)

# Aufgabe 1 b)

n <- 13
p <- 1

i <- c(0:n)

(W_i <- choose(n, i) * (p^i) * ((1 - p)^(n - i)))

k <- c(0:n)

(P_k <- cumsum(W_i))

# ich glaub ich hab da irgendwas falsch gemacht aber ich weiß nicht wieso da nur 0 0 0 0 0 0 0 0 0 0 0 0 0 1 rauskommt??
# was genau mache ich denn  mit dem k?! cumsum hat nur ein Argument, da kann man nicht noch ein k angeben...

# Aufgabe 2

x <- c(0.61, 0.79, 0.83, 0.66, 0.94, 0.78, 0.81, 0.60, 0.88, 0.90, 0.75, 0.86, 0.74, 0.84)
x(1)
y <- c(1.01, 0.13, 1.73, 0.67, 0.56, 0.99, 0.49, 0.72, 0.13, 0.48, 0.98, 0.08, 1.23, 0.87)
# a) # Bestimmen Sie den Vektor der Ordnungsstatistiken (x1:n, . . . , xn:n) der xi!
ordnungsstat <- sort(x)
# b) # Erzeugen Sie einen character-Vektor, der als seine Elemente die insgesamt 14 Zeichenketten "x(1:14) = 0.6", "x(2:14) = 0.61" usw. enth¨alt (also alle Paare der Art Ordnungsstatistik = Wert)!
(charvec <- paste("x(", 1:14, ":14) = ", ordnungsstat, sep = ""))

# c) Bilden Sie den Vektor der Konkomitanten (y[1:n], . . . , y[n:n]) der yi zu den xi:n!
 # ersteinmal die indizes der sortierten x bestimmen:
(konkomitanten <- y[order(x)])

# d) Konstruieren Sie den character-Vektor, der alle obigen Wertepaare nach den x-Werten geordnet in der Form "(x(1:14), y[1:14]) = (0.6, 0.72)", "(x(2:14), y[2:14]) = (0.61, 1.01)" usw. enth¨alt!
(charvec2 <- paste("(x(",1:14, ":14), y[", 1:14, ":14]) = (", ordnungsstat, ", ", konkomitanten, ")", sep = ""))

# e) Modifizieren Sie Teil d unter Verwendung der Funktion format derart, dass die Ausgabe schön formatiert ist, also z. B. "0.6" als "0.60", damit es zu "0.72" passt, und "1:14" als " 1:14", damit es zu "10:14" passt!
(charvec3 <- paste("(x(", formatC(1:14, width = 2, flag = "0"), ":14), y[", formatC(1:14, width = 2, flag = "0"), ":14]) = (", format(ordnungsstat, width = 4, nsmall=2), ", ", format(konkomitanten, width = 4, nsmall=2), ")", sep = ""))


# Aufgabe 3
# a) Wie groß ist die kleinste, die gr¨oßte und die mittlere Wartezeit und wie lautet die Standardabweichung der Wartezeiten?
min(faithful$waiting) # Minimum
max(faithful$waiting) # Maximum
mean(faithful$waiting) # Mittelwert
sd(faithful$waiting) # Standardabweichung

# b) Die wievielte Beobachtung ist die kleinste bzw. die gr¨oßte Wartezeit?
# und gibt es mehrere Beobachtungen mit der kleinsten/größten Wartezeit?
which(faithful$waiting == min(faithful$waiting))
which(faithful$waiting == max(faithful$waiting))

# c) Uber welcher (größten) Schwelle liegen die 30% längsten Wartezeiten?
quantile(faithful$waiting, probs = 0.7) # 70% der Wartezeiten sind kleiner 81min

# d) Kurze Wartezeiten seien solche, die h¨ochstens 60 Minuten betragen. Extrahieren Sie die kurzen Wartezeiten!
(shortWaiting <- faithful$waiting[faithful$waiting <= 60])

# e) Wie viele Wartezeiten sind es insgesamt und wie viele kurze Wartezeiten gibt es?
length(faithful$waiting) # 272 Wartezeiten
length(shortWaiting) # 83 kurze Wartezeiten

# f) Ermitteln Sie die zu den kurzen Wartezeiten gehörenden Eruptionsdauern!
(shortWaitingEruptionDuration <- faithful$eruptions[faithful$waiting <= 60])

# g) Wie groß ist die mittlere kurze Wartezeit? Wie lautet der Mittelwert der zugeh¨origen Eruptionsdauern?
mean(shortWaiting)
mean(shortWaitingEruptionDuration)

# h) Wie viele Eruptionsdauern nach kurzer Wartezeit sind mindestens 2.5 Minuten lang?
length(shortWaitingEruptionDuration[shortWaitingEruptionDuration >= 2.5])

# Lassen Sie sich durch den Befehl plot(faithful$waiting, faithful$eruptions) ein Streudiagramm der Eruptionsdauern gegen die Wartezeiten zeichnen! Versuchen Sie zu interpretieren, was es zeigt!
plot(faithful$waiting, faithful$eruptions)
# Es zeigt, dass es eine Korrelation zwischen Wartezeit und Eruptionsdauer gibt. Je länger die Wartezeit, desto länger die Eruptionsdauer. 
# Die Messpunkte sind in zwei Gruppen aufgeteilt, die sich in der Eruptionsdauer unterscheiden.  


# Aufgabe 4
# ich erzeuge einen vektor mit 100 ganzen zufallszahlen zwischen 1 und 10
(v <- sample(1:9, 100, replace = TRUE))
dv <- duplicated(v)

paste(v,dv, sep = " ") # ich möchte mir das anschauen

# jetzt die Aufgabe:
# gegeben ist vektor v und index v[i]. Funktion soll die Duplikate von v[i] in v zurückgeben
i <- 94
which(v == v[i] & duplicated(v) == TRUE)
# war das da damit gemeint?! also einfach rausfinden welche gleich dem i-ten element sind?
v == v[i]

# ich raffs nicht so ganz... ich bin sehr gespannt auf die Lösung!

# am 02.05. um 03:25 abgegeben.