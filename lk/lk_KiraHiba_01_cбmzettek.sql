SELECT DISTINCT lk_KiraHiba_01.TO, Count(lk_KiraHiba_01.Adóazonosító) AS CountOfAdóazonosító
FROM lk_KiraHiba_01
GROUP BY lk_KiraHiba_01.TO;
