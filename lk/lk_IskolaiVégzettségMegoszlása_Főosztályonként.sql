TRANSFORM Count(lkSzemélyek_Jelen.adójel) AS CountOfadójel
SELECT arab(kerkiemel(Nz([lkSzemélyek_Jelen].[Szint 4 szervezeti egység név],""))) AS Kif2, Trim([Szint 4 szervezeti egység név] & [Szint 3 szervezeti egység név]) AS [Fõosztály ill hivatal]
FROM lkSzemélyek_Jelen
WHERE (((lkSzemélyek_Jelen.[Szervezeti egység kódja]) Is Not Null) And ((lkSzemélyek_Jelen.[Státusz típusa]) Is Not Null))
GROUP BY arab(kerkiemel(Nz([lkSzemélyek_Jelen].[Szint 4 szervezeti egység név],""))), Trim([Szint 4 szervezeti egység név] & [Szint 3 szervezeti egység név])
ORDER BY arab(kerkiemel(Nz([lkSzemélyek_Jelen].[Szint 4 szervezeti egység név],""))), Trim([Szint 4 szervezeti egység név] & [Szint 3 szervezeti egység név])
PIVOT lkSzemélyek_Jelen.[Iskolai végzettség foka];
