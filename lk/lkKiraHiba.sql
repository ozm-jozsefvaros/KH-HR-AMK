SELECT tKiraHiba.Azonosító, [Adóazonosító]*1 AS Adójel, tKiraHiba.Név, tKiraHiba.KIRAzonosító, tKiraHiba.Egység, tKiraHiba.Hiba, tKiraHiba.ImportDátum
FROM lkSzemélyek RIGHT JOIN tKiraHiba ON lkSzemélyek.Adójel = tKiraHiba.Adóazonosító
WHERE (((tKiraHiba.ImportDátum)=#9/18/2023#) AND ((lkSzemélyek.[Státusz neve])="Álláshely"));
