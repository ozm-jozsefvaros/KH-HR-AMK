SELECT lkKiraHibaJav.Hib�k, Count(lkKiraHibaJav.Azonos�t�) AS Mennyis�g
FROM (SELECT IIf([Hiba] Like "A dolgoz� �j bel�p�k�nt lett r�gz�tve * hat�ly d�tummal. Csak az adott napon �rv�nyes adatok ker�lnek feldolgoz�sra.","##A dolgoz�...##",[hiba]) AS Hib�k, lkKiraHiba.Azonos�t� FROM lkKiraHiba)  AS lkKiraHibaJav
GROUP BY lkKiraHibaJav.Hib�k;
