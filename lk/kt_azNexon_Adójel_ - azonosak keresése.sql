SELECT First(kt_azNexon_Ad�jel.[azNexon]) AS [azNexon Mez�], First(kt_azNexon_Ad�jel.[Ad�jel]) AS [Ad�jel Mez�], Count(kt_azNexon_Ad�jel.[azNexon]) AS AzonosakSz�ma
FROM kt_azNexon_Ad�jel
GROUP BY kt_azNexon_Ad�jel.[azNexon], kt_azNexon_Ad�jel.[Ad�jel]
HAVING (((Count([kt_azNexon_Ad�jel].[azNexon]))>1) AND ((Count([kt_azNexon_Ad�jel].[Ad�jel]))>1));
