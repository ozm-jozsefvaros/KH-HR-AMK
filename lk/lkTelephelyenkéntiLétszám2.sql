SELECT lkSzem�lyek.[Munkav�gz�s helye - c�m], Count(lkSzem�lyek.Azonos�t�) AS [L�tsz�m (f�)]
FROM lkSzem�lyek
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely") AND ((lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)])>Date()-1 Or (lkSzem�lyek.[Jogviszony v�ge (kil�p�s d�tuma)]) Is Null))
GROUP BY lkSzem�lyek.[Munkav�gz�s helye - c�m]
ORDER BY Count(lkSzem�lyek.Azonos�t�) DESC;
