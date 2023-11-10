SELECT IlletményUnió.Fõosztály, IlletményUnió.Név, IlletményUnió.besorolás, IlletményUnió.[alsó határ], IlletményUnió.[felsõ határ], IlletményUnió.Illetmény, IlletményUnió.[Heti munkaórák száma], IlletményUnió.[40 órás illetmény], IlletményUnió.[Jogviszony típusa], IlletményUnió.Hivatkozás AS NLink
FROM (SELECT DISTINCT *
FROM lk_Illetménysávok_és_illetmények_havi_alapján_02
UNION SELECT *
FROM  lk_Illetménysávok_és_illetmények_személytörzs_alapján
)  AS IlletményUnió
ORDER BY bfkh([Szervezetkód]);
