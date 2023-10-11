SELECT lk__EltérõBesorolások.SzervezetKód, lk__EltérõBesorolások.Fõosztály, lk__EltérõBesorolások.Álláshely, lk__EltérõBesorolások.[Személyi karton], lk__EltérõBesorolások.[Szervezeti struktúra], lk__EltérõBesorolások.[Dolgozó teljes neve], lk__EltérõBesorolások.[Tartós távollét típusa], lk__EltérõBesorolások.[Helyettesített dolgozó neve], lk__EltérõBesorolások.Link
FROM lk__EltérõBesorolások
WHERE (((lk__EltérõBesorolások.[Személyi karton])<>[Szervezeti struktúra]) AND ((lk__EltérõBesorolások.Betöltött)=True) AND ((lk__EltérõBesorolások.Szervezeti_vs_Személyi)=False))
ORDER BY lk__EltérõBesorolások.SzervezetKód, lk__EltérõBesorolások.[Dolgozó teljes neve];
