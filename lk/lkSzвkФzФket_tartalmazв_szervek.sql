SELECT DISTINCT tSzem�lyek.[Szint 1 szervezeti egys�g n�v] AS SzervN�v, [Szervezeti egys�g k�dja] As K�d
FROM tSzem�lyek
WHERE tSzem�lyek.[Szint 1 szervezeti egys�g n�v] Like "*  *"
UNION
SELECT DISTINCT  tSzem�lyek.[Szint 2 szervezeti egys�g n�v], [Szervezeti egys�g k�dja]
FROM tSzem�lyek
WHERE tSzem�lyek.[Szint 2 szervezeti egys�g n�v] Like "*  *"
UNION
SELECT DISTINCT  tSzem�lyek.[Szint 3 szervezeti egys�g n�v], [Szervezeti egys�g k�dja]
FROM tSzem�lyek
WHERE tSzem�lyek.[Szint 3 szervezeti egys�g n�v]  Like "*  *"
UNION
SELECT DISTINCT  tSzem�lyek.[Szint 4 szervezeti egys�g n�v], [Szervezeti egys�g k�dja]
FROM tSzem�lyek
WHERE tSzem�lyek.[Szint 4 szervezeti egys�g n�v] Like "*  *"
UNION
SELECT DISTINCT  tSzem�lyek.[Szint 5 szervezeti egys�g n�v], [Szervezeti egys�g k�dja]
FROM tSzem�lyek
WHERE tSzem�lyek.[Szint 5 szervezeti egys�g n�v] Like "*  *"
UNION SELECT DISTINCT  tSzem�lyek.[Szint 6 szervezeti egys�g n�v], [Szervezeti egys�g k�dja]
FROM tSzem�lyek
WHERE tSzem�lyek.[Szint 6 szervezeti egys�g n�v] Like "*  *";
