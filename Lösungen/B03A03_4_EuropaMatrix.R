### Blatt 3, Aufgaben 3 und 4: Bearbeitung der Europa-Daten
### R 4.3.3, 16.5.2024
###**********************************************************

# Aufgabe 3 ----
#***************
source("Europa.R" #, encoding = "cp1252"
       )

  # Eventuell nötig, um falsch kodierte deutsche Umlaute
  # korrekt zu kodieren:
# Encoding(Land) <- "UTF-8"

## Eine mögliche Lösung für a) & b) ----
#***************************************
# Mit etwas sparsamer Spaltenbenennung

E1 <- cbind(Fläche = Fl, Bevölk = Bev,
            BIPKKSproKopf = BIPKKS, Sozialschutz = SozSch,
            SchülerStudies = SchStu,
            ArbeitslMann = AlMann, ArbeitslFrau = AlFrau,
            FuEWirtschaft = FuEWi, FuEHochsch = FuEHo,
            FuEStaat = FuESt, BeschQuote = Besch, BIPEUR,
            EExporte = EExp, EnergieImport = EnImp,
            Strompreis = Strom, Erdgaspreis = Erdgas,
            Treibhaus2007, TreibhausZiel)
rownames(E1) <- Land


## Eine andere Lösung für a) & b) ----
#*************************************
# Mit etwas ausführlicheren Spaltennamen

E2 <- cbind(Fl, Bev, BIPKKS, SozSch, SchStu, AlMann, AlFrau,
            FuEWi, FuEHo, FuESt, Besch, BIPEUR, EExp, EnImp,
            Strom, Erdgas, Treibhaus2007, TreibhausZiel)

dimnames(E2) <- list(Land,
     c("Fläche1000qkm", "Bevölkerung", "BIP.KKSproKopf",
       "Sozialschutz.KKSproKopf", "SchülerStudierende1000",
       "QuoteArbeitsloseMänner", "QuoteArbeitsloseFrauen",
       "FuEQuote.Wirtschaft", "FuEQuote.Hochschulen",
       "FuEQuote.Staat", "Beschäftigungsquote", "BIP.MioEUR",
       "EExportProzent", "EnergieImport.1000tROeE",
       "Strom.EURproKWh", "Erdgas.EURproGJ",
       "Treibhausgasemissionen2007.tproKopf",
       "TreibhausgasemissionenZiel.tproKopf"))



# Aufgabe 4 ----
#***************

## a) ----
#*********
# Matrix, deren Zeilen (Länder) nach dem BIP aufsteigend sortiert sind:
BIP.order <- order(E2[, "BIP.MioEUR"])
E2.nach.BIP.sortiert <- E2[BIP.order, ]

head(E2.nach.BIP.sortiert, 3)   # Kontrolle des Matrix-"Anfangs".
tail(E2.nach.BIP.sortiert, 7)   # Kontrolle des Matrix-"Endes".

  # Beachten Sie, wo "missing values" (NA) einsortiert werden!


## b) ----
#*********
# Sinnvolle (!) Gesamt- oder Durchschnittswerte für die europ. Länder:
# Pro Land die Absolutwerte für seine Gesamtbevölkerung
# aus den Pro-Kopf-Angaben bzw. prozentualen (!) Quoten:
(Absolutwerte1 <- E2[, "Bevölkerung"] *
      E2[, c("BIP.KKSproKopf", "Sozialschutz.KKSproKopf",
             "Treibhausgasemissionen2007.tproKopf",
             "TreibhausgasemissionenZiel.tproKopf")])

(Absolutwerte2 <- E2[, "Bevölkerung"] *
                  E2[, c("QuoteArbeitsloseMänner",
                         "QuoteArbeitsloseFrauen",
                         "Beschäftigungsquote")] / 100)
  ## Sachfrage: Sind die hier betrachteten Quoten in der
  ## Realität tatsächlich bezogen auf die Gesamtbevölkerung
  ## (also z. B. einschl. Kinder, Ruheständler:innen und
  ## Selbstständige)? Und wenn nein, hat das Konsequenzen 
  ## für die Richtigkeit der unten schließlich berechneten
  ## Endergebnisse?


# Pro Land die Absolutwerte für seine F&E-Ausgaben aus
# den BIP-prozentualen (!) Quoten:
(FuE.absolut <- E2[, "BIP.MioEUR"] *
                E2[, c("FuEQuote.Hochschulen",
                       "FuEQuote.Staat",
                       "FuEQuote.Wirtschaft")] / 100)

# Absolute Summen europaweit über alle Länder hinweg:
(EweiteSummen <- colSums(E2[, c("Bevölkerung",
                                "Fläche1000qkm",
                                "BIP.MioEUR",
                                "EnergieImport.1000tROeE",
                                "SchülerStudierende1000")],
                         na.rm = TRUE))

  ## Zusatzfrage: Wie könnte man eine länderspezifische
  ## und eine europaweite Bevölkerungsdichte berechnen?


# Wir tun so, als ob wir für den Erdgas- und den Strompreis
# einen einfachen (also ungewichteten) europaweiten Gesamt-
# durchschnitt angeben dürfen, was faktisch falsch ist:
(EweiteMittel <- colMeans(E2[, c("Erdgas.EURproGJ",
                                 "Strom.EURproKWh")],
                          na.rm = TRUE))


(BevGewichteteProKopfMittel <- colSums(Absolutwerte1,
                                       na.rm = TRUE) /
                               EweiteSummen["Bevölkerung"])

(BevGewichteteQuotenMittel <- 100 * colSums(Absolutwerte2,
                                            na.rm = TRUE) /
                              EweiteSummen["Bevölkerung"])


(BIPGewichteteQuotenMittel <- 100 * colSums(FuE.absolut,
                                            na.rm = TRUE) /
                              EweiteSummen["BIP.MioEUR"])

# Da wir logischerweise für "EExportProzent" keinen europa-
# weiten Durchschnitt angeben können, setzen wir in der
# folgenden Zusammenfassung das Resultat dafür auf NA:
(AlleWerte <- c(EExportProzent = NA, EweiteSummen,
                EweiteMittel, BevGewichteteProKopfMittel,
                BevGewichteteQuotenMittel,
                BIPGewichteteQuotenMittel))

# Permutation der Elemente in AlleWerte, sodass ihre Rei-
# henfolge zu der Spaltenreihenfolge der Matrix E2 passt:
(AlleWerte <- AlleWerte[colnames(E2)])

(E2Gesamt <- rbind(Europa = AlleWerte, E2))


## c) ----
#*********
# Pro-Kopf-BIP ableiten und als Spalte zur Gesamtdatenmatrix
# hinzufügen (neben Spalte "BIP"):
  (ProKopfBIPEUR <- 1000000 * E2Gesamt[, "BIP.MioEUR"] /
                  E2Gesamt[, "Bevölkerung"])
E2Gesamt <- cbind(E2Gesamt, ProKopfBIPEUR)

wo <- which(colnames(E2Gesamt) == "BIP.MioEUR")
(E2Gesamt <- E2Gesamt[, c(1:wo, ncol(E2Gesamt),
                          (wo+1):(ncol(E2Gesamt)-1))])


# Aufräumen ----
#***************
rm(list = ls())
