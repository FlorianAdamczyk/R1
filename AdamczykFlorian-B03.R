# Florian Adamczyk Aufgabenblatt 3

# vorbereitung:
Blutgruppe <- c(
 "B", "0", "0", "0", "A", "0", "0", "0", "0", "0", "A", "A", "0", "0", "0",
 "0", "0", "0", "A", "A", "B", "A", "A", "0", "A", "A", "A", "0", "0", "A",
 "A", "0", "0", "A", "0", "0", "A", "0", "A", "A", "A", "A", "A", "A", "A",
 "0", "A", "0", "A", "A", "AB", "B", "A", "A", "A", "0", "0", "B", "0", "A",
 "0", "A", "A", "0", "A", "AB", "AB", "0", "A", "A", "A", "B", "A", "0", "A",
 "A", "0", "A", "A", "A", "0", "0", "A", "A", "0", "0", "A", "B", "B", "0",
 "0", "B", "A", "0", "B", "A", "0", "0", "0", "0", "0", "0", "0", "0", "AB",
 "B", "B", "0", "B", "A", "A", "0", "A", "0", "A", "AB", "A", "A", "0", "A",
 "0", "A", "0", "B", "0", "A", "0", "A", "0", "A", "A", "A", "A", "A", "0",
 "0", "A", "0", "0", "0", "A", "A", "A", "B", "A", "A", "A", "B", "0", "A",
 "A", "B", "0", "0", "B", "B", "0", "A", "0", "A", "AB", "B", "0", "A", "0",
 "A", "0", "A", "A", "0", "AB", "A", "A", "A", "A", "0", "A", "0", "B", "0",
 "A", "AB", "AB", "A", "AB", "A", "0", "A", "A", "AB", "0", "0", "A", "B",
 "0", "A", "B", "0", "0", "B", "0", "0", "0", "0", "A", "A", "B", "A", "0",
 "0", "A", "0", "A", "0", "A", "A", "A", "0", "A", "A", "A", "A", "A", "0",
 "A", "A", "A", "0", "0", "A", "0", "B", "A", "0", "A", "A", "B", "0", "0",
 "0", "AB", "0", "A", "0", "AB", "A", "B", "0", "0", "A", "A", "0", "0", "A",
 "0", "AB", "AB", "A", "A", "A", "B", "0", "A", "B", "A", "0", "A", "A", "A",
 "A", "0", "A", "A", "B", "0", "0", "B", "A", "0", "0", "0", "0", "0", "A",
 "0", "0", "0", "0", "A", "0", "0", "A", "A", "A", "A", "0", "0", "A", "0",
 "A", "A", "0", "0", "0", "0", "B", "0", "B", "A", "A", "A", "A", "A", "0",
 "0", "0", "A", "A", "A", "AB", "A", "0", "0", "B")

