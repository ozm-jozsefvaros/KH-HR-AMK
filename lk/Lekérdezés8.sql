SELECT lkSzem�lyek.Ad�jel, lkSzem�lyek.[St�tusz t�pusa]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz t�pusa]) Like "Szer*" Or (lkSzem�lyek.[St�tusz t�pusa]) Like "K�zp*"));
