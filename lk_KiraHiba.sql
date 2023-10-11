SELECT tKiraHiba.Azonos�t�, lkSzem�lyek.[Szervezeti egys�g k�dja], tSzervezetiEgys�gek.F�oszt�ly, tSzervezetiEgys�gek.Oszt�ly, tKiraHiba.Ad�azonos�t�, tKiraHiba.N�v, tKiraHiba.Hiba
FROM (tKiraHiba LEFT JOIN lkSzem�lyek ON tKiraHiba.Ad�azonos�t� = lkSzem�lyek.Ad�jel) LEFT JOIN tSzervezetiEgys�gek ON lkSzem�lyek.[Szervezeti egys�g k�dja] = tSzervezetiEgys�gek.[Szervezeti egys�g k�dja]
WHERE (((tKiraHiba.Hiba) Like "*kit�ltve*" Or (tKiraHiba.Hiba) Like "*k�telez�*" Or (tKiraHiba.Hiba) Like "*nincs*") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY bfkh(Nz([lkSzem�lyek].[Szervezeti egys�g k�dja],0)), tKiraHiba.N�v;
