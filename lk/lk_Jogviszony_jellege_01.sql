SELECT lkSzemélyek.BFKH, lkSzemélyek.Fõosztály, lkSzemélyek.Osztály, lkSzemélyek.[Dolgozó teljes neve], IIf([KIRA jogviszony jelleg]="Politikai jogviszony","Politikai szolgálati jogviszony",IIf([KIRA jogviszony jelleg]="Fegyveres szervek hiv. állományú tagjainak szolgv.","Hivatásos állományú",[KIRA jogviszony jelleg])) AS Kira, IIf([Jogviszony típusa / jogviszony típus]="Kormányzati szolgálati jogviszony",[Jogviszony típusa / jogviszony típus] & " (KIT)",[Jogviszony típusa / jogviszony típus]) AS Nexon, IIf([KIRA]<>[NEXON],1,0) AS hiba, kt_azNexon_Adójel02.NLink
FROM kt_azNexon_Adójel02 RIGHT JOIN lkSzemélyek ON kt_azNexon_Adójel02.Adójel = lkSzemélyek.Adójel
WHERE (((lkSzemélyek.[Státusz neve])="Álláshely"))
ORDER BY lkSzemélyek.[Dolgozó teljes neve];
