SELECT First(lkSzervezetiBetöltések.[Státuszának kódja]) AS [Státuszának kódja Mezõ], Count(lkSzervezetiBetöltések.[Státuszának kódja]) AS AzonosakSzáma
FROM lkSzervezetiBetöltések
GROUP BY lkSzervezetiBetöltések.[Státuszának kódja]
HAVING (((Count(lkSzervezetiBetöltések.[Státuszának kódja]))>1));
