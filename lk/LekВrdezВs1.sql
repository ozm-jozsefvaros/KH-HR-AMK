SELECT lk�ll�shelyek.[�ll�shely azonos�t�], lk�ll�shelyek.F�oszt, lk�ll�shelyek.Oszt, lkJ�r�siKorm�nyK�zpontos�tottUni�.[�ll�shely azonos�t�]
FROM lkJ�r�siKorm�nyK�zpontos�tottUni� RIGHT JOIN lk�ll�shelyek ON lkJ�r�siKorm�nyK�zpontos�tottUni�.[�ll�shely azonos�t�] = lk�ll�shelyek.[�ll�shely azonos�t�];
