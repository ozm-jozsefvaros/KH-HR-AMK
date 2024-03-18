SELECT tHozzátartozók.*, Nz([Dolgozó adóazonosító jele],0)*1 AS Adójel
FROM tHozzátartozók;
