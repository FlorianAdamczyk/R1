### Der Europa-Datensatz, Version 21. 4. 2010
### Quelle:       http://epp.eurostat.ec.europa.eu
### "Disclaimer": http://europa.eu/geninfo/legal_notices_de.htm
###************************************************************
Land <- c( "Belgien", "Bulgarien", "Tschechien", "Dänemark", "Deutschland",
           "Estland", "Irland", "Griechenland", "Spanien", "Frankreich",
           "Italien", "Zypern", "Lettland", "Litauen", "Luxemburg", "Ungarn",
           "Malta", "Niederlande", "Österreich", "Polen", "Portugal",
           "Rumänien", "Slowenien", "Slowakei", "Finnland", "Schweden",
           "Vereinigtes Königreich", "Kroatien", "Mazedonien", "Türkei",
           "Island", "Norwegen", "Schweiz")

# Gesamtfläche in 1000 Quadratkilometern (Stand 2010):
Fl <- c( 30.5, 111.5, 79, 43, 357, 45.5, 70, 132, 505, 544, 302, 9, 63, 64,
         3, 93, 0.2, 35, 85, 313, 92, 238, 20, 49, 305, 412, 244, 56, 25.7,
         782, 103, 385, 41.2)

# Bevölkerung (Stand 2010):
Bev <- c( 10827519, 7576751, 10512397, 5547088, 81757595, 1340274, 4450878,
          11306183, 46087170, 64709480, 60397353, 801851, 2248961, 3329227,
          502207, 10013628, 416333, 16576800, 8372930, 38163895, 10636888,
          21466174, 2054119, 5424057, 5350475, 9347899, 62041708, NA, NA, NA,
          318755, 4854824, 7760477)

# Bruttoinlandsprodukt (BIP) in Kaufkraftstandards (KKS) pro Kopf
# (Stand 2008, EU-27 = 100):
BIPKKS <- c( 115.1, 41.3, 80.3, 120.1, 115.6, 67.4, 135.4, 94.3, 102.6,
             107.9, 102, 95.8, 57.3, 61.9, 276.3, 64.4, 76.3, 134, NA,
             56.4, 76, NA, 90.9, 72.2, 116.8, 120, 116.2, 62.6, NA, 45.5,
             120.6, 191.2, 140.7)

# Ausgaben für Sozialschutz in KKS pro Kopf (Stand 2007):
SozSch <- c( 8657.6, 1404.7, 3717.8, 8630.2, 7943.1, 2156.1, 7054.4,
             5719.9, 5526.4, 8264.3, 6773.3, 4175.9, 1580, 2135.9, 13231.3,
             3477.8, 3500.9, 9293.2, 8640.2, 2428.7, 4700.6, 1352.2, 4760.5,
             2675.1, 7321.2, 9028, 7455.1, NA, NA, NA, 6496.9, 10141.4, 9026)

# Anzahl an SchülerInnen und Studierenden in 1000 (Stand 2007):
SchStu <- c( 2417.7, 1175.2, 1855.6, 1154.5, 14250.6, 268.4, 1054.3, 1964.4,
             7555.7, 12296, 9500.2, 145.8, 449.8, 759.7, 75.8, 1916.1, 74.8,
             3345.5, 1457.3, 8416.3, 1881.1, 3839.4, 394.8, 1079.4, 1251.3,
             2060.6, 12606.9, 728.1, 368.5, 16687.3, 85, 1078.9, 1349.8)

# Arbeitslosenquote der Männer in Prozent (Stand 2009, saisonbereinigt):
AlMann <- c( 7.7, 6.9, 6, 6.6, 8, 16.7, 14.8, NA, 17.9, 9.1, NA, 5.1, 20.6,
             17.4, 5.3, 10.3, 6.6, 3.4, 5.2, 7.8, 9, NA, 6.1, 11.2, 8.9, 8.6,
             NA, 8.7, NA, NA, NA, NA, NA)

# Arbeitslosenquote der Frauen in Prozent (Stand 12/2009, saisonbereinigt):
AlFrau <- c( 8.1, 7.5, 8.8, 6.4, 6.8, NA, 9.2, NA, 19.4, 10.3, 10, 6.2, 19.3,
             NA, 6.7, 10.3, 7.9, 4, 4.9, 8.9, 11, NA, 6.6, 13.9, 7.9, 8.5,
             NA, 11, NA, NA, NA, NA, NA)

# Aufwendungen für Forschung und Entwicklung (FuE) in der Wirtschaft in
# Prozent des BIPs (Stand 2008):
FuEWi <- c( 1.32, 0.15, 0.91, 1.91, 1.84, 0.56, 0.93, NA, 0.74, 1.27, 0.6,
            0.11, 0.15, 0.19, 1.32, 0.53, 0.35, 0.89, 1.88, 0.19, 0.76,
            0.18, 1.07, 0.2, 2.76, 2.78, 1.21, 0.4, NA, NA, 1.45, 0.87, NA)

