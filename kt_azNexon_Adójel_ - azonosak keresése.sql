SELECT First(kt_azNexon_Adójel.[azNexon]) AS [azNexon Mezõ], First(kt_azNexon_Adójel.[Adójel]) AS [Adójel Mezõ], Count(kt_azNexon_Adójel.[azNexon]) AS AzonosakSzáma
FROM kt_azNexon_Adójel
GROUP BY kt_azNexon_Adójel.[azNexon], kt_azNexon_Adójel.[Adójel]
HAVING (((Count([kt_azNexon_Adójel].[azNexon]))>1) AND ((Count([kt_azNexon_Adójel].[Adójel]))>1));
