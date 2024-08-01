# Günther, Martin---
# Matrikelnr.8119146
#******************************************************
# Aufgabe 2
#******************************************************

#a
geburtsdaten <- scan("Geburtsdaten.txt", what = "character") #Einlesen mit scan
# als character (warum nicht als date?)
# überprüfe Struktur
str(geburtsdaten) 
# Ausgabe [1:39159] - Gegenprobe Editor39160 Zeilen, also passt


# b


# zunächst eindimensionale Tabelle erstellen:
#geburts_haeufigkeiten <- table(geburtsdaten) 
# Problem, als Character sind nur [1:19932(1d)] enthalten, es müssten ja aber
#Ausgabe [1:39159] sein
# Lösungsansatz - Datum konvertieren
geb_daten <- as.Date(geburtsdaten) #konvertieren
str(geb_daten)# Probe

geburts_haeufigkeiten <- table(geb_daten) #Formatieren als 1d Tabelle
str(geburts_haeufigkeiten)# Probe
# nun korrekt chr [1:19932]


vielfachheiten <- geburts_haeufigkeiten[geburts_haeufigkeiten >= 2] #nur Datum mit
# Anzahl <= 2 behalten
str(vielfachheiten)  #Probe



# Aufräumen ----
#***************
rm(list = ls())
