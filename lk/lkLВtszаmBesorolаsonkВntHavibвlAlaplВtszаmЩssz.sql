SELECT lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m.Z�na, "Alapl�tsz�m �sszesen:" AS Besorol�s_bemenet, Sum(lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m.Nexonban) AS SumOfNexonban
FROM lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m
GROUP BY lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m.Z�na, "Alapl�tsz�m �sszesen:";
