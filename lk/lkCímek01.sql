SELECT strcount(Nz([�lland� lakc�m],"")," ") AS Kif1, lkSzem�lyek.[St�tusz neve]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY strcount(Nz([�lland� lakc�m],"")," ") DESC;
