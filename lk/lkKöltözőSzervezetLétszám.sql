SELECT lkKeresend�k.Sorsz�m, Tmp.F�oszt�ly, Tmp.Oszt�ly_, Tmp.L�tsz�m
FROM lkKeresend�k, lkF�oszt�lyon�ntiOszt�lyonk�ntiL�tsz�m AS Tmp
WHERE (((Tmp.F�oszt�ly)=[lkKeresend�k].[F�oszt�ly]) AND ((Tmp.Oszt�ly_)=[lkKeresend�k].[Oszt�ly])) OR (((Tmp.F�oszt�ly)=[lkKeresend�k].[F�oszt�ly]) AND ((Tmp.Oszt�ly_) Like [lkKeresend�k].[Oszt�ly]))
ORDER BY lkKeresend�k.Sorsz�m, Tmp.BFKH DESC , Tmp.Sor;
