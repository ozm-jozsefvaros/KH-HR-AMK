SELECT Unió.Korcsoport, 
  Unió.Férfiak AS Férfi, 
  Unió.Nők AS Nő
FROM (
  SELECT *
  FROM lkKorfa02
  UNION
  SELECT *
  FROM lkKorfa03
  )  AS Unió;
