SELECT lkSzemélyTelephelyek.[Munkavégzés helye - cím] AS Telephely, lkSzemélyTelephelyek.Fõosztály, Count(lkSzemélyTelephelyek.adójel) AS Létszám
FROM lkSzemélyTelephelyek
GROUP BY lkSzemélyTelephelyek.[Munkavégzés helye - cím], lkSzemélyTelephelyek.Fõosztály;