# Aufwendungen für FuE in den Hochschulen in Prozent des BIPs (Stand 2008):
FuEHo <- c( 0.41, 0.05, 0.25, 0.72, 0.43, 0.56, 0.39, NA, 0.36, 0.4, 0.39,
            0.22, 0.29, 0.43, 0.05, 0.22, 0.17, 0.52, 0.64, 0.2, 0.51, 0.17,
            0.22, 0.11, 0.64, 0.8, 0.47, 0.27, NA, NA, 0.67, 0.51, NA)

# Aufwendungen für FuE im Staat in Prozent des BIPs (Stand 2008):
FuESt <- c( 0.17, 0.28, 0.31, 0.09, 0.36, 0.15, 0.08, NA, 0.25, 0.32, 0.16,
            0.1, 0.17, 0.19, 0.25, 0.23, 0.01, 0.21, 0.14, 0.21, 0.12, 0.24,
            0.36, 0.15, 0.3, 0.17, 0.16, 0.23, NA, NA, 0.47, 0.24, NA)

# Beschäftigungsquote in Prozent (Stand 2008):
Besch <- c( 62.4, 64, 66.6, 78.1, 70.7, 69.8, 67.6, 61.9, 64.3, 64.9, 58.7,
            70.9, 68.6, 64.3, 63.4, 56.7, 55.3, 77.2, 72.1, 59.2, 68.2, 59,
            68.6, 62.3, 71.1, 74.3, 71.5, 57.8, 41.9, 45.9, 83.6, 78, 79.5)

# Quartals-BIP in Millionen Euro (Stand 3. Quartal 2009, saisonbereinigt):
BIPEUR <- c( 84976, NA, 35391.4, 56030.5, 606830, 3249.2, 41220, 59641.6,
             260819, 480449, 384592, 4204.3, 4557, 6585, 9596, 23881.7, 1434.3,
             141812.4, 68287.5, 80277.4, 40903.5, 28168.3, 8597.6, 15878.5,
             42660, NA, 402205.1, NA, NA, NA, NA, 68918.3, 88327)

# Europa-Export in Prozent des nationalen Gesamtexports (Stand 2008):
EExp <- c( 76.9, 60, 84.9, 69.7, 63.3, 70, 62.8, 63.8, 69.6, 63.5, 58.5, 69.3,
            68.6, 60.3, 88.9, 78.2, 45.5, 78.9, 72.2, 77.8, 73.8, 70.5, 68.1,
            85.3, 55.9, 60.1, 57, NA, NA, NA, NA, 83.4, 62)

# Netto-Einfuhr an Primärenergie in 1000 Tonnen Rohöleinheiten (Stand 2007):
EnImp <- c( 51452, 10594, 11592, -5486, 201840, 1877, 14120, 24705, 123337,
            137548, 159505, 2872, 3039, 5778, 4537, 16589, 1786, 38784, 23347,
            25064, 21847, 12821, 3882, 12476, 20473, 18976, 44999, 5336, NA,
            76101, NA, -188453, 16106)

# Strompreis in Euro pro Kilowattstunde (Stand 2009)
Strom <- c( 0.14, 0.07, 0.11, 0.12, 0.14, 0.07, 0.18, 0.11, 0.13, 0.1, NA,
            0.13, 0.1, 0.08, 0.16, 0.12, 0.16, 0.14, 0.14, 0.09, 0.13, 0.08,
            0.11, 0.13, 0.1, 0.1, 0.14, 0.09, NA, 0.09, NA, 0.11, NA)

# Erdgaspreis in Euro pro Gigajoule (Stand 2009):
Erdgas <- c( 13.54, 10.95, 11.55, 12.4, 13.48, 8.99, 15.76, NA, 14.64, 13.01,
             14.19, NA, 13.21, 10, 12.19, 11.15, NA, 14.43, 13.13, 8.85, 15.68,
             5.28, 14.44, 10.78, NA, 14, 11.28, 7.26, NA, 8.91, NA, NA, NA)

# Treibhausgas-Emmissionen in Tonnen pro Einwohner (Stand 2007):
Treibhaus2007 <- c( 90.1, 57.2, 77.6, 96.1, 77.6, 51.7, 124.5, 123.2, 152.6,
                    94.2, 106.9, 185.3, 46.6, 50.1, 98.1, 65.8, 149, 97.4,
                    111.3, 70.8, 136.1, 54.7, 101.8, 65.2, 110.3, 90.7, 82,
                    NA, 103.2, 219.1, 134.9, 110.9, 100.7)

# Angestrebte Treibhausgas-Emmissionen in Tonnen pro Einwohner:
TreibhausZiel <- c( 92.5, 92, 92, 79, 79, 92, 113, 125, 115, 100, 93.5, NA,
                    92, 92, 72, 94, NA, 94, 87, 94, 127, 93, 92, 92, 100, 104,
                    87.5, NA, 95, NA, 110, 101, 97.1)

