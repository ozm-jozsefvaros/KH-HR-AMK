SELECT tLegmagasabbV�gzetts�g04.[Dolgoz� azonos�t�], First(tLegmagasabbV�gzetts�g04.azFok) AS FirstOfazFok
FROM tLegmagasabbV�gzetts�g04
GROUP BY tLegmagasabbV�gzetts�g04.[Dolgoz� azonos�t�]
ORDER BY tLegmagasabbV�gzetts�g04.[Dolgoz� azonos�t�], First(tLegmagasabbV�gzetts�g04.azFok) DESC;
