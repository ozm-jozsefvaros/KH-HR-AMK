SELECT lk_HavibólÁlláshelyek.Tábla AS Zóna, lk_HavibólÁlláshelyek.[Az álláshely megynevezése] AS Besorolás_bemenet, lk_HavibólÁlláshelyek.[Álláshely száma] AS Nexonban
FROM lk_HavibólÁlláshelyek
WHERE (((lk_HavibólÁlláshelyek.Tábla)="Központosított"))
ORDER BY lk_HavibólÁlláshelyek.Azonosító;
