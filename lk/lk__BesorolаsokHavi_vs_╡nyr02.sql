SELECT lk__Besorol�sokHavi_vs_�nyr01.F�oszt�ly AS F�oszt�ly, lk__Besorol�sokHavi_vs_�nyr01.Szervezet AS Oszt�ly, lkSzem�lyek.[Dolgoz� teljes neve] AS N�v, lk__Besorol�sokHavi_vs_�nyr01.[�ll�shely azonos�t�] AS [St�tusz k�d], lk__Besorol�sokHavi_vs_�nyr01.NexonHavi AS [Nexon havi], lk__Besorol�sokHavi_vs_�nyr01.�NYR AS �NYR, lk__Besorol�sokHavi_vs_�nyr01.[Besorol�si fokozat k�d:] AS [Besorol�s k�d], kt_azNexon_Ad�jel02.NLink AS NLink
FROM (lkSzem�lyek RIGHT JOIN lk__Besorol�sokHavi_vs_�nyr01 ON lkSzem�lyek.[St�tusz k�dja] = lk__Besorol�sokHavi_vs_�nyr01.[�ll�shely azonos�t�]) LEFT JOIN kt_azNexon_Ad�jel02 ON lkSzem�lyek.Ad�jel = kt_azNexon_Ad�jel02.Ad�jel
ORDER BY lk__Besorol�sokHavi_vs_�nyr01.BFKH;
