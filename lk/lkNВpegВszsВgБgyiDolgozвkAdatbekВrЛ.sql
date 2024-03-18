SELECT lkNépegészségügyiDolgozók.Adójel, lkNépegészségügyiDolgozók.Név, lkNépegészségügyiDolgozók.Fõosztály, lkNépegészségügyiDolgozók.Osztály, "" AS [Védõnõ?], "" AS [Vezetõ védõnõ?]
FROM lkNépegészségügyiDolgozók
ORDER BY lkNépegészségügyiDolgozók.Fõosztály, lkNépegészségügyiDolgozók.Osztály, lkNépegészségügyiDolgozók.Név;
