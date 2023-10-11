SELECT bfkh([Szervezeti egység kódja]) AS BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, tKiraHiba.Adóazonosító, tKiraHiba.Név, lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.[Státusz kódja], tKiraHiba.Hiba
FROM tKiraHiba LEFT JOIN lkSzemélyek ON tKiraHiba.Adóazonosító = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz kódja]) Like "S-*") AND ((tKiraHiba.Hiba) Not Like "A dolgozo*" And (tKiraHiba.Hiba) Not Like "2-es*" And (tKiraHiba.Hiba) Not Like "*AHELISMD*" And (tKiraHiba.Hiba) Not Like "A dolgozó új belépõként lett*"))
ORDER BY bfkh([Szervezeti egység kódja]);
