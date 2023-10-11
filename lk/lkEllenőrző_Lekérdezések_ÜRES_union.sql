SELECT 'Kil�p�k' AS T�bla, 'Besorol�si fokozat megnevez�se:' AS Hi�nyz�_�rt�k, Kil�p�k.[Ad�azonos�t�], Kil�p�k.[�ll�shely azonos�t�], Kil�p�k.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [Kil�p�k] WHERE ([Kil�p�k].[Besorol�si fokozat megnevez�se:] Is Null OR [Kil�p�k].[Besorol�si fokozat megnevez�se:] = '')
UNION
SELECT 'Hat�rozottak' AS T�bla, 'Megyei szint VAGY J�r�si Hivatal' AS Hi�nyz�_�rt�k, Hat�rozottak.[Ad�azonos�t�], Hat�rozottak.[�ll�shely azonos�t�], Hat�rozottak.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [Hat�rozottak] WHERE ([Hat�rozottak].[Megyei szint VAGY J�r�si Hivatal] Is Null OR [Hat�rozottak].[Megyei szint VAGY J�r�si Hivatal] = '')
UNION
SELECT 'Hat�rozottak' AS T�bla, 'Mez�5' AS Hi�nyz�_�rt�k, Hat�rozottak.[Ad�azonos�t�], Hat�rozottak.[�ll�shely azonos�t�], Hat�rozottak.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [Hat�rozottak] WHERE ([Hat�rozottak].[Mez�5] Is Null OR [Hat�rozottak].[Mez�5] = '')
UNION
SELECT 'Hat�rozottak' AS T�bla, 'Mez�6' AS Hi�nyz�_�rt�k, Hat�rozottak.[Ad�azonos�t�], Hat�rozottak.[�ll�shely azonos�t�], Hat�rozottak.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [Hat�rozottak] WHERE ([Hat�rozottak].[Mez�6] Is Null OR [Hat�rozottak].[Mez�6] = '')
UNION
SELECT 'Hat�rozottak' AS T�bla, '�NYR SZERVEZETI EGYS�G AZONOS�T�' AS Hi�nyz�_�rt�k, Hat�rozottak.[Ad�azonos�t�], Hat�rozottak.[�ll�shely azonos�t�], Hat�rozottak.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [Hat�rozottak] WHERE ([Hat�rozottak].[�NYR SZERVEZETI EGYS�G AZONOS�T�] Is Null OR [Hat�rozottak].[�NYR SZERVEZETI EGYS�G AZONOS�T�] = '')
UNION
SELECT 'Hat�rozottak' AS T�bla, 'Besorol�si fokozat megnevez�se:' AS Hi�nyz�_�rt�k, Hat�rozottak.[Ad�azonos�t�], Hat�rozottak.[�ll�shely azonos�t�], Hat�rozottak.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [Hat�rozottak] WHERE ([Hat�rozottak].[Besorol�si fokozat megnevez�se:] Is Null OR [Hat�rozottak].[Besorol�si fokozat megnevez�se:] = '')
UNION SELECT 'Hat�rozottak' AS T�bla, 'Mez�24' AS Hi�nyz�_�rt�k, Hat�rozottak.[Ad�azonos�t�], Hat�rozottak.[�ll�shely azonos�t�], Hat�rozottak.[�NYR SZERVEZETI EGYS�G AZONOS�T�] FROM [Hat�rozottak] WHERE ([Hat�rozottak].[Mez�24] Is Null OR [Hat�rozottak].[Mez�24] = '');
