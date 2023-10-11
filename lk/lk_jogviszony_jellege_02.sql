SELECT lk_Jogviszony_jellege_01.[Szervezeti egység kódja], lk_Jogviszony_jellege_01.[Dolgozó teljes neve], lk_Jogviszony_jellege_01.[Szint 2 szervezeti egység név], lk_Jogviszony_jellege_01.[Szint 3 szervezeti egység név], lk_Jogviszony_jellege_01.[Szint 4 szervezeti egység név], lk_Jogviszony_jellege_01.Kira, lk_Jogviszony_jellege_01.Nexon, lk_Jogviszony_jellege_01.hiba
FROM lk_Jogviszony_jellege_01
WHERE (((lk_Jogviszony_jellege_01.hiba)=1));
