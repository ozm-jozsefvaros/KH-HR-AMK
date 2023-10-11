SELECT lk__EltérõBesorolások.SzervezetKód, lk__EltérõBesorolások.Fõosztály, lk__EltérõBesorolások.Álláshely, lk__EltérõBesorolások.[Személyi karton], lk__EltérõBesorolások.[Szervezeti struktúra], lk__EltérõBesorolások.[Dolgozó teljes neve], lk__EltérõBesorolások.[Tartós távollét típusa], lk__EltérõBesorolások.[Helyettesített dolgozó neve], lk__EltérõBesorolások.Link, lk__EltérõBesorolások.Ányr_vs_Szervezeti, lk__EltérõBesorolások.Szervezeti_vs_Személyi, lk__EltérõBesorolások.Ány_vs_Személyi, *
FROM lk__EltérõBesorolások
WHERE (((lk__EltérõBesorolások.Ányr_vs_Szervezeti)=False) AND ((lk__EltérõBesorolások.Ány_vs_Személyi)=True))
ORDER BY lk__EltérõBesorolások.SzervezetKód, lk__EltérõBesorolások.[Dolgozó teljes neve];
