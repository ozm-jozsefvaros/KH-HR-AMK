SELECT DISTINCT tSzemélyek.[Elsõdleges feladatkör], tSzemélyek.[Dolgozó teljes neve]
FROM tSzemélyek
GROUP BY tSzemélyek.[Elsõdleges feladatkör], tSzemélyek.[Dolgozó teljes neve]
HAVING (((tSzemélyek.[Elsõdleges feladatkör]) Like "Lezárt*"));
