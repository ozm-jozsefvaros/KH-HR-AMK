SELECT lkOrvosiVizsg�latTeljes�llom�ny_munkahelyStatisztika01.Oldal, lkOrvosiVizsg�latTeljes�llom�ny_munkahelyStatisztika01.Ker�let, Count(lkOrvosiVizsg�latTeljes�llom�ny_munkahelyStatisztika01.[TAJ sz�m]) AS L�tsz�m
FROM lkOrvosiVizsg�latTeljes�llom�ny_munkahelyStatisztika01
GROUP BY lkOrvosiVizsg�latTeljes�llom�ny_munkahelyStatisztika01.Oldal, lkOrvosiVizsg�latTeljes�llom�ny_munkahelyStatisztika01.Ker�let;
