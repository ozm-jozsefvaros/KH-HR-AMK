SELECT tSzem�lyMez�k.Az, tSzem�lyMez�k.Oszlopn�v, tSzem�lyMez�k.T�pus, tSzem�lyMez�k.Mez�n�v, tSzem�lyMez�k.Skip, tMez�T�pusok.Constant, tMez�T�pusok.Description, tMez�T�pusok.DbType
FROM tSzem�lyMez�k INNER JOIN tMez�T�pusok ON tSzem�lyMez�k.T�pus = tMez�T�pusok.Value;
