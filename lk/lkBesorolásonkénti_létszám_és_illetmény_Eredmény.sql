SELECT Végösszeggel.Rang_, Végösszeggel.Besorolás, Végösszeggel.Összilletmény, Végösszeggel.Fõ, Végösszeggel.Átlag, Végösszeggel.[Átlagtól való eltérés (StDev)]
FROM (SELECT lkBesorolásonkénti_létszám_és_illetmény_átlaggal.*
FROM lkBesorolásonkénti_létszám_és_illetmény_átlaggal
UNION
SELECT lkBesorolásonkénti_létszám_és_illetmény_Mindösszesen.*
FROM lkBesorolásonkénti_létszám_és_illetmény_Mindösszesen
)  AS Végösszeggel
ORDER BY Végösszeggel.Rang_;
