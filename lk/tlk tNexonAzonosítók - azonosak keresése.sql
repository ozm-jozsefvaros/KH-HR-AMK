DELETE tNexonAzonos�t�k.Azonos�t�
FROM tNexonAzonos�t�k
WHERE (((tNexonAzonos�t�k.Azonos�t�) In (Select FirstOfAzonos�t� From [tNexonAzonos�t�k - azonosak keres�se])));
