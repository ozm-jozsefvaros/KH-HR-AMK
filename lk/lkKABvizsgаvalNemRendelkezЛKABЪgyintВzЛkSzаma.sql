SELECT 1 as sor, Count(lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Ad�jel) AS L�tsz�m, Sum(IIf([T�voll�v�]="IGEN",1,0)) AS [Tart�s t�voll�v�], L�tsz�m -[Tart�s t�voll�v�] as �sszesen
FROM lkKABvizsg�valNemRendelkez�KAB�gyint�z�k
UNION
SELECT 2 as sor, Count(lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Ad�jel) AS L�tsz�m, Sum(IIf([T�voll�v�]="IGEN",1,0)) AS [Tart�s t�voll�v�], L�tsz�m -[Tart�s t�voll�v�]
FROM lkKABvizsg�valNemRendelkez�KAB�gyint�z�k
WHERE (((lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.[Pr�baid� v�ge])<=#7/1/2024#))
UNION SELECT 3 as sor, Count(lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Ad�jel) AS L�tsz�m, Sum(IIf([T�voll�v�]="IGEN",1,0)) AS [Tart�s t�voll�v�], L�tsz�m -[Tart�s t�voll�v�]
FROM lkKABvizsg�valNemRendelkez�KAB�gyint�z�k
WHERE (((lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.Bel�p�s)>=#1/1/2022#) AND ((lkKABvizsg�valNemRendelkez�KAB�gyint�z�k.[Pr�baid� v�ge])<=#7/1/2024#));
