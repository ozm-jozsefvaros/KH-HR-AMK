SELECT Year([Sz�let�si id�])+65 AS �v, Format([Sz�let�si id�],"mmmm") AS H�, lkMindenVezet�.F�oszt�ly, lkMindenVezet�.Oszt�ly, lkMindenVezet�.Besorol�s2
FROM lkMindenVezet�
WHERE (((Year([Sz�let�si id�])+65)<Year(Date())+4))
ORDER BY Year([Sz�let�si id�])+65, Month([Sz�let�si id�]), lkMindenVezet�.Kif1;
