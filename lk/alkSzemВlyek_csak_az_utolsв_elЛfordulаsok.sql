SELECT lkSzemélyek.Adójel, Max(lkSzemélyek.[Jogviszony sorszáma]) AS [MaxOfJogviszony sorszáma], Max(lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]) AS [MaxOfJogviszony kezdete (belépés dátuma)], First(lkSzemélyek.Azonosító) AS azSzemély
FROM lkSzemélyek
GROUP BY lkSzemélyek.Adójel
ORDER BY lkSzemélyek.Adójel, Max(lkSzemélyek.[Jogviszony sorszáma]) DESC , Max(lkSzemélyek.[Jogviszony kezdete (belépés dátuma)]) DESC;
