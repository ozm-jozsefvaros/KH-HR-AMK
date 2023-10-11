SELECT bfkh([Szervezeti egys�g k�dja]) AS BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, tKiraHiba.Ad�azonos�t�, tKiraHiba.N�v, lkSzem�lyek.[Szervezeti egys�g k�dja], lkSzem�lyek.[St�tusz k�dja], tKiraHiba.Hiba
FROM tKiraHiba LEFT JOIN lkSzem�lyek ON tKiraHiba.Ad�azonos�t� = lkSzem�lyek.Ad�jel
WHERE (((lkSzem�lyek.[St�tusz k�dja]) Like "S-*") AND ((tKiraHiba.Hiba) Not Like "A dolgozo*" And (tKiraHiba.Hiba) Not Like "2-es*" And (tKiraHiba.Hiba) Not Like "*AHELISMD*" And (tKiraHiba.Hiba) Not Like "A dolgoz� �j bel�p�k�nt lett*"))
ORDER BY bfkh([Szervezeti egys�g k�dja]);
