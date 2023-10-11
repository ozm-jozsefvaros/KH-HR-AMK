SELECT lkEltérõBesorolásokÚj01.Név, lkEltérõBesorolásokÚj01.Fõosztály, lkEltérõBesorolásokÚj01.Osztály, lkEltérõBesorolásokÚj01.[Álláshely azonosító], lkEltérõBesorolásokÚj01.[Szervezeti struktúra], lkEltérõBesorolásokÚj01.[Személyi karton], lkEltérõBesorolásokÚj01.[Jogviszony típusa / jogviszony típus], lkEltérõBesorolásokÚj01.[Tartós távollét típusa]
FROM lkEltérõBesorolásokÚj01
WHERE (((lkEltérõBesorolásokÚj01.[Szervezeti struktúra])<>[Személyi karton]));
