### Name: Alexander Rohrer
### Matrikelnummer: 8120463

### Aufgabe 1


#*******************************************************************************************
# 1 a)
buecher <- read.csv("Buecherwerte.csv", header=TRUE, sep = ",")
str(buecher)
sum(is.na(buecher)) 
# --> Es gibt keine Fehlwerte in den Daten
# --> 100 Datenpunkte mit jeweils 2 Werten und einer ID
# --> beide Spalten sind integer; alle Werte sind > 0


#*******************************************************************************************
# 1 b)

durchschnittspreis_pro_buch <- sum(buecher$Preis) / length(buecher$Preis)
Gesamtpreis_aller_Buecher <- durchschnittspreis_pro_buch * 1554

#--> 517.2 ist der Durchscnittspreis
#--> 803728.8 die Hochrechnung
#*******************************************************************************************
# 1 c)

mean_preis_pro_mm <- mean(buecher$Preis / buecher$Dicke)
gesamtpreis_mm <- mean_preis_pro_mm * 25182

# 51.09866 ist der Preis pro mm
# 1286766 ist der Gesamtpreis für alle Millimeter

#*******************************************************************************************
# 1 d)
install.packages("ggplot2")
library(ggplot2)

ggplot(buecher, aes(x = buecher$Preis , y = buecher$Dicke)) +
  geom_point() +
  labs(title = "Streudiagramm für Bücherpreis gegen Bücherdicke",
       x = "Preis",
       y = "Dicke")

#*******************************************************************************************
# 1 e)

# Zunächst ist das nur eine Stichprobe von 100 Büchern und
# und damit ist die Aussagekraft beschränkt
# Die Streuung ist sehr groß, allerdings ist eine leichte Tendez erkennbar:
# Mit steigernder Dicke steigt der preis auch langsam

cor(buecher$Preis, buecher$Dicke)
# die korrealtion von 0.4327403 bestätigt diese Tendenz
# allerdings ist dieser Shcätzwert nur eine Tendenz und nicht verlässslich

