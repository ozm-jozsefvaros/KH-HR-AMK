SELECT lkSzemélyekFõosztÉsÖsszesen.Fõosztály AS Fõosztály, lkSzemélyekFõosztÉsÖsszesen.FõosztályiLétszám AS FõosztályiLétszám, [lk_TT-sekFõosztályonként].[Tartósan távollévõk] AS [Tartósan távollévõk], [Tartósan távollévõk]/([FõosztályiLétszám]) AS [TT-sek aránya], lkSzemélyekFõosztÉsÖsszesen.KözpontosítottLétszám AS [Központosított létszám]
FROM [lk_TT-sekFõosztályonként] RIGHT JOIN lkSzemélyekFõosztÉsÖsszesen ON [lk_TT-sekFõosztályonként].Fõosztály = lkSzemélyekFõosztÉsÖsszesen.Fõosztály
ORDER BY [lkSzemélyekFõosztÉsÖsszesen].[Sor] & ".", [lk_TT-sekFõosztályonként].SzSz;
