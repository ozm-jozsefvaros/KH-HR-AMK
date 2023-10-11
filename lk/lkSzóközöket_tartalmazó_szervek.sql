SELECT DISTINCT tSzemélyek.[Szint 1 szervezeti egység név] AS SzervNév, [Szervezeti egység kódja] As Kód
FROM tSzemélyek
WHERE tSzemélyek.[Szint 1 szervezeti egység név] Like "*  *"
UNION
SELECT DISTINCT  tSzemélyek.[Szint 2 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 2 szervezeti egység név] Like "*  *"
UNION
SELECT DISTINCT  tSzemélyek.[Szint 3 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 3 szervezeti egység név]  Like "*  *"
UNION
SELECT DISTINCT  tSzemélyek.[Szint 4 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 4 szervezeti egység név] Like "*  *"
UNION
SELECT DISTINCT  tSzemélyek.[Szint 5 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 5 szervezeti egység név] Like "*  *"
UNION SELECT DISTINCT  tSzemélyek.[Szint 6 szervezeti egység név], [Szervezeti egység kódja]
FROM tSzemélyek
WHERE tSzemélyek.[Szint 6 szervezeti egység név] Like "*  *";
