SELECT tSzolgálatiIdõElsimerés.[Szolgálati elismerésre jogosultság / Jubileumi jutalom kezdõ dát] AS SzolgIdKezd, bfkh(Nz([Szervezeti egység kód],0)) AS Kif1, [Azonosító]*1 AS Adójel, tSzolgálatiIdõElsimerés.*
FROM tSzolgálatiIdõElsimerés
WHERE (((bfkh(Nz([Szervezeti egység kód],0))) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egység kód],0));
