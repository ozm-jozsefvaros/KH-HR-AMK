SELECT lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkBesorol�sHelyettesek.N�v AS [TT-s neve], lkBesorol�sHelyettesek.Ad�jel AS [TT-s ad�jele], lkSzem�lyek.[Tart�s t�voll�t t�pusa], [Csal�di n�v] & " " & [Ut�n�v] AS [TTH-s neve], lkBesorol�sHelyettesek.Kezdete1, lkBesorol�sHelyettesek.V�ge1, "https://nexonport.kh.gov.hu/menu/hrm/szemelyiKarton/index?szemelyAzonosito=" & [azNexon] & "&r=13" AS Link
FROM kt_azNexon_Ad�jel INNER JOIN (lkSzem�lyek RIGHT JOIN lkBesorol�sHelyettesek ON lkSzem�lyek.[Dolgoz� teljes neve]=lkBesorol�sHelyettesek.N�v) ON kt_azNexon_Ad�jel.Ad�jel=lkBesorol�sHelyettesek.Ad�jel
WHERE (((lkSzem�lyek.[Tart�s t�voll�t t�pusa]) Is Not Null))
ORDER BY lkBesorol�sHelyettesek.N�v, lkBesorol�sHelyettesek.Kezdete1, lkBesorol�sHelyettesek.V�ge1;
