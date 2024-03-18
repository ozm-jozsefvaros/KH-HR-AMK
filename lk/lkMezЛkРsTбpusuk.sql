SELECT tSzemélyMezõk.Az, tSzemélyMezõk.Oszlopnév, tSzemélyMezõk.Típus, tSzemélyMezõk.Mezõnév, tSzemélyMezõk.Skip, tMezõTípusok.Constant, tMezõTípusok.Description, tMezõTípusok.DbType
FROM tSzemélyMezõk INNER JOIN tMezõTípusok ON tSzemélyMezõk.Típus = tMezõTípusok.Value;
