SELECT lkElv�gzend�Besoroltat�sok01.BFKH AS BFKH, lkElv�gzend�Besoroltat�sok01.Ad�jel AS Ad�jel, lkElv�gzend�Besoroltat�sok01.F�oszt�ly AS F�oszt�ly, lkElv�gzend�Besoroltat�sok01.Oszt�ly AS Oszt�ly, lkElv�gzend�Besoroltat�sok01.N�v AS N�v, lkElv�gzend�Besoroltat�sok01.[Utols� besorol�s d�tuma] AS [Utols� besorol�s d�tuma], kt_azNexon_Ad�jel.NLink AS NLink
FROM lkElv�gzend�Besoroltat�sok01 LEFT JOIN kt_azNexon_Ad�jel ON lkElv�gzend�Besoroltat�sok01.Ad�jel = kt_azNexon_Ad�jel.Ad�jel
ORDER BY lkElv�gzend�Besoroltat�sok01.BFKH, lkElv�gzend�Besoroltat�sok01.N�v;
