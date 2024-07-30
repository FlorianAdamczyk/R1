### Blatt 9, Aufgabe 3: Matrix-Plots für EuStockMarkets.
### R 4.3.3, 11.7.2024
###*****************************************************

# Struktur- und Inhaltskontrolle ----
#************************************
str(EuStockMarkets)
summary(EuStockMarkets)
head(EuStockMarkets)

# Versuch 1 ----
#***************
# Die Verläufe der vier Indices werden (am Bildschirm)
# "ohne alles" gezeichnet:

matplot(EuStockMarkets)  # Wenig ansprechend.


# Versuch 2 ----
#***************
# Polygonzüge statt Symbol-Ketten, Achsen-Labels,
# Gitterlinien (zu voreingestellten Tickmarks):

matplot(EuStockMarkets, type = "l", lty = "solid",
        xlab = "Börsenhandelstage 1991 - 1998",
        ylab = "Schlusskurs")
grid()


# Versuch 3 ----
#***************
# Ausgabe in PDF-Datei (im DIN-A4-Querformat, maximale
# Formatausnutzung), dickere Polygonzüge, mehr Tickmarks
# und damit Gitterlinien, Überschrift, Gitterlinien
# dicker und gestrichelt, Legende (mit undurchsichtig
# weißem Hintergrund; nötig für PDF):

pdf("EuStockmarkets_V3.pdf", paper = "a4r",
    width = 0, height = 0)
 matplot(EuStockMarkets, type = "l", lty  = "solid",
         lwd = 2, lab = c(10, 10, 0),
         ylab = "Schlusskurs",
         xlab = "Börsenhandelstage 1991 - 1998",
         main = paste("Tägliche Schlusskurse vierer",
                      "Europäischer Börsenindices,",
                      "1991 – 1998"))
 grid(lwd = 2, lty = "dashed")
 legend("topleft", lty = "solid", lwd = 2, col = 1:4,
        legend = c("DAX", "SMI", "CAC", "FTSE"),
        bg = "white")
dev.off()


# Versuch 4 ----
#***************
# Wie eben, nur dass durch matplot erst ein *leeres*
# Koordinatensystem gezeichnet wird (type = "n"),
# dann die Gitterlinien und danach die Polygonzüge
# durch matlines. Vorteil: Gitterlinien liegen
# *hinter* den Polygonzügen:

pdf("EuStockmarkets_V4.pdf", paper = "a4r",
    width = 0, height = 0)
 matplot(EuStockMarkets, type = "n", lab = c(10, 10, 0),
         ylab = "Schlusskurs",
         xlab = "Börsenhandelstage 1991 - 1998",
         main = paste("Tägliche Schlusskurse vierer",
                      "Europäischer Börsenindices,",
                      "1991 – 1998"))
 grid(lwd = 2, lty = "dashed")
 matlines(EuStockMarkets, lty  = "solid", lwd = 2)
 legend("topleft", lty = "solid", lwd = 2, col = 1:4,
        legend = c("DAX", "SMI", "CAC", "FTSE"),
        bg = "white")
dev.off()

