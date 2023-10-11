SELECT lk_Fõosztály_Osztály_lkSzemélyek.[Szervezeti egység kódja], lk_Fõosztály_Osztály_lkSzemélyek.BFKH, lk_Fõosztály_Osztály_lkSzemélyek.Fõosztály, lk_Fõosztály_Osztály_lkSzemélyek.Osztály, IIf([Osztály]="" Or [Osztály] Is Null,0,utolsó([BFKH],".")*1)+1 AS Sorszám INTO tFõosztályokOsztályokSorszámmal
FROM lk_Fõosztály_Osztály_lkSzemélyek
WHERE (((lk_Fõosztály_Osztály_lkSzemélyek.BFKH) Like "BFKH*"));
