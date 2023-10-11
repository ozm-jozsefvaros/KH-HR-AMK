SELECT tAIKiosk02.Azonosító, lkSzemélyek.[Dolgozó teljes neve], lkSzemélyek.Adójel, lkSzemélyek.[Szervezeti egység kódja], tAIKiosk02.Fõosztály
FROM lkSzemélyek, tAIKiosk02
WHERE (((lkSzemélyek.[Szervezeti egység kódja]) Is Not Null) And ((Trim(Replace([Dolgozó teljes neve],"dr.",""))) Like "*" & Trim(Replace([Név],"dr.","")) & "*") And ((tAIKiosk02.Fõosztály)=lkSzemélyek.Fõosztály))
ORDER BY tAIKiosk02.Azonosító;
