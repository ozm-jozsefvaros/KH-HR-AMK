SELECT lkL�tsz�mBesorol�sonk�ntHavib�lK�zpontos�tott.Z�na, "K�zpontos�tott �sszesen:" AS Besorol�s_bemenet, Sum(lkL�tsz�mBesorol�sonk�ntHavib�lK�zpontos�tott.Nexonban) AS SumOfNexonban
FROM lkL�tsz�mBesorol�sonk�ntHavib�lK�zpontos�tott
GROUP BY lkL�tsz�mBesorol�sonk�ntHavib�lK�zpontos�tott.Z�na, "K�zpontos�tott �sszesen:";
