SELECT DISTINCT lkIlletmények.Törzsszám, lkIlletmények.Főosztály, lkIlletmények.Osztály, lkIlletmények.Név, lkIlletmények.[40 órás illetmény], lkIlletmények.TT
FROM lkIlletmények LEFT JOIN lkIlletményekBottom30 ON lkIlletmények.[40 órás illetmény] = lkIlletményekBottom30.[40 órás illetmény]
WHERE (((lkIlletményekBottom30.[40 órás illetmény]) Is Not Null));
