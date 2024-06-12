# Florian Adamczyk R Aufgabenblatt 7
#Aufgabe 1

##### einlesen Kopie von Blatt 6
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

##### ende Kopie von Blatt 6

## Bearbeitung: Aufgabe 1 a) Erstellen Sie f¨ur die Realisierungen der Variablen Region ein Kreisdiagramm und einen “Dot Chart”, deren Beschriftungen hinreichend aufschlussreich sind!

pie(table(SMSA.df$Region), main = "Verteilung der Regionen", col = rainbow(4), labels = c("NE", "NC", "S", "W"))

# b) Lassen Sie f¨ur alle metrisch skalierten Variablen in SMSA.df Boxplots (ohne Ber¨ucksichtigung der Regionen) zeichnen, und zwar zun¨achst nur mithilfe von boxplot so,dass”parallele“ Boxplots in ein und demselben Koordinatensystem entstehen!

boxplot(SMSA.df[, -11], main = "Boxplots der metrischen Variablen", xlab = "Variablen", ylab = "Werte")

# Ist das eine gute Darstellung?
# Nein, weil die Werte der Variablen sehr unterschiedlich sind und daher die Boxplots nicht gut zu vergleichen sind.


# Lassen Sie f¨ur alle metrisch skalierten Variablen in SMSA.df Boxplots (ohne Ber¨ucksichtigung der Regionen) zeichnen unter Zuhilfenahme von lapply, sodass ”separate“ Darstellungen in eigenen Koordinatensystemen entstehen!

par(mfrow = c(2, 5)
lapply(SMSA.df[, -11], boxplot, main = "Boxplot", xlab = "Variable", ylab = "Werte")


# c) Fertigen Sie f¨ur alle metrisch skalierten Variablen in SMSA.df mit pairs die paarweisen Streudiagramme an!

pairs(SMSA.df[, -11], main = "Paarweise Streudiagramme")

# F¨uhren Sie pairs auch in ihrer Formelvariante aus

pairs(~ Pop + CityPop + PopOver65 + Physicians + HospBeds + Graduates + LaborForce + Income + Crimes, data = SMSA.df, main = "Paarweise Streudiagramme")

# Wenden Sie auf einige der metrisch skalierten Variablen in SMSA.df die eine oder andere von Ihnen ausgew¨ahlte, streng monotone Transformation an und lassen Sie die paarweisen Streudiagramme erneut zeichnen!

SMSA.df$Pop <- log(SMSA.df$Pop)
SMSA.df$CityPop <- log(SMSA.df$CityPop)
SMSA.df$PopOver65 <- log(SMSA.df$PopOver65)

pairs(SMSA.df[, -11], main = "Paarweise Streudiagramme nach Transformation")

# Aufgabe 2:
# a) Fertigen Sie nun dieselben Grafiken sowohl f¨ur die (beliebig) logarithmierten Daten an als auch f¨ur die Quadratwurzel der Daten.

SMSA.df$Pop <- log(SMSA.df$Pop)
SMSA.df$CityPop <- log(SMSA.df$CityPop)
SMSA.df$PopOver65 <- log(SMSA.df$PopOver65)


# a) grafische darstellung der Anzahlen der praktizierenden Ärtzte nach Region

barplot(table(SMSA.df$Region), main = "Anzahl der Ärzte nach Region", xlab = "Region", ylab = "Anzahl der Ärzte")

# b) Grafische Darstellung der Prozentsätze an High-School-AbsolventInnen und nach Region

smsa_grad <- SMSA.df$Graduates / SMSA.df$Pop * 100

barplot(tapply(smsa_grad, SMSA.df$Region, mean), main = "Prozentsatz der High-School-AbsolventInnen nach Region", xlab = "Region", ylab = "Prozentsatz")

# c) Grafische Darstellung des privaten Gesamteinkommen nach Region

barplot(tapply(SMSA.df$Income, SMSA.df$Region, sum), main = "Gesamteinkommen nach Region", xlab = "Region", ylab = "Einkommen")

#quadradic root

SMSA.df$Pop <- sqrt(SMSA.df$Pop)
SMSA.df$CityPop <- sqrt(SMSA.df$CityPop)
SMSA.df$PopOver65 <- sqrt(SMSA.df$PopOver65)

# a) grafische darstellung der Anzahlen der praktizierenden Ärtzte nach Region

barplot(table(SMSA.df$Region), main = "Anzahl der Ärzte nach Region", xlab = "Region", ylab = "Anzahl der Ärzte")

# b) Grafische Darstellung der Prozentsätze an High-School-AbsolventInnen und nach Region

smsa_grad <- SMSA.df$Graduates / SMSA.df$Pop * 100

barplot(tapply(smsa_grad, SMSA.df$Region, mean), main = "Prozentsatz der High-School-AbsolventInnen nach Region", xlab = "Region", ylab = "Prozentsatz")

# c) Grafische Darstellung des privaten Gesamteinkommen nach Region

barplot(tapply(SMSA.df$Income, SMSA.df$Region, sum), main = "Gesamteinkommen nach Region", xlab = "Region", ylab = "Einkommen")


