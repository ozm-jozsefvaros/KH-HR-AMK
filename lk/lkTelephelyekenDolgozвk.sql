SELECT lkSzemélyTelephelyek.[Szervezeti egység kódja], lkSzemélyTelephelyek.Fõosztály, lkSzemélyTelephelyek.Osztály, lkTelephelyek.Sorszám, lkSzemélyTelephelyek.[Dolgozó teljes neve], lkTelephelyek.Irsz, lkTelephelyek.Város, lkTelephelyek.Cím, lkTelephelyek.Tulajdonos, lkTelephelyek.Üzemeltetõ, 1 AS Létszám
FROM lkTelephelyek RIGHT JOIN lkSzemélyTelephelyek ON lkTelephelyek.Cím_Személyek=lkSzemélyTelephelyek.TelephelyCíme
ORDER BY bfkh([Szervezeti egység kódja]);