Tumoraetiologie <- c(
 "Mesenchymal", "Sonstiges", "Mesenchymal", "Mesenchymal", "Metastase",
 "Mesenchymal", "Metastase", "Metastase", "Metastase", "Metastase",
 "Neuroepithelial", "Metastase", "Mesenchymal", "Metastase",
 "Neuroepithelial", "Nervenscheiden", "Sonstiges", "Metastase",
 "Nervenscheiden", "Metastase", "Metastase", "Neuroepithelial",
 "Nervenscheiden", "Mesenchymal", "Metastase", "Sonstiges", "Mesenchymal",
 "Neuroepithelial", "Mesenchymal", "Sonstiges", "Sonstiges", "Sonstiges",
 "Sonstiges", "Neuroepithelial", "Sonstiges", "Nervenscheiden",
 "Neuroepithelial", "Sonstiges", "Nervenscheiden", "Metastase", "Metastase",
 "Sonstiges", "Metastase", "Mesenchymal", "Metastase", "Nervenscheiden",
 "Sonstiges", "Metastase", "Mesenchymal", "Metastase", "Sonstiges",
 "Neuroepithelial", "Mesenchymal", "Mesenchymal", "Sonstiges", "Mesenchymal",
 "Mesenchymal", "Metastase", "Nervenscheiden", "Mesenchymal", "Sonstiges",
 "Neuroepithelial", "Nervenscheiden", "Nervenscheiden", "Metastase",
 "Mesenchymal", "Neuroepithelial", "Metastase", "Metastase", "Sonstiges",
 "Metastase", "Nervenscheiden", "Metastase", "Metastase", "Neuroepithelial",
 "Sonstiges", "Neuroepithelial", "Metastase", "Nervenscheiden", "Sonstiges",
 "Sonstiges", "Metastase", "Metastase", "Metastase", "Neuroepithelial",
 "Nervenscheiden", "Metastase", "Sonstiges", "Nervenscheiden", "Metastase",
 "Sonstiges", "Mesenchymal", "Metastase", "Metastase", "Metastase",
 "Sonstiges", "Sonstiges", "Metastase", "Neuroepithelial", "Mesenchymal",
 "Metastase", "Sonstiges", "Mesenchymal", "Neuroepithelial", "Sonstiges",
 "Metastase", "Metastase", "Metastase", "Mesenchymal", "Metastase",
 "Neuroepithelial", "Metastase", "Mesenchymal", "Nervenscheiden",
 "Mesenchymal", "Metastase", "Neuroepithelial", "Neuroepithelial",
 "Neuroepithelial", "Neuroepithelial", "Neuroepithelial", "Nervenscheiden",
 "Mesenchymal", "Metastase", "Nervenscheiden", "Mesenchymal", "Metastase",
 "Neuroepithelial", "Mesenchymal", "Neuroepithelial", "Mesenchymal",
 "Mesenchymal", "Metastase", "Sonstiges", "Neuroepithelial", "Metastase",
 "Metastase", "Metastase", "Sonstiges", "Metastase", "Metastase",
 "Sonstiges", "Nervenscheiden", "Metastase", "Nervenscheiden", "Sonstiges",
 "Neuroepithelial", "Mesenchymal", "Mesenchymal", "Metastase", "Metastase",
 "Metastase", "Metastase", "Metastase", "Nervenscheiden", "Metastase",
 "Nervenscheiden", "Mesenchymal", "Mesenchymal", "Sonstiges", "Sonstiges",
 "Metastase", "Mesenchymal", "Mesenchymal", "Neuroepithelial",
 "Mesenchymal", "Metastase", "Neuroepithelial", "Metastase",
 "Neuroepithelial", "Neuroepithelial", "Metastase", "Neuroepithelial",
 "Neuroepithelial", "Neuroepithelial", "Metastase", "Mesenchymal",
 "Mesenchymal", "Sonstiges", "Nervenscheiden", "Mesenchymal",
 "Mesenchymal", "Nervenscheiden", "Metastase", "Nervenscheiden",
 "Metastase", "Metastase", "Mesenchymal", "Metastase", "Nervenscheiden",
 "Metastase", "Nervenscheiden", "Sonstiges", "Metastase", "Mesenchymal",
 "Neuroepithelial", "Nervenscheiden", "Mesenchymal", "Sonstiges",
 "Sonstiges", "Metastase", "Sonstiges", "Nervenscheiden", "Metastase",
 "Metastase", "Nervenscheiden", "Neuroepithelial", "Metastase",
 "Sonstiges", "Sonstiges", "Sonstiges", "Sonstiges", "Mesenchymal",
 "Mesenchymal", "Metastase", "Metastase", "Sonstiges", "Nervenscheiden",
 "Sonstiges", "Metastase", "Metastase", "Nervenscheiden", "Mesenchymal",
 "Metastase", "Neuroepithelial", "Nervenscheiden", "Neuroepithelial",
 "Neuroepithelial", "Nervenscheiden", "Metastase", "Metastase",
 "Metastase", "Nervenscheiden", "Sonstiges", "Sonstiges", "Metastase",
 "Metastase", "Nervenscheiden", "Metastase", "Metastase", "Neuroepithelial",
 "Sonstiges", "Mesenchymal", "Sonstiges", "Metastase", "Nervenscheiden",
 "Mesenchymal", "Metastase", "Sonstiges", "Nervenscheiden", "Mesenchymal",
 "Metastase", "Sonstiges", "Mesenchymal", "Nervenscheiden", "Nervenscheiden",
 "Sonstiges", "Nervenscheiden", "Neuroepithelial", "Mesenchymal",
 "Metastase", "Mesenchymal", "Mesenchymal", "Metastase", "Sonstiges",
 "Nervenscheiden", "Metastase", "Sonstiges", "Metastase", "Mesenchymal",
 "Metastase", "Nervenscheiden", "Mesenchymal", "Sonstiges", "Nervenscheiden",
 "Neuroepithelial", "Nervenscheiden", "Metastase", "Metastase",
 "Mesenchymal", "Metastase", "Neuroepithelial", "Neuroepithelial",
 "Metastase", "Sonstiges", "Nervenscheiden", "Nervenscheiden", "Metastase",
 "Mesenchymal", "Sonstiges", "Nervenscheiden", "Metastase", "Mesenchymal",
 "Mesenchymal", "Metastase", "Nervenscheiden", "Metastase", "Mesenchymal",
 "Metastase", "Metastase", "Nervenscheiden", "Nervenscheiden", "Mesenchymal",
 "Metastase", "Metastase", "Mesenchymal", "Sonstiges", "Metastase",
 "Metastase", "Mesenchymal", "Metastase", "Nervenscheiden", "Metastase",
 "Metastase", "Metastase", "Mesenchymal", "Metastase", "Nervenscheiden",
 "Nervenscheiden", "Sonstiges", "Neuroepithelial", "Sonstiges", "Metastase",
 "Mesenchymal")

# Aufgabe 1 a)
# erstelle zwei geeignete Faktorvektoren, die die Daten über Tumorätiologie und Blutgruppe enthalten:


