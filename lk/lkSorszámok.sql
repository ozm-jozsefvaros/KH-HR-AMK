SELECT ([Ten1].[N]+[Ten10].[N]*10+[Ten100].[N]*100)+1 AS Sorszám
FROM (SELECT DISTINCT Abs([id] Mod 10) AS N FROM MSysObjects)  AS Ten1, (SELECT DISTINCT Abs([id] Mod 10) AS N FROM MSysObjects)  AS Ten10, (SELECT DISTINCT Abs([id] Mod 10) AS N FROM MSysObjects)  AS Ten100;
