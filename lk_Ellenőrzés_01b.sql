SELECT [01b].T�bla, [01b].Hi�nyz�_�rt�k, [01b].Ad�azonos�t�, [01b].[�ll�shely azonos�t�], [01b].[�NYR SZERVEZETI EGYS�G AZONOS�T�], [Ad�azonos�t�]*1 AS Ad�jel
FROM (SELECT 'lkBel�p�k' AS T�bla, 'Ad�azonos�t�' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k]  WHERE ([lkBel�p�k].[Ad�azonos�t�] Is Null )   

UNION SELECT 'lkBel�p�k' AS T�bla, 'N�v' AS Hi�nyz�_�rt�k, lkBel�p�k.[Ad�azonos�t�], lkBel�p�k.[�ll�shely azonos�t�], lkBel�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [lkBel�p�k]  WHERE ([lkBel�p�k].[N�v] Is Null OR [lkBel�p�k].[N�v]='')   

UNION SELECT 'K�zpontos�tottak' AS T�bla, 'Legmagasabb iskolai v�gzetts�g 1=8. oszt�ly; 2=�retts�gi; 3=f�iskolai v�gzetts�g; 4=egyetemi v�gzetts�g; 5=technikus; 6= KAB vizsga' AS Hi�nyz�_�rt�k, K�zpontos�tottak.[Ad�azonos�t�], K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] FROM [K�zpontos�tottak]  WHERE ([K�zpontos�tottak].[Legmagasabb iskolai v�gzetts�g 1=8 oszt�ly; 2=�retts�gi; 3=f�is] Is Null )  AND ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null )   

UNION SELECT 'K�zpontos�tottak' AS T�bla, 'Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)' AS Hi�nyz�_�rt�k, K�zpontos�tottak.[Ad�azonos�t�], K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] FROM [K�zpontos�tottak]  WHERE ([K�zpontos�tottak].[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)] Is Null OR [K�zpontos�tottak].[Foglalkoztat�s id�tartama Hat�rozatlan (HL) / Hat�rozott (HT)]='')  AND ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null )   



  UNION SELECT 'K�zpontos�tottak' AS T�bla, 'Havi illetm�ny teljes �sszege (kerek�tve) (FT)' AS Hi�nyz�_�rt�k, K�zpontos�tottak.[Ad�azonos�t�], K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] FROM [K�zpontos�tottak]  WHERE ([K�zpontos�tottak].[Mez�17] Is Null )  AND ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null )  

 UNION SELECT 'K�zpontos�tottak' AS T�bla, '�ll�shely azonos�t�' AS Hi�nyz�_�rt�k, K�zpontos�tottak.[Ad�azonos�t�], K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] FROM [K�zpontos�tottak]  WHERE ([K�zpontos�tottak].[�ll�shely azonos�t�] Is Null OR [K�zpontos�tottak].[�ll�shely azonos�t�]='')  AND ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null )

   UNION SELECT 'K�zpontos�tottak' AS T�bla, 'Besorol�si fokozat megnevez�se:' AS Hi�nyz�_�rt�k, K�zpontos�tottak.[Ad�azonos�t�], K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] FROM [K�zpontos�tottak]  WHERE ([K�zpontos�tottak].[Besorol�si fokozat megnevez�se:] Is Null OR [K�zpontos�tottak].[Besorol�si fokozat megnevez�se:]='')  AND ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null )  

 UNION SELECT 'K�zpontos�tottak' AS T�bla, 'Besorol�si fokozat k�d:' AS Hi�nyz�_�rt�k, K�zpontos�tottak.[Ad�azonos�t�], K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] FROM [K�zpontos�tottak]  WHERE ([K�zpontos�tottak].[Besorol�si fokozat k�d:] Is Null OR [K�zpontos�tottak].[Besorol�si fokozat k�d:]='')  AND ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null )   

UNION SELECT 'K�zpontos�tottak' AS T�bla, '�ll�shely bet�lt�s�nek ar�nya �s �res �ll�shely bet�lt�s ar�nya' AS Hi�nyz�_�rt�k, K�zpontos�tottak.[Ad�azonos�t�], K�zpontos�tottak.[�ll�shely azonos�t�], K�zpontos�tottak.[Nexon sz�t�relemnek megfelel� szervezeti egys�g azonos�t�] FROM [K�zpontos�tottak]  WHERE ([K�zpontos�tottak].[Mez�13] Is Null )  AND ([K�zpontos�tottak].[Mez�4]<> '�res �ll�s' OR [K�zpontos�tottak].[Mez�4] is null )
)  AS 01b;
