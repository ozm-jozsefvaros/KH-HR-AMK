SELECT lkKiraHibaJav.Hibák, Count(lkKiraHibaJav.Azonosító) AS Mennyiség
FROM (SELECT IIf([Hiba] Like "A dolgozó új belépõként lett rögzítve * hatály dátummal. Csak az adott napon érvényes adatok kerülnek feldolgozásra.","##A dolgozó...##",[hiba]) AS Hibák, lkKiraHiba.Azonosító FROM lkKiraHiba)  AS lkKiraHibaJav
GROUP BY lkKiraHibaJav.Hibák;
