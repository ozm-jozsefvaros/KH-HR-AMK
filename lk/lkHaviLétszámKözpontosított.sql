SELECT Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító] AS BFKHKód, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ6],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, Központosítottak.Mezõ7 AS Osztály, Sum(IIf([Mezõ4]="üres állás",0,1)) AS Betöltött, Sum(IIf([Mezõ4]="üres állás",1,0)) AS Üres
FROM Központosítottak
GROUP BY Központosítottak.[Nexon szótárelemnek megfelelõ szervezeti egység azonosító], IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ6],[Megyei szint VAGY Járási Hivatal]), Központosítottak.Mezõ7;
