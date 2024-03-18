SELECT tBelépõkUnió.*, IIf([Megyei szint VAGY Járási Hivatal]="megyei szint",[Mezõ5],[Megyei szint VAGY Járási Hivatal]) AS Fõosztály, tBelépõkUnió.Mezõ6 AS Osztály, [adóazonosító]*1 AS Adójel
FROM tBelépõkUnió;
