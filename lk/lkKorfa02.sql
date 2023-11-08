SELECT Korcsoport, 
  sum([Férfi]) as  Férfiak,
  sum([Nő]) as Nők
FROM lkKorfa01
GROUP BY Korcsoport;
