SELECT lk_TT_TTH_ellenõrzés_02b.[Helyettesített adójele] As Adójel, "TT" As Állapot
FROM lk_TT_TTH_ellenõrzés_02b
UNION select
lk_TT_TTH_ellenõrzés_02b_1.[Helyettes adójele], "TTH" As Állapot
FROM  lk_TT_TTH_ellenõrzés_02b AS lk_TT_TTH_ellenõrzés_02b_1;
