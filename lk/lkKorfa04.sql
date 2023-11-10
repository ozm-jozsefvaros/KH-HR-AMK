SELECT Unió.Korcsoport, Unió.Férfiak AS Férfi, Unió.Nõk AS Nõ
FROM (SELECT *
  FROM lkKorfa02
  UNION
  SELECT *
  FROM lkKorfa03
  )  AS Unió;
