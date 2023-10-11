SELECT FedlaprólÁlláshelyekUnió.Tábla, FedlaprólÁlláshelyekUnió.Azonosító, FedlaprólÁlláshelyekUnió.[Az álláshely megynevezése], FedlaprólÁlláshelyekUnió.[Álláshely száma], *
FROM (SELECT *, "Alaplétszám" as Tábla
FROM FedlaprólLétszámtábla
UNION
SELECT *, "Központosított" as Tábla
FROM FedlaprólLétszámtábla2
)  AS FedlaprólÁlláshelyekUnió
ORDER BY FedlaprólÁlláshelyekUnió.Tábla, FedlaprólÁlláshelyekUnió.Azonosító;
