TRANSFORM Count(lkSzem�lyek.azonos�t�) AS CountOfad�jel
SELECT "BFKH.1" AS Kif1, "�sszesen:" AS [F�oszt�ly ill hivatal]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[Szervezeti egys�g k�dja]) Is Not Null) AND ((lkSzem�lyek.[St�tusz t�pusa]) Is Not Null))
GROUP BY "�sszesen:"
PIVOT lkSzem�lyek.[Iskolai v�gzetts�g foka] In ("","�ltal�nos iskola 8 oszt�ly","Egyetemi /fels�fok� (MA/MsC) vagy osztatlan k�pz.","�retts.biz.szakk�pes-vel,k�pes�t� biz.","�retts.biz.Szakk�p-vel,�retts.�p.�iskr-ben szakk�p","�retts�gi biz. szakk�pes�t�s n�lk (pl: gimn.�r.)","Fels�okt-i (fels�fok�) szakk�pz�sben szerzett biz.","F�iskolai vagy fels�fok� alapk�pz�s (BA/BsC)okl.","Gimn�zium","Szakiskola","Szakk�pzetts�g �retts�gi bizony�tv�ny n�lk�l","Szakk�z�piskola","Szakmunk�sk�pz� iskola","Technikum");
