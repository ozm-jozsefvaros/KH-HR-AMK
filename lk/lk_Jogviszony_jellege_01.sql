SELECT lkSzem�lyek.BFKH, lkSzem�lyek.F�oszt�ly, lkSzem�lyek.Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve], IIf([KIRA jogviszony jelleg]="Politikai jogviszony","Politikai szolg�lati jogviszony",IIf([KIRA jogviszony jelleg]="Fegyveres szervek hiv. �llom�ny� tagjainak szolgv.","Hivat�sos �llom�ny�",[KIRA jogviszony jelleg])) AS Kira, IIf([Jogviszony t�pusa / jogviszony t�pus]="Korm�nyzati szolg�lati jogviszony",[Jogviszony t�pusa / jogviszony t�pus] & " (KIT)",[Jogviszony t�pusa / jogviszony t�pus]) AS Nexon, IIf([KIRA]<>[NEXON],1,0) AS hiba, kt_azNexon_Ad�jel02.NLink
FROM kt_azNexon_Ad�jel02 RIGHT JOIN lkSzem�lyek ON kt_azNexon_Ad�jel02.Ad�jel = lkSzem�lyek.Ad�jel
WHERE (((lkSzem�lyek.[St�tusz neve])="�ll�shely"))
ORDER BY lkSzem�lyek.[Dolgoz� teljes neve];
