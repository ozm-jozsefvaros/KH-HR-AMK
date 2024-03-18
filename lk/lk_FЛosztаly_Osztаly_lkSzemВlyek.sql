SELECT DISTINCT lkSzemélyek.[Szervezeti egység kódja], lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, IIf([Osztály]="" Or [Osztály] Is Null,0,utolsó([BFKH],".")*1)+1 AS Sorszám
FROM lkSzemélyek;
