SELECT tLegmagasabbVégzettség04.[Dolgozó azonosító], First(tLegmagasabbVégzettség04.azFok) AS FirstOfazFok
FROM tLegmagasabbVégzettség04
GROUP BY tLegmagasabbVégzettség04.[Dolgozó azonosító]
ORDER BY tLegmagasabbVégzettség04.[Dolgozó azonosító], First(tLegmagasabbVégzettség04.azFok) DESC;
