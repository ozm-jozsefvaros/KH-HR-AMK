SELECT lkBesorolásEmeléshez01.BFKH, lkBesorolásEmeléshez01.Fõosztály, lkBesorolásEmeléshez01.Osztály, lkBesorolásEmeléshez01.Adójel, lkBesorolásEmeléshez01.Név, lkBesorolásEmeléshez01.[Jogviszony típusa], lkBesorolásEmeléshez01.besorolás AS [Jelenlegi beorolás], lkBesorolásEmeléshez01.[alsó határ] AS [Jelenlegi alsó határ], lkBesorolásEmeléshez01.[felsõ határ] AS [Jelenlegi felsó határ], lkBesorolásEmeléshez01.[40 órás illetmény], lkBesorolásEmeléshez01.alsó2 AS [Emelt alsó határ], lkBesorolásEmeléshez01.felsõ2 AS [Emelt felsõ határ], *
FROM lkBesorolásEmeléshez01
WHERE (((lkBesorolásEmeléshez01.besorolás)="Vezetõ-hivatalitanácsos")) OR (((lkBesorolásEmeléshez01.besorolás)="Hivatali tanácsos"))
ORDER BY lkBesorolásEmeléshez01.Adójel, lkBesorolásEmeléshez01.[40 órás illetmény];
