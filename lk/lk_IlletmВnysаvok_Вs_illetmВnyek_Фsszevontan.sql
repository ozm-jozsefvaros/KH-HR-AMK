SELECT Illetm�nyUni�.F�oszt�ly, Illetm�nyUni�.N�v, Illetm�nyUni�.besorol�s, Illetm�nyUni�.[als� hat�r], Illetm�nyUni�.[fels� hat�r], Illetm�nyUni�.Illetm�ny, Illetm�nyUni�.[Heti munka�r�k sz�ma], Illetm�nyUni�.[40 �r�s illetm�ny], Illetm�nyUni�.[Jogviszony t�pusa], Illetm�nyUni�.Hivatkoz�s AS NLink
FROM (SELECT DISTINCT *
FROM lk_Illetm�nys�vok_�s_illetm�nyek_havi_alapj�n_02
UNION SELECT *
FROM  lk_Illetm�nys�vok_�s_illetm�nyek_szem�lyt�rzs_alapj�n
)  AS Illetm�nyUni�
ORDER BY bfkh([Szervezetk�d]);
