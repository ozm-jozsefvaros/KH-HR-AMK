SELECT tÁllományUnió20230102.[Járási Hivatal], Count(tÁllományUnió20230102.Adóazonosító) AS [Létszám (fõ)]
FROM tÁllományUnió20231231 INNER JOIN tÁllományUnió20230102 ON tÁllományUnió20231231.Adóazonosító = tÁllományUnió20230102.Adóazonosító
WHERE (((tÁllományUnió20230102.[Járási Hivatal])<>[tÁllományUnió20231231].[Járási Hivatal]) AND ((tÁllományUnió20230102.[Születési év \ üres állás])<>"üres állás"))
GROUP BY tÁllományUnió20230102.[Járási Hivatal];
