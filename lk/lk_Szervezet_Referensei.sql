SELECT tSzervezetiEgys�gek.azSzervezet, tSzervezetiEgys�gek.F�oszt�ly, tSzervezetiEgys�gek.Oszt�ly, tSzervezetiEgys�gek.[Szervezeti egys�g k�dja], ktReferens_SzervezetiEgys�g.azRef
FROM ktReferens_SzervezetiEgys�g RIGHT JOIN tSzervezetiEgys�gek ON ktReferens_SzervezetiEgys�g.azSzervezet=tSzervezetiEgys�gek.azSzervezet;
