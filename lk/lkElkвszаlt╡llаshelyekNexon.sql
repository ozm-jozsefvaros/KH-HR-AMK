SELECT lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly.F�oszt AS [Enged�ly szerinti f�oszt�ly], lk�ll�shelyekHavib�l.F�oszt, lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly.[�ll�shely azonos�t�]
FROM lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly INNER JOIN lk�ll�shelyekHavib�l ON lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly.[�ll�shely azonos�t�] = lk�ll�shelyekHavib�l.[�ll�shely azonos�t�]
WHERE (((lk�ll�shelyekHavib�l.F�oszt)<>[lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly].[F�oszt]));
