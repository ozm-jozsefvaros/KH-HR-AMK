SELECT First(tKSZDR.[Adóazonosító jel]) AS [Adóazonosító jel Mezõ], Count(tKSZDR.[Adóazonosító jel]) AS AzonosakSzáma
FROM tKSZDR
GROUP BY tKSZDR.[Adóazonosító jel]
HAVING (((Count(tKSZDR.[Adóazonosító jel]))>1));
