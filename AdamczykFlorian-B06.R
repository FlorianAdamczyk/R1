# Florian Adamczyk R Aufgabenblatt 6
#Aufgabe 1
#a)
# a) Lesen Sie die kopierte Datei SMSA_mod aus Ihrem Arbeitsverzeichnis nun mit Hilfe der Funktion read.table in einen Data Frame namens SMSA.df erneut ein, und zwar so, dass die Spalte ID der SMSA-Identifikationscodes zur Zeilenbenennung und nicht als Datenspalte verwendet wird!

SMSA.df <- read.table("SMSA_mod", skip=4, row.names = 1)

head(SMSA.df)

# b) Benennen Sie die Spalten (= Variablen) des Data Frames SMSA.df (analog zu Aufgabe 3e auf Blatt 5) mit kurzen, aber sinnvollen und ihrer Bedeutung entsprechenden Namen!

names(SMSA.df) <- c("Area", "Pop", "CityPop", "PopOver65", "Physicians", "HospBeds", "Graduates", "LaborForce", "Income", "Crimes", "Region")


# c) # aufgabe 3f aus Blatt 5
#man muss hier den doppelten tab vor saracuse entfernen!
tmp <- scan(file = "SMSAID", sep = "\t", skip = 3,
            what = list(ID1 = 0, City1 = "",
                        ID2 = 0, City2 = "",
                        ID3 = 0, City3 = ""))
str(tmp)

smsaid <- with(tmp, list(ID = c(ID1, ID2, ID3),
                          City = c(City1, City2, City3)))
str(smsaid)
smsaid

# jetzt umbenennen:
rownames(SMSA.df) <- smsaid$City

SMSA.df <- SMSA.df[-1]       # Erste Komponente raus!

head(SMSA.df, 3)
tail(SMSA.df, 2)

#nice, hat geklappt!

# Aufgabe 3 g aus Blatt 5
# Wandeln Sie die Variable in SMSA.df, die die Codes der geografischen Regionen enth¨alt, in einen (ungeordneten) Faktor mit den Levels NE, NC, S und W um, und zwar gem¨aß der im Skript in §3.1.2 beschriebenen Zuordnung der Codes!

SMSA.df$Region <- factor(SMSA.df$Region, levels = 1:4,
                         labels = c("NE", "NC", "S", "W"))
head(SMSA.df, 7)  # Kontrolle

# Aufgabe 3 h aus Blatt 5
# Kontrollieren Sie mit Hilfe der Funktion str die Struktur von SMSA.df und bestimmen Sie mit summary die “summary statistics” von SMSA.df!

str(SMSA.df)

summary(SMSA.df)

# fertig mit Aufgabe 1 von Blatt 6

#Aufgabe 2 
# a) grafische darstellung der Anzahlen der praktizierenden Ärtzte nach Region

barplot(table(SMSA.df$Region), main = "Anzahl der Ärzte nach Region", xlab = "Region", ylab = "Anzahl der Ärzte")

# b) Grafische Darstellung der Prozentsätze an High-School-AbsolventInnen und nach Region

smsa_grad <- SMSA.df$Graduates / SMSA.df$Pop * 100

barplot(tapply(smsa_grad, SMSA.df$Region, mean), main = "Prozentsatz der High-School-AbsolventInnen nach Region", xlab = "Region", ylab = "Prozentsatz")

# c) Grafische Darstellung des privaten Gesamteinkommen nach Region

barplot(tapply(SMSA.df$Income, SMSA.df$Region, sum), main = "Gesamteinkommen nach Region", xlab = "Region", ylab = "Einkommen")


# Aufgabe 3: Kopieren Sie sich die Datei MietenFrankfurt aus Stud.IP in Ihr eigenes, ¨ubliches R-Arbeitsverzeichnis und lesen Sie sie geeignet in R ein!

MietenFrankfurt <- scan("MietenFrankfurt")
MietenFrankfurt
# a) Fertigen Sie mit stem ein “stem-and-leaf”-Diagramm f¨ur diese Daten an! Probieren Sie die Wirkung des Arguments scale aus, indem Sie es mit (wenigen) Werten kleiner und gr¨oßer als 1 versehen!

stem(MietenFrankfurt, scale = 0.5)

stem(MietenFrankfurt, scale = 2)

#c)

# Flächennormiertes Histogramm ohne das Argument `breaks`
hist(MietenFrankfurt, freq = FALSE)

# Flächennormiertes Histogramm mit `breaks` als natürliche Zahl
hist(MietenFrankfurt, breaks = 20, freq = FALSE)

# Flächennormiertes Histogramm mit `breaks` als Vektor
# Finden Sie das Minimum und das Maximum in 'MietenFrankfurt'
min_value <- min(MietenFrankfurt)
max_value <- max(MietenFrankfurt)

# Erstellen Sie einen Vektor für 'breaks', der von 'min_value' bis 'max_value' reicht
breaks_vector <- seq(min_value, max_value, length.out = 30) # sehe ich jetzt nicht soo den sinn dahinter warum man einen vector benutzt...
breaks_vector

# Erstellen Sie das Histogramm
hist(MietenFrankfurt, breaks = breaks_vector, freq = FALSE)

# c)
# Kern-Dichteschätzer ohne das Argument `bw`
dichte <- density(MietenFrankfurt)
plot(dichte)

# Kern-Dichteschätzer mit `bw` als Wert
dichte_bw_100 <- density(MietenFrankfurt, bw = 100)
plot(dichte_bw_100)

dichte_bw_300 <- density(MietenFrankfurt, bw = 300)
plot(dichte_bw_300)

#coolcool! fertig mit Blatt 6