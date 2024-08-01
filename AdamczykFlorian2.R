# Adamczyk Florian 8105234

# Aufgabe 2
# Vielfacheit von Gesundheitsdaten

# a)
# Lesen Sie mit scan die Geburtsdaten (als character) in R ein und kontrollieren Sie Struktur der eingelesenen Daten!

data <- scan("Geburtsdaten.txt", what = character())
str(data)
head(data)
tail(data)
length(data)

# b)
# tabellieren Sie (ohne die Verwendung irgendeiner Schleife), wie häufig jede Vielfachheit (≥ 2) auftritt!

# Anzeigen der Duplikate
data[duplicated(data)]
length(data[duplicated(data)])
# das sind ganz schön viele!

# Erstellen einer Tabelle mit der Häufigkeit jedes Eintrags
haeufigkeitstabelle <- table(data)

# Anzeigen der Tabelle
# print(haeufigkeitstabelle) # das ist zu lang, deshalb filtern wir es

# Filtern der Tabelle, um nur Einträge mit einer Häufigkeit von 2 oder mehr anzuzeigen
vielfachheit_ab_2 <- haeufigkeitstabelle[haeufigkeitstabelle >= 2]

# Anzeigen der gefilterten Tabelle
print(vielfachheit_ab_2)
 head(vielfachheit_ab_2)
str(vielfachheit_ab_2)

# Finde den Eintrag mit der höchsten Häufigkeit
max_frequency <- max(vielfachheit_ab_2)

# Finde den/die Eintrag/Einträge mit der höchsten Häufigkeit
most_frequent_entries <- names(vielfachheit_ab_2[vielfachheit_ab_2 == max_frequency])

# Gib den/die häufigsten Eintrag/Einträge und deren Häufigkeit aus
cat("Der/die häufigste(n) Eintrag/Einträge ist/sind:", most_frequent_entries, "\n")
cat("Häufigkeit:", max_frequency, "\n")

# Sortiere die Einträge nach absteigender Häufigkeit
sorted_entries <- sort(vielfachheit_ab_2, decreasing = TRUE)

# Gib die sortierten Einträge aus
print(sorted_entries)
length(sorted_entries)

head(sorted_entries)
# wow es gibt echt viele einträge die über 10x doppelt sind.
# könnte aber auch sein, dass es mehrere Menschen mit demselben geburtsdatum gibt.