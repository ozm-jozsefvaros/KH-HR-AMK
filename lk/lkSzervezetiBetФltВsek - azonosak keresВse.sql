SELECT First(lkSzervezetiBetöltések.[Státuszának kódja]) AS [Státuszának kódja Mező], Count(lkSzervezetiBetöltések.[Státuszának kódja]) AS AzonosakSzáma
FROM lkSzervezetiBetöltések
GROUP BY lkSzervezetiBetöltések.[Státuszának kódja]
HAVING (((Count(lkSzervezetiBetöltések.[Státuszának kódja]))>1));
