SELECT DISTINCT lkSzem�lyek.BFKH, lkBesorol�siEredm�nyadatok.Ad�jel, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lkBesorol�siEredm�nyadatok.[Utols� besorol�s d�tuma]
FROM lkSzem�lyek RIGHT JOIN lkBesorol�siEredm�nyadatok ON lkSzem�lyek.[Ad�azonos�t� jel] = lkBesorol�siEredm�nyadatok.[Ad�azonos�t� jel]
WHERE (((lkBesorol�siEredm�nyadatok.[Utols� besorol�s d�tuma])<#12/1/2023#) AND ((lkSzem�lyek.[Jogviszony t�pusa / jogviszony t�pus])="Korm�nyzati szolg�lati jogviszony") AND ((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.BFKH;
