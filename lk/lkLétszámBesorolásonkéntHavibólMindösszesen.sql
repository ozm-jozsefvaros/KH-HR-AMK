SELECT "Mind�sszesen" AS Z�na, lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m�sK�zpontos�tott.Besorol�s_bemenet, Sum(lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m�sK�zpontos�tott.Nexonban) AS SumOfNexonban
FROM (SELECT lkL�tsz�mBesorol�sonk�ntHavib�lK�zpontos�tott.Z�na, lkL�tsz�mBesorol�sonk�ntHavib�lK�zpontos�tott.Besorol�s_bemenet, lkL�tsz�mBesorol�sonk�ntHavib�lK�zpontos�tott.Nexonban
FROM lkL�tsz�mBesorol�sonk�ntHavib�lK�zpontos�tott
UNION
SELECT lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m.Z�na, lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m.Besorol�s_bemenet, lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m.Nexonban
FROM lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m
)  AS lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m�sK�zpontos�tott
GROUP BY "Mind�sszesen", lkL�tsz�mBesorol�sonk�ntHavib�lAlapl�tsz�m�sK�zpontos�tott.Besorol�s_bemenet;
