SELECT lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkKiraHiba.Ad�jel, lkKiraHiba.N�v, lkKiraHiba.Hiba, tKiraHiba�zenetek.Magyar�zat
FROM tKiraHiba�zenetek, lkKiraHiba INNER JOIN lkSzem�lyek ON lkKiraHiba.Ad�jel=lkSzem�lyek.Ad�jel
WHERE (((lkKiraHiba.Hiba) Like [Hiba�zenet]) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.BFKH, lkKiraHiba.N�v;
