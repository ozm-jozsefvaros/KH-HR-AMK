SELECT tSzolg�latiId�Elsimer�s.[Szolg�lati elismer�sre jogosults�g / Jubileumi jutalom kezd� d�t] AS SzolgIdKezd, bfkh(Nz([Szervezeti egys�g k�d],0)) AS Kif1, [Azonos�t�]*1 AS Ad�jel, tSzolg�latiId�Elsimer�s.*
FROM tSzolg�latiId�Elsimer�s
WHERE (((bfkh(Nz([Szervezeti egys�g k�d],0))) Is Not Null))
ORDER BY bfkh(Nz([Szervezeti egys�g k�d],0));
