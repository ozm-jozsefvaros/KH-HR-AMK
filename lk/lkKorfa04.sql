SELECT Uni�.Korcsoport, Uni�.F�rfiak AS F�rfi, Uni�.N�k AS N�
FROM (SELECT *
  FROM lkKorfa02
  UNION
  SELECT *
  FROM lkKorfa03
  )  AS Uni�;
