SELECT Végösszeggel.Rang_ AS Sorszám, Végösszeggel.Besorolás AS Besorolás, Végösszeggel.Összilletmény AS Összilletmény, Végösszeggel.Fõ AS Fõ, Végösszeggel.Átlag AS Átlag, Végösszeggel.[Átlagtól való eltérés (StDev)] AS [Átlagtól való eltérés (StDev)]
FROM (SELECT lkBesorolásonkénti_létszám_és_illetmény_átlaggal.*
FROM lkBesorolásonkénti_létszám_és_illetmény_átlaggal
UNION
SELECT lkBesorolásonkénti_létszám_és_illetmény_Mindösszesen.*
FROM lkBesorolásonkénti_létszám_és_illetmény_Mindösszesen
)  AS Végösszeggel
ORDER BY Végösszeggel.Rang_;
