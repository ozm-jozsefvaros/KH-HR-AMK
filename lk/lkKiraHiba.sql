SELECT tKiraHiba.Azonos�t�, [Ad�azonos�t�]*1 AS Ad�jel, tKiraHiba.N�v, tKiraHiba.KIRAzonos�t�, tKiraHiba.Egys�g, tKiraHiba.Hiba, tKiraHiba.ImportD�tum
FROM lkSzem�lyek RIGHT JOIN tKiraHiba ON lkSzem�lyek.Ad�jel = tKiraHiba.Ad�azonos�t�
WHERE (((tKiraHiba.ImportD�tum)=#9/18/2023#) AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"));
