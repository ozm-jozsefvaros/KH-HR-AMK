SELECT lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly.F�oszt AS [Enged�ly szerinti f�oszt�ly], lk�ll�shelyek.F�oszt AS [�NYR szerinti f�oszt�ly], lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly.[�ll�shely azonos�t�]
FROM lk�ll�shelyek INNER JOIN lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly ON lk�ll�shelyek.[�ll�shely azonos�t�] = lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly.[�ll�shely azonos�t�]
WHERE (((lk�ll�shelyek.F�oszt)<>[lk�ll�shelyekBels�Eloszt�saF�oszt�lyOszt�ly].[F�oszt]));
