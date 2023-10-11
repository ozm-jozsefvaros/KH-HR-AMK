SELECT Adóazonosító, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] AS SzervezetKód, [Álláshely azonosító], [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Név
FROM Járási_állomány
WHERE  [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] <>""
UNION
SELECT Adóazonosító, [ÁNYR SZERVEZETI EGYSÉG AZONOSÍTÓ] AS SzervezetKód, [Álláshely azonosító], [Garantált bérminimumban részesül (GB) / tartós távollévõ nincs h], [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Név
FROM Kormányhivatali_állomány
WHERE  [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] <>""
UNION SELECT Adóazonosító, [Nexon szótárelemnek megfelelõ szervezeti egység azonosító] AS SzervezetKód, [Álláshely azonosító], [Tartós távollévõ nincs helyettese (TT)/ tartós távollévõnek van ], [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp], Név
FROM Központosítottak
WHERE  [Tartós távollévõ esetén a távollét jogcíme (CSED, GYED, GYES, Tp] <>"";
