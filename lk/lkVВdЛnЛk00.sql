SELECT tV�d�n�k.Ad�jel, tV�d�n�k.D�tum, tV�d�n�k.V�d�n�, tV�d�n�k.[Vezet� v�d�n�], tV�d�n�k.CsVSz, [tV�d�n�k].[Ad�jel] & "" AS Ad�azonos�t�, lkSzem�lyek.[Dolgoz� teljes neve], lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)]
FROM tV�d�n�k INNER JOIN lkSzem�lyek ON tV�d�n�k.Ad�jel = lkSzem�lyek.Ad�jel;
