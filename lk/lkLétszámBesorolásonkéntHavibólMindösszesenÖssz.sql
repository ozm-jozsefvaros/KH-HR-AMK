SELECT lkL�tsz�mBesorol�sonk�ntHavib�lMind�sszesen.Z�na, "Mind�sszesen �sszesen:" AS Besorol�s_bemenet, Sum(lkL�tsz�mBesorol�sonk�ntHavib�lMind�sszesen.SumOfNexonban) AS SumOfSumOfNexonban
FROM lkL�tsz�mBesorol�sonk�ntHavib�lMind�sszesen
GROUP BY lkL�tsz�mBesorol�sonk�ntHavib�lMind�sszesen.Z�na, "Mind�sszesen �sszesen:";
