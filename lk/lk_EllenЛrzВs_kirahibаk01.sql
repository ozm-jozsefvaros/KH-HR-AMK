SELECT lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkKiraHiba.Adójel, lkKiraHiba.Név, lkKiraHiba.Hiba, tKiraHibaüzenetek.Magyarázat
FROM tKiraHibaüzenetek, lkKiraHiba INNER JOIN lkSzemélyek ON lkKiraHiba.Adójel=lkSzemélyek.Adójel
WHERE (((lkKiraHiba.Hiba) Like [Hibaüzenet]) AND ((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.BFKH, lkKiraHiba.Név;
