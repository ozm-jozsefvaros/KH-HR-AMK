SELECT tÁllományUnió20231231.[Járási Hivatal], Count(tÁllományUnió20231231.Adóazonosító) AS [Létszám (fõ)]
FROM tÁllományUnió20231231 INNER JOIN tÁllományUnió20230102 ON tÁllományUnió20231231.Adóazonosító = tÁllományUnió20230102.Adóazonosító
WHERE (((tÁllományUnió20231231.[Járási Hivatal])<>[tÁllományUnió20230102].[Járási Hivatal]) AND ((tÁllományUnió20231231.[Születési év \ üres állás])<>"üres állás"))
GROUP BY tÁllományUnió20231231.[Járási Hivatal];
