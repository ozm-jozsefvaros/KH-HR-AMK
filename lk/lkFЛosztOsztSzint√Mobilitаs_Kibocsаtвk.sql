SELECT tÁllományUnió20230102.[Járási Hivatal], tÁllományUnió20230102.Osztály, Count(tÁllományUnió20230102.Adóazonosító) AS [Létszám (fõ)]
FROM tÁllományUnió20231231 INNER JOIN tÁllományUnió20230102 ON tÁllományUnió20231231.Adóazonosító = tÁllományUnió20230102.Adóazonosító
WHERE (((tÁllományUnió20230102.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ])<>tÁllományUnió20231231.[ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ]) And ((tÁllományUnió20230102.[Születési év \ üres állás])<>"üres állás"))
GROUP BY tÁllományUnió20230102.[Járási Hivatal], tÁllományUnió20230102.Osztály;
