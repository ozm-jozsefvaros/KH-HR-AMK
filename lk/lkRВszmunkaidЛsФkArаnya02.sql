SELECT lkRészmunkaidõsökAránya01.Fõosztály, Sum([Teljes munkaidõs]) AS [Teljes munkaidõs létszám], Sum(lkRészmunkaidõsökAránya01.Részmunkaidõs) AS [Részmunkaidõs létszám]
FROM lkRészmunkaidõsökAránya01
GROUP BY lkRészmunkaidõsökAránya01.Fõosztály;
