SELECT tSzemélyek.[Dolgozó teljes neve], tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály, tSzemélyek.azonosító
FROM tSzemélyek LEFT JOIN tSzervezetiEgységek ON tSzemélyek.[Szervezeti egység kódja] = tSzervezetiEgységek.[Szervezeti egység kódja]
WHERE (((tSzemélyek.azonosító) In (Select azSzemély FROM alkSzemélyek_csak_az_utolsó_elõfordulások)) AND ((tSzemélyek.[Tartós távollét típusa]) Is Null) AND ((tSzemélyek.[Szervezeti egység kódja]) Is Not Null And (tSzemélyek.[Szervezeti egység kódja]) Not Like "*MEGB*") AND ((tSzemélyek.[Státusz kódja]) Like "S-*"));
