#Listner, Leon. 8108323
#Aufgabe 2

#a)
Geburtsdaten <- scan("Geburtsdaten.txt", what = character(0))
#Geburtsdaten ist ein character Vektor, wobei jedes Geburtsdatum ein string ist.
Geburtsdaten

#b)
Mehrfach <- function(x) {
  Mehrfach1 <- duplicated(x) | rev(duplicated(rev(x)))
  Mehrfach2 <- Geburtsdaten[Mehrfach1]
}

Doppelt <- Mehrfach(Geburtsdaten)
length(Doppelt)
#29990 Einträge kommen doppelt oder häufiger vor

