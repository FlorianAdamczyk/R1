#Listner, Leon. 8108323
#Aufgabe 3

#a)
#Bei angeblich höchstens 3% Ausschuss wären 2 zu erwarten (1+2+3/3)=2.

#b)
dbinom(5, 100, 0.02)
#Die Wahrscheinlichkeit bei einer Ausschussquote von 2% 5 falsche zu bekommen,
#liegt lediglich bei 3,5%

1-pbinom(4, 100, 0.03)
#Ein mindestens so schlechtes Ergebnis bedeutet, dass auch noch mehr falsch 
#sein können, d.h. P(X>=5) = 1-P(X<4), da diskret verteilt.
#Die WSK dafür bei einer Ausschussquote von 3% liegt bei schon eher wahrschein-
#lichen 18,2%.