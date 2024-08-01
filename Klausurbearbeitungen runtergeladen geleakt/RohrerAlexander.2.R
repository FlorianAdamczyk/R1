### Name: Alexander Rohrer
### Matrikelnummer: 8120463

### Aufgabe 2


#*******************************************************************************************
# 2 a)

geb <- scan("Geburtsdaten.txt", what = "character")
sum(is.na(geb))
str(geb)

# Auch hier keine fehlenden Werte
# Daten sind im Geburtstagsformat yyyy-mm-dd als char eingelesen

#*******************************************************************************************
# 2 b)

absolute_haeuf <- table(as.vector(geb))
mehrfach_gebs <- absolute_haeuf[absolute_haeuf >= 2]
merfachnennungen_table <- table(mehrfach_gebs)

# merfachnennungen_table gibt einen eine tabelle aus mit
# allen Mehrfachnennungen aus, die is gibt und die Anzahl der Nennung
