SELECT DISTINCT lkTelephelyek.Sorszám, lkTelephelyek.Irsz, lkTelephelyek.Város, lkTelephelyek.Cím, lkTelephelyek.Tulajdonos, lkTelephelyek.Üzemeltetõ, Count(lkSzemélyTelephelyek.Adójel) AS Létszám
FROM lkTelephelyek RIGHT JOIN lkSzemélyTelephelyek ON lkTelephelyek.Cím_Személyek = lkSzemélyTelephelyek.TelephelyCíme
GROUP BY lkTelephelyek.Sorszám, lkTelephelyek.Irsz, lkTelephelyek.Város, lkTelephelyek.Cím, lkTelephelyek.Tulajdonos, lkTelephelyek.Üzemeltetõ;
