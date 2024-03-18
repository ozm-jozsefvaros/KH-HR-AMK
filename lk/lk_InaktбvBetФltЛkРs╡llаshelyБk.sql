SELECT [Szervezetmenedzsment kód]*1 AS Adójel, tSzervezeti.[Státuszának kódja], tSzervezeti.[Érvényesség kezdete], tSzervezeti.[Érvényesség vége]
FROM tSzervezeti
WHERE (((tSzervezeti.[Érvényesség kezdete])<(SELECT TOP 1 tHaviJelentésHatálya.hatálya
FROM tHaviJelentésHatálya
GROUP BY tHaviJelentésHatálya.hatálya
ORDER BY First(tHaviJelentésHatálya.[rögzítés]) DESC)) AND ((tSzervezeti.[Érvényesség vége])>(SELECT TOP 1 tHaviJelentésHatálya.hatálya
FROM tHaviJelentésHatálya
GROUP BY tHaviJelentésHatálya.hatálya
ORDER BY First(tHaviJelentésHatálya.[rögzítés]) DESC)) AND ((tSzervezeti.OSZLOPOK)="Státusz betöltés") AND ((tSzervezeti.[Státuszbetöltés típusa])="Inaktív"))
AND "######Azok számítanak inaktívnak, akik a Szervezeti alapriportban olyan sorral rendelkeznek, amelyikben a státuszbetöltés inaktív, és az érvényesség a havi létszámjelentés dátuma elõtt kezdõdött és azt követõen ér véget.#####"<>"";
