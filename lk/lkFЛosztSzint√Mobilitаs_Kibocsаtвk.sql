SELECT t�llom�nyUni�20230102.[J�r�si Hivatal], Count(t�llom�nyUni�20230102.Ad�azonos�t�) AS [L�tsz�m (f�)]
FROM t�llom�nyUni�20231231 INNER JOIN t�llom�nyUni�20230102 ON t�llom�nyUni�20231231.Ad�azonos�t� = t�llom�nyUni�20230102.Ad�azonos�t�
WHERE (((t�llom�nyUni�20230102.[J�r�si Hivatal])<>[t�llom�nyUni�20231231].[J�r�si Hivatal]) AND ((t�llom�nyUni�20230102.[Sz�let�si �v \ �res �ll�s])<>"�res �ll�s"))
GROUP BY t�llom�nyUni�20230102.[J�r�si Hivatal];
