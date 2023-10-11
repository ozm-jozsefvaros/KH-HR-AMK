SELECT lk_RefEmail_01.azSzervezet, lk_RefEmail_01.[Szervezeti egys�g k�dja], lk_RefEmail_01.azRef, lk_RefEmail_01.[Hivatali email], (Select Count(Tmp.AzSzervezet)
    From lk_RefEmail_01 As Tmp
    Where Tmp.azRef <= lk_RefEmail_01.azRef
      AND Tmp.[Szervezeti egys�g k�dja] =lk_RefEmail_01.[Szervezeti egys�g k�dja]
   ) AS Sorsz�m, lk_RefEmail_01.F�oszt�ly, lk_RefEmail_01.Oszt�ly
FROM lk_RefEmail_01;
