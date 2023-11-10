SELECT lk_Jogviszony_jellege_01.BFKH, lk_Jogviszony_jellege_01.[Dolgozó teljes neve], lk_Jogviszony_jellege_01.Fõosztály, lk_Jogviszony_jellege_01.Osztály, lk_Jogviszony_jellege_01.Kira, lk_Jogviszony_jellege_01.Nexon, lk_Jogviszony_jellege_01.NLink
FROM lk_Jogviszony_jellege_01
WHERE (((lk_Jogviszony_jellege_01.Nexon)<>[Kira]));
