SELECT First(tKSZDR.[Ad�azonos�t� jel]) AS [Ad�azonos�t� jel Mez�], Count(tKSZDR.[Ad�azonos�t� jel]) AS AzonosakSz�ma
FROM tKSZDR
GROUP BY tKSZDR.[Ad�azonos�t� jel]
HAVING (((Count(tKSZDR.[Ad�azonos�t� jel]))>1));
