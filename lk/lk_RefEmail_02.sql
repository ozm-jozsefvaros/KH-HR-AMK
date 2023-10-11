SELECT lk_RefEmail_01.azSzervezet, lk_RefEmail_01.[Szervezeti egység kódja], lk_RefEmail_01.azRef, lk_RefEmail_01.[Hivatali email], (Select Count(Tmp.AzSzervezet)
    From lk_RefEmail_01 As Tmp
    Where Tmp.azRef <= lk_RefEmail_01.azRef
      AND Tmp.[Szervezeti egység kódja] =lk_RefEmail_01.[Szervezeti egység kódja]
   ) AS Sorszám, lk_RefEmail_01.Fõosztály, lk_RefEmail_01.Osztály
FROM lk_RefEmail_01;
