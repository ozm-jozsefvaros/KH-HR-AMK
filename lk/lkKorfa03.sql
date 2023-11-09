SELECT "Összesen:" AS Korcsoport, 
  Sum(lkKorfa02.Férfiak) AS Férfiak, 
  Sum(lkKorfa02.Nők) AS Nők
FROM lkKorfa02
GROUP BY "Összesen:";
