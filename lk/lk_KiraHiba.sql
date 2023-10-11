SELECT tKiraHiba.Azonosító, lkSzemélyek.[Szervezeti egység kódja], tSzervezetiEgységek.Fõosztály, tSzervezetiEgységek.Osztály, tKiraHiba.Adóazonosító, tKiraHiba.Név, tKiraHiba.Hiba
FROM (tKiraHiba LEFT JOIN lkSzemélyek ON tKiraHiba.Adóazonosító = lkSzemélyek.Adójel) LEFT JOIN tSzervezetiEgységek ON lkSzemélyek.[Szervezeti egység kódja] = tSzervezetiEgységek.[Szervezeti egység kódja]
WHERE (((tKiraHiba.Hiba) Like "*kitöltve*" Or (tKiraHiba.Hiba) Like "*kötelezõ*" Or (tKiraHiba.Hiba) Like "*nincs*") AND ((lkSzemélyek.[Státusz neve])="álláshely"))
ORDER BY bfkh(Nz([lkSzemélyek].[Szervezeti egység kódja],0)), tKiraHiba.Név;
