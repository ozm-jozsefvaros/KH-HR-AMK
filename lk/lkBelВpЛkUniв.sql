SELECT tBel�p�kUni�.*, IIf([Megyei szint VAGY J�r�si Hivatal]="megyei szint",[Mez�5],[Megyei szint VAGY J�r�si Hivatal]) AS F�oszt�ly, tBel�p�kUni�.Mez�6 AS Oszt�ly, [ad�azonos�t�]*1 AS Ad�jel
FROM tBel�p�kUni�;
