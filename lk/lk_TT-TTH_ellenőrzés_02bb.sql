SELECT lk_TT_TTH_ellen�rz�s_02b.[Helyettes�tett ad�jele] As Ad�jel, "TT" As �llapot
FROM lk_TT_TTH_ellen�rz�s_02b
UNION select
lk_TT_TTH_ellen�rz�s_02b_1.[Helyettes ad�jele], "TTH" As �llapot
FROM  lk_TT_TTH_ellen�rz�s_02b AS lk_TT_TTH_ellen�rz�s_02b_1;
