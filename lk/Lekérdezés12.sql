SELECT DISTINCT tSzem�lyek.[Els�dleges feladatk�r], tSzem�lyek.[Dolgoz� teljes neve]
FROM tSzem�lyek
GROUP BY tSzem�lyek.[Els�dleges feladatk�r], tSzem�lyek.[Dolgoz� teljes neve]
HAVING (((tSzem�lyek.[Els�dleges feladatk�r]) Like "Lez�rt*"));
