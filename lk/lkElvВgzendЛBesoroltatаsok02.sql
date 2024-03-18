SELECT lkElvégzendõBesoroltatások01.BFKH AS BFKH, lkElvégzendõBesoroltatások01.Adójel AS Adójel, lkElvégzendõBesoroltatások01.Fõosztály AS Fõosztály, lkElvégzendõBesoroltatások01.Osztály AS Osztály, lkElvégzendõBesoroltatások01.Név AS Név, lkElvégzendõBesoroltatások01.[Utolsó besorolás dátuma] AS [Utolsó besorolás dátuma], kt_azNexon_Adójel.NLink AS NLink
FROM lkElvégzendõBesoroltatások01 LEFT JOIN kt_azNexon_Adójel ON lkElvégzendõBesoroltatások01.Adójel = kt_azNexon_Adójel.Adójel
ORDER BY lkElvégzendõBesoroltatások01.BFKH, lkElvégzendõBesoroltatások01.Név;