(blut <- factor(Blutgruppe))

(tumor <- factor(Tumoraetiologie))

# Aufgabe 1 b)

# eindimensionale Absoluthäufigkeitsverteilungen
table(blut)
table(tumor)

# eindimensionale relative Häufigkeitsverteilungen
prop.table(table(blut))
prop.table(table(tumor))

# zweidimensionale Absoluthäufigkeitsverteilung
table(blut, tumor)

# zweidimensionale relative Häufigkeitsverteilung
prop.table(table(blut, tumor))

# Aufgabe 1 c)
# Erg¨anzen Sie die H¨aufigkeitstabellen um n¨utzliche Marginalien!

# zweidimensionale Absoluthäufigkeitsverteilung mit Marginalien
addmargins(table(blut, tumor))

# Aufgabe 1 d)

# Blutgruppen A, B und AB zu Non-0 zusammenfassen
blut2 <- factor(ifelse(blut %in% c("A", "B", "AB"), "Non-0", as.character(blut)))

# Tumorätiologie die Levels Nervenscheiden und Neuroepithelial zu Nervensystem zusammenfassen
tumor2 <- factor(ifelse(tumor %in% c("Nervenscheiden", "Neuroepithelial"),"Nervensystem", as.character(tumor)))

# mit den neues Faktorvektoren alles wiederholen:
table(blut2)
table(tumor2)
prop.table(table(blut2))
prop.table(table(tumor2))
table(blut2, tumor2)
prop.table(table(blut2, tumor2))
addmargins(table(blut2, tumor2))


# Aufgabe 2:
... keine Zeit ...

# Aufgabe 3:
# erstelle df aus den Listen Land, Fl, Bev, BIPKKS, SozSch, SchStu, AlMann, AlFrau, FuEWi, FuEHo, FuESt, Besch, BIPEUR, EExp, EnImp, Strom, Erdgas, Treibhaus2007, TreibhausZiel


df <- data.frame(Land, Fl, Bev, BIPKKS, SozSch, SchStu, AlMann, AlFrau, FuEWi, FuEHo, FuESt, Besch, BIPEUR, EExp, EnImp, Strom, Erdgas, Treibhaus2007, TreibhausZiel)

# 3b)
# Versehen Sie die Zeilen der Matrix mit den jeweiligen Landesnamen und die Spalten mit (sinnhafteren als den in Europa. vrwendeten) Bezeichnungen f¨ur die in ihnen aufgef¨uhrten Kennzahlen!

rownames(df) <- Land
colnames(df) <- c("Fläche", "Bevölkerung", "BIP pro Kopf und Jahr", "Sozialausgaben in % des BIPs", "Schüler pro Lehrer", "Arbeitslosenquote Männer", "Arbeitslosenquote Frauen", "FuE in der Wirtschaft in % des BIPs", "FuE in den Hochschulen in % des BIPs", "FuE im Staat in % des BIPs", "Beschäftigungsquote", "Quartals-BIP in Millionen Euro", "Europa-Export in % des nationalen Gesamtexports", "Netto-Einfuhr an Primärenergie in 1000 Tonnen Rohöleinheiten", "Strompreis in Euro pro Kilowattstunde", "Erdgaspreis in Euro pro Gigajoule", "Treibhausgas-Emmissionen in Tonnen pro Einwohner", "Treibhausgas-Emmissionen Zielwert")

# 4 a)
# Erstellen Sie eine Version der Matrix, deren Zeilen (L¨ander) nach dem BIP in Euro aufsteigend sortiert sind!
df2 <- df[order(df$BIPEUR),]

# 4 b)
# Ermitteln Sie aus den L¨anderdaten in den Spalten der Matrix (also nicht mithilfe der anf¨anglichen (Rohdaten-)Vektoren) sinnvolle (!) Gesamt- oder Durchschnittswerte, die f¨ur die gesamten europ¨aischen L¨ander gelten, sofern m¨oglich! F¨ugen Sie diese ”zusammenfassenden“ Informationen schießlich als eine neue, erste Zeile zur Matrix hinzu. Benennen Sie diese Zeile entsprechend!

df3 <- rbind(c("Europa", mean(df2$Fl), mean(df2$Bev), mean(df2$BIPKKS), mean(df2$SozSch), mean(df2$SchStu), mean(df2$AlMann), mean(df2$AlFrau), mean(df2$FuEWi), mean(df2$FuEHo), mean(df2$FuESt), mean(df2$Besch), mean(df2$BIPEUR), mean(df2$EExp), mean(df2$EnImp), mean(df2$Strom), mean(df2$Erdgas), mean(df2$Treibhaus2007), mean(df2$TreibhausZiel), mean(df2$BIPKKS))

df3

# 4 c)
# Errechnen Sie das Pro-Kopf-BIP in Euro aus den Daten der Matrix 

df4 <- cbind(df2, ProKopf)
BIP = df2$BIPKKS / df2$Bev)

df4
